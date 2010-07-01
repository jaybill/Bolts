<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/text.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/960.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/install.css" type="text/css" media="screen" />
<title>Install Bolts</title>
</head>
<body>
 <h1>Bolts</h1>
<h2>Installation</h2>
<div class="container_12">
   	<div class="grid_8 suffix_2 prefix_2">	
	{if count($errors) gt 0}
		<div id="errors">		
			<h3>Error</h3>
			<ul>
				{foreach from=$errors item=error}
				<li>{$error}</li>
				{/foreach}
			</ul>
		</div>
	{/if}	
<!-- START: MAIN CONTENT AREA -->
			
			
			
