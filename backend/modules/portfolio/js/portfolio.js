/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

/**
 * This is the javascript file for the portfolio module
 *
 * @author Gert-Jan Meire <gertjan.meire@gmail.com>
 */
jsBackend.portfolio =
{
    init: function()
    {
        //Do meta
        if($('#title').length > 0) $('#title').doMeta();
    }
}

$(jsBackend.portfolio.init);