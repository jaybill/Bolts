{include file="file:$admin_theme_global_path/_header.tpl" pageTitle="Manage Roles"}
<div class="grid_4 sidenav">
	<h3>{t}Options{/t}</h3>
	<ul>		
		<li><a title="{t}Add New Role{/t}" href="{url}/bolts/role/edit{/url}">{t}Add New Role{/t}</a></li>
	</ul>
</div>
{if count($roles) gt 0}
	<div class="grid_12">	
		<div class="grid_12 faux-thead alpha omega">
			<div class="grid_4 alpha">{t}Role{/t}</div>
			<div class="grid_4">{t}Resources{/t}</div>
			<div class="grid_4 omega">{t}Navigation{/t}</div>
		</div>
		{foreach from=$roles item=role key=index}
			<div class="grid_12{if ($index + 1) mod 2 eq 0} even{else} odd{/if} faux-tr  alpha omega">
				<div class="grid_4 alpha">
					<p>{if $role.shortname ne "guest"}<a href="{url}/bolts/role/edit/id/{$role.id}{/url}">{$role.shortname}</a>{else}{$role.shortname}{/if}</p>
				</div>
				<div class="grid_4">
					<p><a href="{url}/bolts/resource/edit/id/{$role.id}{/url}">{t}Resource Permissions{/t}</a></p>
				</div>
				<div class="grid_4 omega">
					<a href="{url}/bolts/navigation/editrole/id/{$role.id}{/url}">{t}Customize Navigation{/t}</a>
				</div>
			</div>
		{/foreach}
	</div>
{/if}
{include file="file:$admin_theme_global_path/_footer.tpl"}
