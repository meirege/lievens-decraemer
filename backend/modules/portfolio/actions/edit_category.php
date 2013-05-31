<?php
/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Edit category action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioEditCategory extends BackendBaseActionEdit
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		$this->id = $this->getParameter('id', 'int');

		if($this->id != null && BackendPortfolioModel::doesCategoryExist($this->id))
		{
			parent::execute();

			$this->getData();
			$this->loadForm();
			$this->validateForm();

			$this->parse();
			$this->display();
		}
		else $this->redirect(BackendModel::createURLForAction('categories') . '&error=non-existing');
	}

	/**
	 * Get the data for the category to edit
	 */
	private function getData()
	{
		$this->category = BackendPortfolioModel::getCategory($this->id);
	}

	/**
	 * Load the form
	 */
	private function loadForm()
	{
		// Create form and fields
		$this->frm = new BackendForm('edit_category');
		$this->frm->addText('title', $this->category['title'], null, 'inputText title', 'inputTextError title');

		// Create meta
		$this->meta = new BackendMeta($this->frm, $this->category['meta_id'], 'title', true);
	}

	/**
	 * Parse the data in the template
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('item', $this->category);
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
					'id' => $this->id,
					'meta_id' => $this->meta->save(),
					'title' => $this->frm->getField('title')->getValue(),
					'language' => BL::getWorkingLanguage()
				);

				$categoryId = BackendPortfolioModel::updateCategory($item);

				$this->redirect(BackendModel::createURLForAction('categories') . '&report=edited-category&var=' . urlencode($item['title']) . '&highlight=row-' . $categoryId);
			}
		}
	}
}