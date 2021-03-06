<?php

/*
	Class: Bolts_View_Renderer

	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>

	About: See Also
		Zend_View_Interface
*/
class Bolts_View_Renderer implements Zend_View_Interface {

	/* Group: Variables */

	/*
		Variable: $_smarty
			Smarty object.
	*/
    public $_smarty;

	/* Group: Constructors */

	/*
		Constructor: __construct

		Arguments:
			tmplPath - TBD
			extraParams - TBD
	*/
    public function __construct($tmplPath = null, $extraParams = array()) {
        $this->_smarty = new Bolts_View_Smarty;
		
        if (!is_null($tmplPath)) {
            $this->setScriptPath($tmplPath);
        }
		
        foreach ($extraParams as $key => $value) {
            if($key != "plugins_dir") {
        		$this->_smarty->$key = $value;
            } else {
            	$plugin_dirs = array('plugins');
            	if (is_array($value)) {            		
            		foreach ($value as $plugin_dir) {
            			$plugin_dirs[] = $plugin_dir;
            		}
            	} else {
            		$plugin_dirs[] = $value;
            	}
            	$this->_smarty->plugins_dir = $plugin_dirs;
            }
        }
        
    }

	/* Group: Instance Methods */

	/*
		Function: getEngine
			Return the template engine object.

		Arguments:
			none

		Returns:
			The current Smarty template engine object.
	*/
    public function getEngine() {
        return $this->_smarty;
    }

	/*
		Function setScriptPath
			Set the path to the templates.

		Arguments
			path - The directory to set as the path.

		Returns: void
	*/
    public function setScriptPath($path) {    	    	
		$this->_smarty->template_dir = $path;
	}

	/*
		Function: getScriptPaths
			Retrieve the current template directory.

		Arguments:
			none

		Returns:
			array
	*/
    public function getScriptPaths() {
        return array('script' => $this->_smarty->template_dir);
    }

	/*
		Function: setBasePath
			Alias for setScriptPath.

		Arguments:
			path - TBD
			prefix (optional) - TBD - Default is 'Zend_View'.

		Returns:
			void
	*/
    public function setBasePath($path, $prefix = 'Zend_View') {
        return $this->setScriptPath($path);
    }

	/*
		Function: addBasePath
			Alias for setScriptPath.

		Arguments:
			path

		Returns:
			void
	*/
    public function addBasePath($path, $prefix = 'Zend_View') {
        return $this->setScriptPath($path);
    }

	/*
		Function: __set
			Assign a variable to the template.

		Arguments:
			key - The variable name.
			val - The variable value.

		Returns:
			void
	*/
    public function __set($key, $val) {
        $this->_smarty->assign($key, $val);
    }

	/*
		Function: __get
			Retrieve an assigned variable.

		Arguments:
			key - The variable name.

		Returns:
			The variable value.
	*/
    public function __get($key) {
        return $this->_smarty->get_template_vars($key);
    }

    /*
		Function: __isset
			Allows testing with empty() and isset() to work.

		Arguments:
			key - The variable name.

		Returns:
			boolean
	*/
	public function __isset($key) {
        return (null !== $this->_smarty->get_template_vars($key));
    }

	/*
		Function: __unset
			Allows unset() on object properties to work.

		Arguments:
			key - The variable name.

		Returns:
			void
	*/
    public function __unset($key) {
        $this->_smarty->clear_assign($key);
    }

	/*
		Function: assign
			Assign variables to the template.
			Allows setting a specific key to the specified value,
			OR passing an array of key => value pairs to set en masse.

		Arguments:
			spec - The assignment strategy to use (key or array of key => value pairs)
			value (optional) - If assigning a named variable, use this as the value.

		Returns:
			void
	*/
    public function assign($spec, $value = null) {
        if (is_array($spec)) {
            $this->_smarty->assign($spec);
            return;
        }
        $this->_smarty->assign($spec, $value);
    }

	/*
		Function: clearVars
			Clears all variables assigned to Zend_View either via {@link assign()} or property overloading ({@link __get()}/{@link __set()}).

		Arguments:
			none

		Returns:
			void
	*/
    public function clearVars() {
        $this->_smarty->clear_all_assign();
    }

	/*
		Function: render
			Processes a template and returns the output.

		Arguments:
			name - The template to process.

		Returns:
			string
	*/
    public function render($name) {
    	// get the complete name of the template
        $theme_locations = Zend_Registry::get("theme_locations");
		$basepath = Zend_Registry::get("basepath");
		
		$front = Zend_Controller_Front::getInstance();
        $request = $front->getRequest();
        $module_name = $request->getModuleName();  
        $module_views_root = "";

        if($module_name == "bolts"){
        	$module_views_root = $basepath . "/core/bolts/views";        	
        } else {
        	$module_views_root = $basepath . "/nuts/".$module_name."/views"; 
        }
		
        if($this->_smarty->_tpl_vars['isAdminController']){
            $fallback_path = $module_views_root."/admin/controllers";
        } else {
            $fallback_path = $module_views_root."/frontend/controllers";
        }
        
    	$template_filename = $this->_smarty->template_dir . "/" . $name;
        //dd($template_filename);
    	// if it exists in the *current* theme, use it, if not, try the default theme
        
    	if(!file_exists($template_filename)){
             if(is_readable($fallback_path)){        		
                        $template_filename = $fallback_path . "/" . $name;
                        //dd($template_filename);
        	} else {
        		// We're out of ideas. Sorry.
        		throw new Zend_Exception("Provided template path is not valid: ". $path);
        	}
    	}
    	if(array_key_exists("mca",$this->_smarty->_tpl_vars)){
    	  $mca = $this->_smarty->_tpl_vars['mca'];
    	  $this->_smarty->compile_id = $mca;
    	}

        
        return $this->_smarty->fetch($template_filename);
        
    }

	/*
		Function: display
			Display the template.

		Arguments:
			name - The path and filename of template to process.

		Returns:
			void
	*/
    public function display($name) {    	
        $this->_smarty->display($name);
    }
}
