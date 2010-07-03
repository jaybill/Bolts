{include file="file:$admin_theme_global_path/_header.tpl"}
{include file="file:$admin_theme_global_path/_user_section_nav.tpl" current="roles"}
<a title="{t}Add New Role{/t}" href="{url}/bolts/role/edit{/url}">{t}Add New Role{/t}</a>

{if count($roles) gt 0}

		{t}Role{/t}
		{t}Resources{/t}
		
		
		{foreach from=$roles item=role key=index}
		
			{if $role.shortname ne "guest"}<a href="{url}/bolts/role/edit/id/{$role.id}{/url}">{$role.shortname}</a>{else}{$role.shortname}{/if}
			
			<a href="{url}/bolts/resource/edit/id/{$role.id}{/url}">{t}Resource Permissions{/t}</a>			
			
			
		{/foreach}

{/if}
{include file="file:$admin_theme_global_path/_footer.tpl"}
