<?php
/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Delete category action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioDeleteCategory extends BackendBaseActionDelete
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->id = $this->getParameter('id', 'int');

		if($this->id != null && BackendPortfolioModel::doesCategoryExist($this->id))
		{
			$this->record = BackendPortfolioModel::getCategory($this->id);

			if(BackendPortfolioModel::isCategoryEmpty($this->id))
			{
				BackendPortfolioModel::deleteCategory($this->id);
				$this->redirect(BackendModel::createURLForAction('categories') . '&report=deleted-category&var=' . urlencode($this->record['title']));
			}
			else $this->redirect(BackendModel::createURLForAction('categories') . '&error=category-is-not-empty');
		}
		else $this->redirect(BackendModel::createURLForAction('categories') . '&error=non-existing');
	}
}