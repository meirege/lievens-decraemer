<?php
/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Add category action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioAddCategory extends BackendBaseActionAdd
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->loadForm();
		$this->validateForm();

		$this->parse();
		$this->display();
	}

	/**
	 * Load the form
	 */
	private function loadForm()
	{
		// Create form and fields
		$this->frm = new BackendForm('add_category');
		$this->frm->addText('title', null, null, 'inputText title', 'inputTextError title');

		// Create meta
		$this->meta = new BackendMeta($this->frm, null, 'title', true);
	}

	/**
	 * Validate the form
	 */
	private function validateForm()
	{
		if($this->frm->isSubmitted())
		{
			// Set URL callback
			$this->meta->setURLCallback('BackendPortfolioModel', 'getURLForCategory');

			// Clean up fields
			$this->frm->cleanupFields();

			// Validate required fields
			$this->frm->getField('title')->isFilled(BL::err('FieldIsRequired'));

			// Validate the meta
			$this->meta->validate();

			if($this->frm->isCorrect())
			{
				// Build the item
				$item = array(
					'meta_id' => $this->meta->save(),
					'title' => $this->frm->getField('title')->getValue(),
					'language' => BL::getWorkingLanguage()
				);

				$categoryId = BackendPortfolioModel::insertCategory($item);

				$this->redirect(BackendModel::createURLForAction('categories') . '&report=added-category&var=' . urlencode($item['title']) . '&highlight=row-' . $categoryId);
			}
		}
	}
}