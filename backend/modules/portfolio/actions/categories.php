<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Categories action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioCategories extends BackendBaseActionIndex
{
	/**
	 * @var $datagrids A datagrid to hold the categories
	 */
	private $datagrid;

	/**
	 * @var $categories Holds the categories
	 */
	private $categories = array();

	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->getData();
		
		if(!empty($this->categories))
		{
			$this->loadDatagrid();
			$this->parse();
		}

		$this->display();
	}

	/**
	 * Get the data for the categories datagrid
	 */
	private function getData()
	{
		$this->categories = BackendPortfolioModel::getCategories();
	}

	/**
	 * Load the data grids
	 */
	private function loadDatagrid()
	{
		$this->datagrid = new BackendDataGridArray($this->categories);

		// Set title column as a link to edit the category
		$this->datagrid->setColumnURL('title', BackendModel::createURLForAction('edit_category') . '&amp;id=[id]');

		// Add edit column
		$this->datagrid->addColumn('edit', null, BL::lbl('Edit'), BackendModel::createURLForAction('edit_category') . '&amp;id=[id]');
	}

	/**
	 * Parse the data in the template
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('datagrid', $this->datagrid->getContent());
	}
}