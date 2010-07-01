<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/text.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/960.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$default_admin_theme_url}/css/screen.css" type="text/css" media="screen" />
<!--[if IE]>
<link rel="stylesheet" href="{$default_default_admin_theme_url}css/ie.css" type="text/css" media="screen, projection" />
<![endif]-->	
{include_css urls=$css_urls}
<script type="text/javascript" src="{$default_admin_theme_url}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="{$default_admin_theme_url}/js/global.js"></script>
{include_js urls=$js_urls}
<title>Bolts - {$title_prefix}</title>
</head>
<body>
<div class="container_16">
  <div class="grid_8">
    <h1>Application Name</h1>
  </div>
  <div class="grid_8" id="nav_util">
    <a href="{url}/{/url}">{t}View Site{/t}</a> |
	<a href="{url}/bolts/auth/logout{/url}">{t}Log Out{/t}</a>
  </div>
	{if isset($include_section_nav)}{include file="file:$include_section_nav" current_section_nav=$current_section_nav}{/if}
  <div class="grid_16" id="content_wrap"> 

	






		{include file="file:$admin_theme_global_path/_messages.tpl"}	


