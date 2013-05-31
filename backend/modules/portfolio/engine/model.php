<?php
/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * This holds all generic functions for the portfolio module
 *
 * @author Gert-Jan Meire <http://www.gertjanmeire.be>
 */
class BackendPortfolioModel
{
	/**
	 * Delete a work
	 * @param  int $id The id of the work
	 */
	public static function delete($id)
	{
		BackendModel::getContainer()->get('database')->delete('portfolio_works', 'id = ?', array((int) $id));
		BackendModel::invalidateFrontendCache('portfolio', BL::getWorkingLanguage());
	}

	/**
	 * Delete a category
	 * @param  int $id The id of the category
	 */
	public static function deleteCategory($id)
	{
		// Get the item of the category
		$item = self::getCategory($id);

		BackendModel::getContainer()->get('database')->delete('meta', 'id = ?', array((int) $item['meta_id']));
		BackendModel::getContainer()->get('database')->delete('portfolio_categories', 'id = ?', array((int) $id));

		BackendModel::invalidateFrontendCache('portfolio', BL::getWorkingLanguage());
	}

	/**
	 * Checks if a category exist
	 * 
	 * @param  int $id The id of the category
	 * @return bool
	 */
	public static function doesCategoryExist($id)
	{
		return (bool) BackendModel::getContainer()->get('database')->getVar(
			'SELECT 1
			 FROM portfolio_categories AS i
			 WHERE i.id = ?',
			 array((int) $id)
		);
	}

	/**
	 * Checks if a category exist
	 * 
	 * @param  int $id The id of the category
	 * @return bool
	 */
	public static function doesWorkExist($id)
	{
		return (bool) BackendModel::getContainer()->get('database')->getVar(
			'SELECT 1
			 FROM portfolio_works AS i
			 WHERE i.id = ?',
			 array((int) $id)
		);
	}

	/**
	 * Check if a work exists based on it's id
	 *
	 * @param int $id The id of the work
	 * @param int $userId The userId of the logged in user
	 * @return bool
	 */
	public static function exists($id, $userId)
	{
		return (bool) BackendModel::getContainer()->get('database')->getVar(
			'SELECT 1
			 FROM portfolio_works AS i
			 WHERE i.language = ? AND i.user_id = ? AND i.id = ?',
			 array(BL::getWorkingLanguage(), (int) $userId, (int) $id)
		);
	}

	/**
	 * Get the categories
	 * 
	 * @return array
	 */
	public static function getCategories()
	{
		return (array) BackendModel::getContainer()->get('database')->getRecords(
			'SELECT i.id, i.title
			 FROM portfolio_categories AS i
			 WHERE i.language = ?',
			 array(BL::getWorkingLanguage())
		);
	}

	/**
	 * Get the categories for a dropdown menu
	 * 
	 * @return array
	 */
	public static function getCategoriesForDropdown()
	{
		return (array) BackendModel::getContainer()->get('database')->getPairs(
			'SELECT i.id, i.title
			 FROM portfolio_categories AS i
			 WHERE i.language = ?',
			 array(BL::getWorkingLanguage()), 'id'
		);
	}

	/**
	 * Get a category based on it's id
	 * 
	 * @param  int $id The id of the category
	 * @return array
	 */
	public static function getCategory($id)
	{
		return (array) BackendModel::getContainer()->get('database')->getRecord(
			'SELECT i.id, i.title, i.meta_id
			 FROM portfolio_categories AS i
			 WHERE i.language = ? AND i.id = ?',
			 array(BL::getWorkingLanguage(), (int) $id)
		);
	}

	/**
	 * Get the id of the category
	 * 
	 * @param  string $categoryName The name of the category
	 * @return int
	 */
	public static function getCategoryId($categoryName)
	{
		return (int) BackendModel::getContainer()->get('database')->getVar(
			'SELECT i.id
			 FROM portfolio_categories AS i
			 WHERE i.title = ? AND i.language = ?',
			 array($categoryName, BL::getWorkingLanguage())
		);
	}

	/**
	 * Retrieve the unique URL for a category
	 *
	 * @param string $url
	 * @param int[optional] $id The id of the category to ignore.
	 * @return string
	 */
	public static function getURLForCategory($url, $id = null)
	{
		$url = SpoonFilter::urlise((string) $url);
		$db = BackendModel::getContainer()->get('database');

		// new category
		if($id === null)
		{
			if((bool) $db->getVar(
				'SELECT 1
				 FROM portfolio_categories AS i
				 INNER JOIN meta AS m ON i.meta_id = m.id
				 WHERE i.language = ? AND m.url = ?
				 LIMIT 1',
				array(BL::getWorkingLanguage(), $url)))
			{
				$url = BackendModel::addNumber($url);
				return self::getURLForCategory($url);
			}
		}
		// current category should be excluded
		else
		{
			if((bool) $db->getVar(
				'SELECT 1
				 FROM portfolio_categories AS i
				 INNER JOIN meta AS m ON i.meta_id = m.id
				 WHERE i.language = ? AND m.url = ? AND i.id != ?
				 LIMIT 1',
				array(BL::getWorkingLanguage(), $url, $id)))
			{
				$url = BackendModel::addNumber($url);
				return self::getURLForCategory($url, $id);
			}
		}

		return $url;
	}

	/**
	 * Retrieve the unique URL for a portfolio work
	 *
	 * @param string $url
	 * @param int[optional] $id The id of the work to ignore.
	 * @return string
	 */
	public static function getURLForWork($url, $id = null)
	{
		$url = SpoonFilter::urlise((string) $url);
		$db = BackendModel::getContainer()->get('database');

		// new work
		if($id === null)
		{
			if((bool) $db->getVar(
				'SELECT 1
				 FROM portfolio_works AS i
				 INNER JOIN meta AS m ON i.meta_id = m.id
				 WHERE i.language = ? AND m.url = ?
				 LIMIT 1',
				array(BL::getWorkingLanguage(), $url)))
			{
				$url = BackendModel::addNumber($url);
				return self::getURLForCategory($url);
			}
		}
		// current work should be excluded
		else
		{
			if((bool) $db->getVar(
				'SELECT 1
				 FROM portfolio_works AS i
				 INNER JOIN meta AS m ON i.meta_id = m.id
				 WHERE i.language = ? AND m.url = ? AND i.id != ?
				 LIMIT 1',
				array(BL::getWorkingLanguage(), $url, $id)))
			{
				$url = BackendModel::addNumber($url);
				return self::getURLForCategory($url, $id);
			}
		}

		return $url;
	}

	/**
	 * Get a work by it's id for a certain user
	 * 
	 * @param  int $id The id of the work
	 * @param  int $userId The id of the logged in user
	 * @return array
	 */
	public static function getWorkById($id, $userId)
	{
		return (array) BackendModel::getContainer()->get('database')->getRecord(
			'SELECT i.*
			 FROM portfolio_works AS i
			 WHERE i.language = ? AND i.id = ? AND i.user_id = ?',
			 array(BL::getWorkingLanguage(), (int) $id, (int) $userId)
		);
	}

	/**
	 * Get all the works of the portfolio
	 *
	 * @param int $userId The id of the currently logged in user
	 * @return array
	 */
	public static function getWorks($userId)
	{
		return (array) BackendModel::getContainer()->get('database')->getRecords(
			'SELECT i.id, i.category_id, i.title, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on, i.sequence, c.title AS category
			 FROM portfolio_works AS i
			 INNER JOIN portfolio_categories AS c ON c.id = i.category_id
			 WHERE i.language = ? AND i.user_id = ?',
			 array(BL::getWorkingLanguage(), (int) $userId)
		);
	}

	/**
	 * Insert a category
	 * @param  array $category The category data
	 * @return int
	 */
	public static function insertCategory($category)
	{
		return (int) BackendModel::getContainer()->get('database')->insert('portfolio_categories', $category);
	}

	/**
	 * Insert a work in a certain category
	 * 
	 * @param  array $work The work to insert
	 * @return int
	 */
	public static function insert($work)
	{
		return (int) BackendModel::getContainer()->get('database')->insert('portfolio_works', $work);
	}

	/**
	 * Check if a category contains portfolio work
	 * 
	 * @param  int  $id The id of the category
	 * @return boolean
	 */
	public static function isCategoryEmpty($id)
	{
		$result = BackendModel::getContainer()->get('database')->getRecords(
			'SELECT i.*
			 FROM portfolio_works AS i
			 WHERE i.category_id = ? AND i.language = ?',
			 array((int) $id, BL::getWorkingLanguage())
		);

		return (empty($result)) ? true : false;
	}

	public static function updateCategory($category)
	{
		return (int) BackendModel::getContainer()->get('database')->update('portfolio_categories', $category, 'id=?', array((int) $category['id']));
	}
}