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
<title>{$title_prefix}{if isset($page_title)} - {$page_title}{/if}</title>
</head>
<body>
<div class="container_16">
  <div class="grid_8">
    <h1>{$site_name}</h1>
  </div>
  <div class="grid_8" id="nav_util">
    <a href="{url}/{/url}">{t}View Site{/t}</a> |
	<a href="{url}/bolts/auth/logout{/url}">{t}Log Out{/t}</a>
  </div>
	<div class="clear"></div>  
       <div class="grid_16" id="nav_top">	    
          <ul>
              <li class="first"><a href="{url}/bolts/admin/index{/url}">{t}Home{/t}</a></li>
              <li><a href="{url}/bolts/useradmin/index{/url}" class="current">{t}Users{/t}</a></li>
              <li><a href="{url}/bolts/config/index{/url}">{t}Config{/t}</a></li>
          </ul>
      </div>
      <div class="clear"></div>
  
  
  <div class="grid_16" id="content_wrap"> 

	






		{include file="file:$admin_theme_global_path/_messages.tpl"}	


