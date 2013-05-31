<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Edit action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioEdit extends BackendBaseActionEdit
{
	/**
	 * @var $categories An array that holds all available categories
	 */
	private $categories;

	/**
	 * Execute the action
	 */
	public function execute()
	{
		$this->workId = $this->getParameter('id', 'int');
		$this->userId = BackendAuthentication::getUser()->getUserId();

		if($this->workId != null && BackendPortfolioModel::exists($this->workId, $this->userId))
		{
			parent::execute();

			$this->getData();
			$this->loadForm();
			$this->validateForm();

			$this->parse();
			$this->display();
		}
		else $this->redirect(BackendModel::createURLForAction('index') . '&error=non-existing');
	}


	/**
	 * Get the data
	 */
	private function getData()
	{
		$this->work = BackendPortfolioModel::getWorkById($this->workId, $this->userId);
		$this->categories = array_values(BackendPortfolioModel::getCategoriesForDropdown());
	}

	/**
	 * Load the form
	 */
	private function loadForm()
	{
		$this->frm = new BackendForm('add');

		$rbtHiddenValues[] = array('label' => BL::lbl('Hidden', $this->getModule()), 'value' => 'Y');
		$rbtHiddenValues[] = array('label' => BL::lbl('Published', $this->getModule()), 'value' => 'N');

		$this->frm->addText('title', $this->work['title'], null, 'inputText title');
		$this->frm->addImage('headerImage');
		$this->frm->addEditor('description', $this->work['description']);
		$this->frm->addEditor('created_with', $this->work['created_with']);
		$this->frm->addEditor('contribution', $this->work['contribution']);
		$this->frm->addRadiobutton('hidden', $rbtHiddenValues, 'N', $this->work['hidden']);
		$this->frm->addDate('publish_on_date', $this->work['created_on']);
		$this->frm->addTime('publish_on_time', $this->work['created_on']);
		$this->frm->addDropdown('category', $this->categories, $this->work['category_id']);

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
			$this->meta->setURLCallback('BackendPortfolioModel', 'getURLForWork');

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
					'category_id' => BackendPortfolioModel::getCategoryId($this->categories[$this->frm->getField('category')->getValue()]),
					'user_id' => BackendAuthentication::getUser()->getUserId(),
					'meta_id' => $this->meta->save(),
					'language' => BL::getWorkingLanguage(),
					'title' => $this->frm->getField('title')->getValue(),
					'created_with' => $this->frm->getField('created_with')->getValue(),
					'contribution' => $this->frm->getField('contribution')->getValue(),
					'description' => $this->frm->getField('description')->getValue(),
					'created_on' => BackendModel::getUTCDate(),
					'edited_on' => BackendModel::getUTCDate(),
					'hidden' => $this->frm->getField('hidden')->getValue(),
					'language' => BL::getWorkingLanguage()
				);

				$workId = BackendPortfolioModel::insert($item);

				$this->redirect(BackendModel::createURLForAction('index') . '&report=added-work&var=' . urlencode($item['title']) . '&highlight=row-' . $workId);
			}
		}
	}

	/**
	 * Parse the data in the template
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('item', $this->work);

		//Get url of the product
        $url = BackendModel::getURLForBlock($this->URL->getModule(), 'detail');
        $url404 = BackendModel::getURL(404);

        //parse other variables
        if($url404 != $url) $this->tpl->assign('detailURL', SITE_URL . $url);
		
	}
}