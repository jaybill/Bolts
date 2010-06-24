<?php

/*
	Class: Bolts_Uri

	About: Author
		Rich Joslin

	About: License
		<http://Bolts/docs/license>
*/
class Bolts_Url_Filter {

	/*
		Function: filter
	*/
	function filter($url, array $params = null) {
		$this->_Bolts_plugin = Bolts_Plugin::getInstance();
		$out_url = $url;

		// LOCALIZATION
		if (Bolts_Registry::get('enable_localization') == '1') {
			if (stripos($url, "/") === 0) {
				// for virtual URLs
				$locale_code = $params['locale_code'];
				if (!is_null($locale_code)) {
					// localize the URL by injecting the locale code at the root
					if (Bolts_Translate::validateLocaleCode($locale_code)) {
						$out_url = "/".$locale_code.$url;
					}
				}
			} else {
				// TODO - add other cases, such as absolute and relative URLs
			}
		}

		// SSL
		if (Bolts_Registry::get('enable_ssl') == '1') {
			$secure_urls = Bolts_Registry::get('secure_urls');
			if (!empty($secure_urls)) {
				$secure_urls = explode('|', $secure_urls);
				if (stripos($url, "/") === 0) {
					// for virtual URLs
					// $tmp_url = '/'.trim('/', $url); // get rid of the last slash
					if (in_array($url, $secure_urls)) {
						$out_url = str_replace('http://', 'https://', Bolts_Registry::get('site_url').$out_url);
					} 
				} else {
					// TODO - add other cases, such as absolute and relative URLs
				}
			}
		}

		// FORCE ABSOLUTE URL
		if (array_key_exists('absolute', $params) || in_array('absolute', $params)) {
			if (stripos($url, "/") === 0) {
				$out_url = Bolts_Registry::get('site_url').$out_url;
			} else {
				$out_url = Bolts_Registry::get('site_url').'/'.$out_url;
			}
		}
		$params = array('url' => $out_url);
		$params = $this->_Bolts_plugin->doFilter('url_post_filter', $params); // FILTER HOOK
		return $params['url'];
	}

	public function stripssl($out_url, array $params = null) {
		if (stripos($out_url, "/") === 0) {
			if ($params) {
				$out_url = $this->filter($out_url,$params);
			}
			$out_url = str_replace('https://', 'http://', Bolts_Registry::get('site_url').$out_url);
		} else {
			// TODO - add other cases, such as absolute and relative URLs
		}
		return $out_url;
	}


}
