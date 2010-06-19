{include file="file:$theme_global/_header.tpl" current="main_home"}
{include file="file:$theme_global/_messages.tpl"}
<div id="main" class="grid_12">
	
	{if $module_homepage}
		{if count($recently_registered) >= 0}
			<h3>{t}Newest Members{/t}</h3>
			<p class="thumbs">
				{foreach from=$recently_registered item=user key=index}
					<a href="{url}/default/user/profile/default/username/{$user.username}{/url}"><img
						src="/displayimage/{$user.username}/original/100/100/1/jpg/avatar" width="100" height="100" alt="thumbnail" /></a>
				{/foreach}
			</p>
		{/if}
		{if count($recently_updated) >= 0}
			<h3>{t}Recently Updated{/t}</h3>
			<p class="thumbs">
				{foreach from=$recently_updated item=user key=index}
					<a href="{url}/default/user/profile/default/username/{$user.username}{/url}"><img
						src="/displayimage/{$user.username}/original/100/100/1/jpg/avatar" width="100" height="100" alt="thumbnail" /></a>
				{/foreach}
			</p>
		{/if}
		{if count($recently_online) >= 0}
			<h3>{t}Recently Online{/t}</h3>
			<p class="thumbs">
				{foreach from=$recently_online item=user key=index}
					<a href="{url}/default/user/profile/default/username/{$user.username}{/url}"><img
						src="/displayimage/{$user.username}/original/100/100/1/jpg/avatar" width="100" height="100" alt="thumbnail" /></a>
				{/foreach}
			</p>
		{/if}
	{else}
	<p>&nbsp;</p>
	{/if}
</div>
<div class="grid_4 omega">
	{if $isLoggedIn ne true}			
		<form action="{url}/default/auth/login{/url}" method="post" id="login" class="sidebar-form">				
			<p>	
				<label for="txtUsername">Username</label><br />
				<input tabindex="1" class="text" type="text" name="username" id="txtUsername" value="{$LastLogin}" />
			</p>
			<p>
				<label for="txtPassword">Password</label><br />
				<input tabindex="2" class="text" type="password" name="password" id="txtPassword" value="" />
			</p>
			<p>
				<input id="login" type="submit" class="button" tabindex="3" value="{t}Login{/t}"/>
			</p>
		</form>
	{/if}
	
	<h4>Friend Factory is where connections are built!</h4>
	<p>Are you short on friends? Are you just short? We can help! <a href="{url}/default/user/register{/url}">Register now</a> and you can be cranking out friends in no time!</p>
</div>
{include file="file:$theme_global/_footer.tpl"}
