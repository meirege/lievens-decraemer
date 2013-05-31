<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * This is the detail-action
 *
 * @author Gert-Jan Meire <gertjan.meire@gmail.com>
 */
class FrontendPortfolioDetail extends FrontendBaseBlock
{
	/**
	 * Execute the extra
	 */
	public function execute()
	{
		parent::execute();

		$this->getData();

		$this->loadTemplate();
		$this->parse();
	}

	/**
	 * Load the data, don't forget to validate the incoming data
	 */
	private function getData()
	{
		
	}

	/**
	 * Parse the data into the template
	 */
	private function parse()
	{
		
	}
}
