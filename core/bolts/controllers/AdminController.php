<?php

/*
	Class: Admin

	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>

	About: See Also
		<Bolts_Controller_Action_Abstract>
		<Bolts_Controller_Action_Admin>
*/
class AdminController extends  Bolts_Controller_Action_Admin {

	/* Group: Instance Methods */

	/*
		Function: init
			Invoked automatically when an instance is created.
			For this class, does nothing other than initialize the parent object (calls init() on the parent instance).
	*/
	function init() {
        parent::init();
    }

	/* Group: Actions */

	/*
		Function: index
			The administration landing page. Currently does nothing. Template might contain welcome text.
			
		Plugin Hooks:
			- *default_admin_index* (filter) - Used to add content to the admin index page. Any key that gets set in the params array will be sent to the view with that name. 
				param username - The username of the current user if they are logged in, or null otherwise.			
	*/
    function indexAction() {
		$params = array('username' => $this->_identity->username);
		$additional = $this->_Bolts_plugin->doFilter($this->_mca, $params); // FILTER HOOK
		foreach ($additional as $key => $value) {
			$this->view->$key = $value;
		}
    }

}
