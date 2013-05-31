<?php
/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Delete action for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioDelete extends BackendBaseActionDelete
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->id = $this->getParameter('id', 'int');

		if($this->id != null && BackendPortfolioModel::doesWorkExist($this->id))
		{
			$this->record = BackendPortfolioModel::getWorkById($this->id);
			
			BackendPortfolioModel::delete($this->id);
			$this->redirect(BackendModel::createURLForAction('index') . '&report=deleted-work&var=' . urlencode($this->record['title']));
		}
		else $this->redirect(BackendModel::createURLForAction('index') . '&error=non-existing');
	}
}