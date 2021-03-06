<?php

/*
	Class: Bolts_FilterTags

	About: Author
		Rich Joslin

	About: License
		<http://Bolts/docs/license>

	About: See Also
		Zend_Filter_Interface
*/
class Bolts_FilterFilename implements Zend_Filter_Interface {

	/* Group: Instance Methods */

	/*
		Function: filter

		Arguments:
			instr - TBD

		Returns: string
	*/
	function filter($instr) {
		$outstr = null;
		$filterChain = new Zend_Filter();
		$filterChain->addFilter(new Zend_Filter_StringToLower())
			->addFilter(new Zend_Filter_StringTrim());
		$instr = $filterChain->filter($instr);
		$outstr = str_replace(" ", "-", trim($instr));
		return $outstr;
	}	
}
