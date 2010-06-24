<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>{$title_prefix|escape} {if isset($pagetitle)}| {$pagetitle|escape}{/if}</title>
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
	{*
	<meta name="author" content="Erwin Aligam - styleshout.com" />
	<meta name="description" content="Site Description Here" />
	<meta name="keywords" content="keywords, here" />
	<meta name="robots" content="index, follow, noarchive" />
	<meta name="googlebot" content="noarchive" />
	*}
	<link rel="stylesheet" type="text/css" media="screen" href="{$default_theme_url}/css/screen.css" />
	{include_css urls=$css_urls}
	<script type="text/javascript" src="{$default_theme_url}/js/jquery-1.2.6.min.js"></script>
	{include_js urls=$js_urls}
</head>
<body>

	<!-- header starts-->
	<div id="header-wrap">
		<div id="header" class="container_16">						
		
			<h1 id="logo-text"><a href="/" title="">Friend Factory</a></h1>		
			<p id="intro">Where connections are built</p>				

			<!-- navigation -->
			<div  id="nav">
				<ul>
					{foreach from=$nav_items.main.children item=link key=index}
						<li{if $current eq $link.short_name} id="current"{/if}>
							<a href="{if isset($link.url)}{$link.url}{else}#{/if}">{$link.link_text}</a>
						</li>
					{/foreach}
				</ul>
			</div>

			<div id="status">
				{if $isLoggedIn}
					{if $isAdmin}
						<a href="{url}/bolts/admin/index{/url}" title="{t}Administration{/t}">{t}Admin{/t}</a>
						<span>|</span>
					{/if}
					{t}Welcome{/t}, <a href="{url}/bolts/user/profile/username/{/url}{$loggedInUsername}" title="{$loggedInUsername}">{$loggedInFullName}</a>
					<span>|</span>
					<a href="{url}/bolts/auth/logout{/url}" title="{t}Logout{/t}">{t}Logout{/t}</a>
				{else}
					<a href="{url}/bolts/auth/login{/url}" title="{t}Login{/t}">{t}Login{/t}</a>
					<span>|</span>
					<a href="{url}/bolts/user/register{/url}" title="{t}Register for an account{/t}" class="alt">{t}Register{/t}</a>
				{/if}
			</div>
		</div>
	</div>
	<!-- header ends here -->

	<!-- content starts -->
	<div id="content-outer"><div id="content-wrapper" class="container_16">
