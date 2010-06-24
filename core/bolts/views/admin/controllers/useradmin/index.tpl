{include file="file:$admin_theme_global_path/_header.tpl" pageTitle="Manage Users" masthead="Manage Users"}
<div class="grid_4 sidenav">
	<h3>{t}Search{/t}</h3>
	<form class="search" action="{url}/bolts/useradmin/index{/url}" method="post" id="usersearch">
		<p><input type="text" id="searchterm" name="searchterm" value="{$searchterm}"/></p>
		<p><input type="submit" value="{t}Search{/t}" class="button"/></p>
	</form>
	<h3>{t}Options{/t}</h3>
	<ul>		
		<li><a href="{url}/bolts/useradmin/edit{/url}">{t}Create New User{/t}</a></li>
	</ul>
</div>
<div class="grid_12">
	{if count($users) gt 0}			
		<div class="grid_12 faux-thead alpha omega">
			<div class="grid_4 alpha">{t}Username{/t}</div>
			<div class="grid_4">{t}Full Name{/t}</div>
			<div class="grid_4 omega">{t}Last Login{/t}</div>
		</div>
		{foreach from=$users item=user key=index}
			<div class="grid_12{if ($index + 1) mod 2 eq 0} even{else} odd{/if} faux-tr  alpha omega">
				<div class="grid_4 alpha">
					<a href="{url}/bolts/useradmin/edit/username/{$user.username}{/url}">{$user.username}</a>
				</div>
				<div class="grid_4">
					{$user.full_name}
				</div>
				<div class="grid_4 omega">
					{$user.last_login_on}
				</div>
			</div>
		{/foreach}
	{else}
		<p>{t}No users found.{/t}</p>	
	{/if}	
	<div class="grid_12 alpha omega">
		{include file="file:$admin_theme_global_path/_pager.tpl"}
	</div>
</div>
{include file="file:$admin_theme_global_path/_footer.tpl"}
