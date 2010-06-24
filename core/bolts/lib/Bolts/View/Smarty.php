<?php

/*
	Class: Bolts_View_Smarty

	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>
*/
class Bolts_View_Smarty extends Smarty {

	function _smarty_include($params) {
		$theme_locations = Zend_Registry::get('theme_locations');
		$basepath = Zend_Registry::get('basepath');
		
		if ($this->_tpl_vars['isAdminController']) {
			$theme_global = $theme_locations['admin']['current_theme']['path'];
			$default_global = $basepath . "/core/bolts/views/admin";
		} else {
			$theme_global = $theme_locations['frontend']['current_theme']['path'];
			$default_global = $basepath . "/core/bolts/views/frontend";
		}
		$file = substr( $params['smarty_include_tpl_file'], strlen("file:"));
		if (!file_exists($file)) {
			$params['smarty_include_tpl_file'] = str_replace($theme_global, $default_global, $params['smarty_include_tpl_file']);
		}
		$file = substr( $params['smarty_include_tpl_file'], strlen("file:"));
		if (!file_exists($file)) {
			throw new Exception("MISSING_TEMPLATE - The template file does not exist: " . $file);
		}
		return parent::_smarty_include($params);
	}

}
