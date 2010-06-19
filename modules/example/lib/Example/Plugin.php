<?php

class Example_Plugin{

	function Example_Plugin(){
		
	}

	function install($params){
            $script = new Cts_Db_Script("example", "install");
            if (!$script) {
                    $params['errors'] = $script->errors;
            }
            return $params;
	}

	function uninstall($params){
            $script = new Cts_Db_Script("example", "uninstall");
            if (!$script) {
                    $params['errors'] = $script->errors;
            }
            return $params;
	}

	function enable($params){

		return $params;
	}

	function disable($params){

		return $params;
	}

}