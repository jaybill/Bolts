{include file="file:$admin_theme_global_path/_header.tpl" pageTitle="Delete Role"}
<div class="grid_4 sidenav">
	<h3>{t}Options{/t}</h3>
	<ul>		
		<li><a href="{url}/bolts/role/index{/url}">{t}Back{/t}</a></li>
	</ul>
</div>
<div class="grid_12">
	{if !isset($success) and !isset($errors)}
		<p><b>{t}You are about to delete the role{/t} "{$role.shortname}"</b></p>
		{capture name="d_url"}
			{url}/bolts/role/delete/id/{$role.id}{/url}
		{/capture}
		{include file="file:$admin_theme_global_path/_deleteform.tpl" d_url=$smarty.capture.d_url}
	{/if}
</div>
{include file="file:$admin_theme_global_path/_footer.tpl"}
