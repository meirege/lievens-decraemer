<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Index action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioIndex extends BackendBaseActionIndex
{
	/**
	 * @var $datagrids An array of datagrids
	 */
	private $datagrids;

	/**
	 * @var $portfolioPerCategory An array that holds portfolio work per category
	 */
	private $portfolioPerCategory;

	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->getData();
		$this->parseData();
		$this->loadDatagrids();

		$this->parse();
		$this->display();
	}

	/**
	 * Get the data
	 */
	private function getData()
	{
		// Get the current user
		$userId = BackendAuthentication::getUser()->getUserId();

		// Get all the categories
		$this->categories = BackendPortfolioModel::getCategories();

		// Get the portfolio for this user
		$this->works = BackendPortfolioModel::getWorks($userId);
	}

	/**
	 * Load the data grids
	 */
	private function loadDatagrids()
	{
		// Loop through the $types array and per category create a datagrid
		foreach($this->portfolioPerCategory as $key => $portfolioType)
		{
			$datagrid = new BackendDataGridArray($portfolioType);

			//Enable drag & drop functionality
			$datagrid->enableSequenceByDragAndDrop();
			$datagrid->setAttributes(array('data-action' => 'sequence_works'));

			$datagrid->setColumnsSequence(array('dragAndDropHandle', 'title'));

			$datagrid->setColumnsHidden(array('category_id', 'category'));

			$datagrid->setColumnURL('title', BackendModel::createURLForAction('edit') . '&amp;id=[id]');

			$datagrid->addColumn('edit', BL::lbl('Edit'), 'edit', BackendModel::createURLForAction('edit') . '&id=[id]');

			//Change the header labels of the datagrids
			$datagrid->setHeaderLabels(array('category' => SpoonFilter::ucfirst(BL::lbl('Category'))));

			$this->datagrids[] = array('title' => $key, 'content' => $datagrid->getContent());
		}
	}

	/**
	 * Parse the data in the template
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('datagrids', $this->datagrids);

	}

	/**
	 * Parse the portfolio data in the right datagrids
	 */
	private function parseData()
	{
		// Loop all the portfolio work
		foreach($this->works as $work)
		{
			// For each work loop all categories and check if the category id's are the same
			foreach($this->categories as $category)
			{
				if($work['category_id'] == $category['id'])
				{
					// Put record in correct array structure
					$this->portfolioPerCategory[$category['title']][] = $work;
				}
			}
		}
	}
}