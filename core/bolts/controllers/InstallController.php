<?php

/*
	Class: Install
		This is the installation controller. It's called via a Zend_Controller plugin called <InstallPlugin> 
		that fires on the pre_dispatch event if there's no config.ini.
		
	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>
		
	About: See Also
		<InstallPlugin>	
*/
class InstallController extends Zend_Controller_Action {

	/* Group: Instance Methods */

	/*
		Function: init
			Invoked automatically when an instance is created.
			Initializes the current instance.
			Also initializes the parent object (calls init() on the parent instance).

		Registry Values:
			theme_locations - theme locations as set by the bootstrap			
			
		View Variables:
			site_name - temporary site name for installer
			default_admin_theme_path - filesystem path to the current admin theme
			default_admin_global_path - filesystem path to the current admin theme global includes
			default_admin_theme_url - url to the base of the current admin theme
			isAdminController - boolean set to true (so view uses correct theme)
			current_path - filesystem path to the template directory for the current controller
			site_name - set to "Bolts" for installer, used by default installer theme
	*/
	function init() {
		parent::init();
		$theme_locations = Zend_Registry::get("theme_locations");
		$basepath = Zend_Registry::get('basepath');
		$template_path = $basepath . '/core/bolts/views/admin/controllers';	
		$this->view->setScriptPath($template_path);
		$this->view->default_admin_theme_path = $basepath . '/core/bolts/views/admin';
		$this->view->default_admin_global_path = $basepath . '/core/bolts/views/admin/global';
		$this->view->default_admin_theme_url = '/core/bolts/views/admin';		
		$this->view->current_path = $template_path . '/install';
        $this->view->isAdminController = true;
		$this->view->site_name = "Bolts";
	}

	/* Group: Actions */

	/*
		Function: secondstage
			This index action redirects to this action to set up some additional configuration items, set 
			some resource permissions and force an automatic login. Then it redirects to the <finished> action.

		HTTP GET or POST Parameters:
			username - the username chosen in the index action. Used for automatic login
	*/
	function secondstageAction() {
		
		$request = new Bolts_Request($this->getRequest());
		$appNamespace = new Zend_Session_Namespace('Bolts_Temp');
		$basepath = Zend_Registry::get('basepath');
		$config_table = new Config();
		
		$appname = "My Application";
		
		if($request->has('appname')){
			$appname = $request->appname;
		}
		$config_table->set('bolts', 'site_name'	, $appname);
		$config_table->set('bolts', 'title_prefix', $appname);		
		
		$config_table->set('bolts', 'upload_path', $basepath."/uploads", true);
		$config_table->set('bolts', 'theme', 'default', true);
		$config_table->set('bolts', 'missing_image', $basepath."/themes/frontend/bolts/images/image-missing.png", true);
		$config_table->set('bolts', 'site_url', 'http://'.$_SERVER['SERVER_NAME']);
		$config_table->set('bolts', 'salt', substr(md5(rand(1, 1000)), 0, 10));
		$config_table->cache();
		$username = $request->username;
		$users_table = new Users();
		$user = $users_table->fetchByUsername($username);
		$password = substr(md5(rand(50000, 100000)), 0, 8);
		if (!is_null($user)) {
			$user->password = $password;
			$user->save();
			$users_table->setMetaData($username, "is_installer", 1);
			$appNamespace->autoLogin = true;
       		$appNamespace->autoLoginUsername = $username;
       		$appNamespace->autoLoginPassword = $password;
			$appNamespace->autoLoginPasswordHash = md5($password);
		} else {
			die("Somehow the admin user didn't get created or didn't get sent with the request. This is bad. Really, really bad.");
		}
		$this->_redirect("/bolts/install/finished/username/".$username);
	}

	/*
		Function: finished
			This is called when installation is complete.

		HTTP GET or POST Parameters:
			username - the username chosen in the <index> action

		View Variables:
			username - the username passed along from <secondstage>
			password - a randomly generated password
			
	*/	
	function finishedAction() {
		$request = new Bolts_Request($this->getRequest());
		$username = $request->username;
		$users_table = new Users();
		$user = $users_table->fetchByUsername($username);
		$password = substr(md5(rand(50000, 100000)), 0, 8);
		if (!is_null($user)) {
			$user->password = $password;
			$user->save();
			$this->view->username = $username;
			$this->view->password = $password;
       		// we should never need this again, so we remove access to it.
       		$roles_resources_table = new RolesResources();
       		$where  = $roles_resources_table->getAdapter()->quoteInto("module = ? ", "bolts");
       		$where .= $roles_resources_table->getAdapter()->quoteInto(" and controller = ? ", "Install");
       		$roles_resources_table->delete($where);
			$modules_table = new Modules("core");
			$modules_table->upgradeDatabase("bolts");
		} else {
			die("Somehow the admin user didn't get created or didn't get sent with the request. This is bad. Really, really bad.");
		}
	}

	/*
		Function: index
			Displays the Communitas installer. This action will be called if the /etc/config.ini is missing.
			It will gather the required installation variables, check that all the file/directory permissions 
			are correct, write the config file and install the database.

		HTTP GET or POST Parameters:
			admin_email - email address of the admin user (if chosen)
			admin_username - username of the admin user (if chosen)
			Bolts_asido_path - path to Asido image processing library
			Bolts_smarty_path - path to Smarty template engine
			Bolts_timezone - application default timezone
			Bolts_zf_path - path to the Zend Framework
			db_host - database hostname
			db_name - database name
			db_user - database username
			db_pass - database password
			db_port - database port
			db_sock - the database socket
			errors - An array of error messages. Only exists if errors occurred.
			smarty_cache_dir - the directory smarty will use for caching
			smarty_compile_dir - the directory smarty will use for compiled templates		

		View Variables:
			admin_email - email address of the admin user (if chosen)
			admin_username - username of the admin user (if chosen)
			Bolts_asido_path - path to Asido image processing library
			Bolts_smarty_path - path to Smarty template engine
			Bolts_timezone - application default timezone
			Bolts_zf_path - path to the Zend Framework
			db_host - database hostname
			db_name - database name
			db_user - database username
			db_pass - database password
			db_port - database port
			db_sock - the database socket
			errors - An array of error messages. Only exists if errors occurred.
			smarty_cache_dir - the directory smarty will use for caching
			smarty_compile_dir - the directory smarty will use for compiled templates
	*/
	function indexAction() {
		$request = new Bolts_Request($this->getRequest());

		$basepath = Zend_Registry::get('basepath');
		$this->view->timezones = Bolts_Common::getTimeZonesArray();

		if ($this->getRequest()->isPost()) {
			
			$errors = array();

			/*
			 * TODO: Check that smarty dirs are writeable, etc. dir is writable, etc. dir is NOT writeable after install, libraries exist,
			 * log level is set to something
			 */

			if (!file_exists($basepath . "/.htaccess")) {
				$errors[] = $this->_T("Missing .htaccess file in %s. Maybe use %s/template.htaccess ?", array($basepath, $basepath));
			}

			$etc_dir = $basepath . "/etc";
			$config_filename = $etc_dir . "/config.ini";
			$tmp_path			= $basepath."/tmp";
			$smarty_compile_dir = $tmp_path."/view_compiles";
			$smarty_cache_dir 	= $tmp_path."/cache";
			$image_cache_dir	= $tmp_path."/image_cache";
			$upload_path		= $basepath."/uploads";
			$log_path			= $basepath."/logs";
			$module_cfg         = parse_ini_file($basepath."/modules/bolts/module.ini", true);

			$dir_array = array($etc_dir,
				$tmp_path,
				$upload_path,
				$log_path
				);

			foreach ($dir_array as $dir) {
				if (!is_writable($dir)) {
					$errors[] = $this->_T("Web server can't write to %s.", $dir);
				}	
			}

			if ($request->admin_username == null) {
				$errors[] = $this->_T("Admin username cannot be blank.");
			}

			if($request->admin_email == null){
				$errors[] = $this->_T("Admin email cannot be blank.");
			}

			if($request->app_name == null){
				$errors[] = $this->_T("Application name cannot be blank.");				
			}

			$cfg_array = array(
				"database" => array(
					"adapter" 	=> "PDO_MYSQL",
					"params"	=> array(
					"host" 		=> $request->db_host,
					"dbname" 	=> $request->db_name,			
					"username" 	=> $request->db_user,
					"password" 	=> $request->db_pass,
					"port" 		=> $request->db_port,
					)
				)
			);

			if(!is_null($request->db_sock)){
				$cfg_array['database']['params']['unix_socket'] = $request->db_sock;  // this is often something like /var/run/mysqld/mysqld.sock
			}

			$dbconfig = new Zend_Config($cfg_array);			

			$db = Zend_Db::factory($dbconfig->database);

			try{
				if(count($errors) == 0){
					$tables = $db->listTables();
					if(count($tables) > 0){
						$errors[] = $this->_T("The specified database is not empty.");
					}

					// get the table creation script
					$ddl_file = $basepath . "/core/bolts/sql/" . $dbconfig->database->adapter . "/install.sql";
					if(file_exists($ddl_file)){
						$queries = explode(";",file_get_contents($ddl_file));
						$db->beginTransaction();

						try{
							foreach($queries as $query){
								if(trim($query) != ""){
									$query = str_replace("@@@@ADMIN_USERNAME@@@@", $request->admin_username, $query);									
									$query = str_replace("@@@@ADMIN_EMAIL@@@@", $request->admin_email, $query);
									$query = str_replace("@@@@CREATED_ON@@@@@", date("Y-m-d H:i:s"), $query);
									$db->query($query);
								}
							}						

							$db->commit();

						} catch (Exception $e) {
							$db->rollBack();
							$errors[] = $e->getMessage();
						}				
					} else {
						$errors[] = $this->_T("Database creation script not found.");
					}
				}
			} catch (Exception $e) {
				$errors[] = $e->getMessage();	
			}			

			if(count($errors) == 0){
				// everything worked out okay, attempt to write the config file

				$config = array(
					"db.communitas.adapter" 		=> "PDO_MYSQL", // This should really be configurable, but it isn't yet.
					"db.communitas.config.host" 	=> $request->db_host,
					"db.communitas.config.dbname" 	=> $request->db_name,			
					"db.communitas.config.username" => $request->db_user,
					"db.communitas.config.password" => $request->db_pass,
					"db.communitas.config.port" 	=> $request->db_port,
					"db.communitas.config.default" 	=> "true",
				);
				if(!is_null($request->db_sock)){
					$config['db.communitas.config.unix_socket'] = $request->db_sock;
				}
				$config_file .= Bolts_ConfigFile::makeSection("databases", "Database Settings", "This is the default database.", $config);

			
				
				
				$Bolts_config = array(
					"timezone"			=> $request->Bolts_timezone,
					"launched" 			=> "1",
					"prelaunch_url" 	=> "http://google.com",
					"allowed_ips"		=> "127.0.0.1",					
					"zf_path" 			=> $basepath."/lib/ZendFramework/library",
					"smarty_path" 		=> $basepath."/lib/Smarty/libs",
					"asido_path" 		=> $basepath."/lib/Asido",
					"image_cache_dir"	=> $image_cache_dir,
					"log_filename"		=> $log_path."/bolts.log",
					"log_level"			=> "6",
					"addtl_includes"	=> "",
				);

				$config_file .= Bolts_ConfigFile::makeSection("application", "Application Settings", "These are the application specific settings.", $Bolts_config);

				// create directories if needed
				if(!file_exists($smarty_compile_dir)){				
					mkdir($smarty_compile_dir,0777,true);
				}
				
				if(!file_exists($smarty_cache_dir)){
					mkdir($smarty_cache_dir,0777,true);
				}
				
				if(!file_exists($image_cache_dir)){
					mkdir($image_cache_dir,0777,true);
				}
				
				$smarty_config = array(
					"config.compile_dir" 	=> $smarty_compile_dir,
					"config.cache_dir" 		=> $smarty_cache_dir,
				);

				$config_file .= Bolts_ConfigFile::makeSection("smarty", "Smarty Settings", "These are the settings for the Smarty template engine.", $smarty_config);

				
				if(file_put_contents($config_filename,$config_file) === false){
					$this->view->config_file = $config_file;
					$this->view->config_filename = $config_filename;
					$this->view->success = "Database installed, but could not write config file. Please create the file \"".$config_filename."\" and paste this following into it:";
				} else {
					$this->_redirect("/bolts/install/secondstage/username/".$request->admin_username."/appname/".$request->app_name);
				}			

			} else {
				$this->view->errors 	= $errors;
				$this->view->db_host 	= $request->db_host;
				$this->view->db_name 	= $request->db_name;
				$this->view->db_user 	= $request->db_user;
				$this->view->db_pass 	= $request->db_pass;
				$this->view->db_port 	= $request->db_port;
				$this->view->db_sock 	= $request->db_sock;
				$this->view->app_name   = $request->app_name;
				$this->view->admin_username		= $request->admin_username;				
				$this->view->admin_email		= $request->admin_email;
				$this->view->Bolts_timezone 	= $request->Bolts_timezone;

				
			}

		} else {
			$this->view->db_host = "localhost";
			$this->view->db_name = "bolts";
			$this->view->db_user = "root";
			$this->view->db_pass = "";
			$this->view->db_port = "3306";
			$this->view->db_sock = "";
			$this->view->app_name = "My Application";
			$this->view->admin_username		= "admin";
			$this->view->Bolts_timezone 		= "America/Los_Angeles";				

			 						
		}			
		
	}
	
	protected function _T($key, $replace = null) {
		// we're not actually doing the translation in the installer. we may some day.		
		return Bolts_Translate::translate(null, "default", $key, $replace,false);
	}

}
