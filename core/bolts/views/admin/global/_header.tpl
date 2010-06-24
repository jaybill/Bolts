<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>{$title_prefix}{if isset($pageTitle)} | {$pageTitle}{/if}</title>
	<!-- TODO - maybe change these to css includes -->
	<link rel="stylesheet" href="{$admin_theme_url}/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$admin_theme_url}/css/text.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$admin_theme_url}/css/960.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$admin_theme_url}/css/default.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" media="screen" href="{$admin_theme_url}/css/superfish.css" />
	{include_css urls=$css_urls}
	<!--[if IE]>
		<link rel="stylesheet" href="{$default_default_admin_theme_url}css/ie.css" type="text/css" media="screen, projection" />
	<![endif]-->
	{if $filebrowser_standalone}<script type="text/javascript" src="{url}/filebrowser/admin/standalonejs{/url}"></script>{/if}
	{*if $tinybrowser_standalone}<script type="text/javascript" src="{$admin_theme_url}/js/tiny_mce/plugins/tinybrowser/tb_standalone.js.php"></script>{/if*}
	{if $tinymce}
		<script type="text/javascript" src="{url}/filebrowser/admin/tinymcejs{/url}"></script>
		<!--<script type="text/javascript" src="{$admin_theme_url}/js/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>-->
		<script type="text/javascript" src="{$admin_theme_url}/js/tiny_mce/tiny_mce.js"></script>
		{literal}
			<!-- compression is not working yet - crashes Firefox 2 Mac -->
			<!-- <script type="text/javascript">
				tinyMCE_GZ.init({
					plugins : 'style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,'+ 
				        'searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras',
					themes : 'advanced',
					languages : 'en',
					disk_cache : true,
					debug : false
				});
			</script> -->
			<script type="text/javascript">
				tinyMCE.init({
					mode : "exact",
					elements : "{/literal}{$tinymce_field_id}{literal}",
					theme : "advanced",
					skin : "communitas",
					plugins : "advimage,media,paste",
					theme_advanced_toolbar_location : "top",
					theme_advanced_buttons1 : "formatselect,separator,bold,italic,separator,bullist,numlist,separator,link,unlink,image,separator,code",
					theme_advanced_buttons2 : "",
			        theme_advanced_buttons3_add : "pastetext,pasteword,selectall",
			        paste_auto_cleanup_on_paste : true,
			        paste_preprocess : function(pl, o) {
			            // Content string containing the HTML from the clipboard
			            alert(o.content);
			        },
			        paste_postprocess : function(pl, o) {
			            // Content DOM node containing the DOM structure of the clipboard
			            alert(o.node.innerHTML);
			        }
					theme_advanced_blockformats : "p,h2,h3,h4,blockquote",
				    height:"200px",
				    width:"400px",
					file_browser_callback : "tinyBrowser"
					/*,
					content_css : "/themes/frontend/bolts/css/screen.css"
					*/
				});
			</script>
		{/literal}
	{/if}
	<script type="text/javascript" src="{$admin_theme_url}/js/jquery-1.2.6.min.js"></script>
	<script type="text/javascript" src="{$admin_theme_url}/js/hoverIntent.js"></script> 
	<script type="text/javascript" src="{$admin_theme_url}/js/superfish.js"></script> 
	{include_js urls=$js_urls}
	{literal}
	<script type="text/javascript"> 
	    $(document).ready(function(){ 
	        $("ul.sf-menu").superfish(); 
	    }); 
	</script>
	{/literal}	
</head>
<body>

<div id="header-wrap">		
	<div id="header" class="container_16">
		<div class="grid_12">		
			<h1>{$site_name}</h1>
			<h2>{t}Administration{/t}</h2>				
		</div>
		<div class="grid_4" id="util">
			<a href="{url}/{/url}">{t}View Site{/t}</a> |
			<a href="{url}/bolts/auth/logout{/url}">{t}Log Out{/t}</a>
		</div>
	</div>	
</div>

<div id="content-wrap">
	<div id="content" class="container_16">
		<ul id="nav" class="sf-menu">
			{include file="file:$admin_theme_global_path/_nav_recursive.tpl" items=$nav_items.admin.children}
			{include file="file:$admin_theme_global_path/_nav_recursive.tpl" items=$nav_items.admin_settings.children}
		</ul>
		<div class="clear">&nbsp;</div>

		{if isset($masthead)}
			<div class="grid_16" id="masthead"> 	
				<h2>{$masthead}</h2>
			</div>	
		{/if}

		{include file="file:$admin_theme_global_path/_messages.tpl"}	

		<!-- START: MAIN CONTENT AREA -->
