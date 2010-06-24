<?php

/*
	Class: Hosts

	About: Author
		Jaybill McCarthy

	About: License
		<http://Bolts/docs/license>

	About: See Also
	 	<Bolts_Db_Table_Abstract>
*/
class Hosts extends Bolts_Db_Table_Abstract {

	/* Group: Instance Variables */

	/*
		Variable: $_name
			The name of the table or view to interact with in the data source.
	*/
	protected $_name = 'bolts_hosts';

	/*
		Variable: $_primary
			The primary key of the table or view to interact with in the data source.
	*/
	protected $_primary = 'host_id';

	/* Group: Has No Methods */

}
