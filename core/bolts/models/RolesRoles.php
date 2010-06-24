<?php

/*
	Class: RolesRoles

	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>

	About: See Also
	 	<Bolts_Db_Table_Abstract>
*/
class RolesRoles extends Bolts_Db_Table_Abstract {

	/* Group: Instance Variables */

	/*
		Variable: $_name
			The name of the table or view to interact with in the data source.
	*/
	protected $_name = 'bolts_roles_roles';

	/*
		Variable: $_primary
			The primary key of the table or view to interact with in the data source.
	*/
	protected $_primary = array('role_id','inherits_role_id');    

	/* Group: Has No Methods */

}