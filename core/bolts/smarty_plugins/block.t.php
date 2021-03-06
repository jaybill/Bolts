<?php

/*
	Title: smarty_block_t
		Identical to <smarty_block_translate>.

	About: Author
		Rich Joslin

	About: License
		<http://Bolts/docs/license>

	Function: smarty_block_translate
		Identical to <smarty_block_translate>.

	Arguments:
		$params - An array of variables. (TBD)
		$content - This is everything between the block start and end tags in the template.
		&$smarty - TBD
		&$repeat - TBD

	Params:
		TBD

	Returns:
		A translated string.

	Execution Example:
		(begin example)
			<!-- as used in a Smarty view template -->
			{t}This text will be translated based on the user's chosen locale.{/t}
		(end example)

	About: See Also
		- <smarty_block_translate>
		- <Bolts_Translate/translate>
*/
function smarty_block_t($params, $content, $smarty, $repeat) {
	$tpl_vars = $smarty->_tpl_vars;
    // only output on the closing tag
    if (!$repeat) {
        if (isset($content)) {
			$do_translation = true;
			if ($smarty->_tpl_vars['isAdminController'] && Bolts_Registry::get('enable_admin_localization') == '0') {
				$do_translation = false;
			}
			if ($params['replace']) {
				return Bolts_Translate::translate($tpl_vars['locale_code'], "default", $content, $params['replace'], $do_translation);
			} else {
				return Bolts_Translate::translate($tpl_vars['locale_code'], "default", $content, null, $do_translation);
			}
		}
	}
}
