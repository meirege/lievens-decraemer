<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * Installer for the portfolio module
 *
 * @author Gert-Jan Meire <gertjan.meire@gmail.com>
 */
class PortfolioInstaller extends ModuleInstaller
{
	/**
	 * Install the module
	 */
	public function install()
	{
		$this->importSQL(dirname(__FILE__) . '/data/install.sql');

		$this->addModule('portfolio');

		$this->importLocale(dirname(__FILE__) . '/data/locale.xml');

		$this->makeSearchable('portfolio');
		$this->setModuleRights(1, 'portfolio');

		$this->setActionRights(1, 'portfolio', 'index');
		$this->setActionRights(1, 'portfolio', 'categories');
		$this->setActionRights(1, 'portfolio', 'add');
		$this->setActionRights(1, 'portfolio', 'add_category');
		$this->setActionRights(1, 'portfolio', 'edit');
		$this->setActionRights(1, 'portfolio', 'edit_category');
		$this->setActionRights(1, 'portfolio', 'delete');
		$this->setActionRights(1, 'portfolio', 'delete_category');
		$this->setActionRights(1, 'portfolio', 'settings');

		$faqId = $this->insertExtra('portfolio', 'block', 'Portfolio');

		// $this->setSetting('portfolio', 'number_of_items_to_show', false);

		// set navigation
		$navigationModulesId = $this->setNavigation(null, 'Modules');
		$navigationPortfolioId = $this->setNavigation($navigationModulesId, 'Portfolio');
		$this->setNavigation($navigationPortfolioId, 'PortfolioWork', 'portfolio/index', array('portfolio/add', 'portfolio/edit', 'portfolio/delete'));
		$this->setNavigation($navigationPortfolioId, 'Categories', 'portfolio/categories', array('portfolio/add_category', 'portfolio/edit_category', 'portfolio/delete_category'));
		$navigationSettingsId = $this->setNavigation(null, 'Settings');
		$navigationModulesId = $this->setNavigation($navigationSettingsId, 'Modules');
		$this->setNavigation($navigationModulesId, 'Portfolio', 'portfolio/settings');
	}
}
