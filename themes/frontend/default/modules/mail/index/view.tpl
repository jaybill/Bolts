{include file="file:$theme_global/_header.tpl" }
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_4 alpha">



{if isset($from_user)}
	{include file="file:$theme_global/_user_image.tpl" user=$from_user}
	<h4><a href="{url}/profile/{$from_user.username}{/url}">{$from_user.username}</a></h4>
{else}
	<h4>{$message.from_username} ({t}missing{/t})</h4>
{/if}
</div>
<div class="grid_8" id="mail-paper">
	<h3>{$message.subject|escape}</h3>						
					
	<p id="mail-envelope">
	{if $message.folder ne "SENT"}
		{t}From{/t}
		{if isset($from_user)}
			<a href="{url}/profile/{$from_user.username}{/url}">{$from_user.full_name} &lt;{$from_user.username}&gt;</a>
		{else}
			{$message.from_username} ({t}user no longer exists{/t})
		{/if}
	{else}
		{t}To{/t}
		{if isset($to_user)}
			<a href="{url}/profile/{$to_user.username}{/url}">{$to_user.full_name} &lt;{$to_user.username}&gt;</a>
		{else}
			{$message.to_username} ({t}user no longer exists{/t})
		{/if}	
	{/if} 
	{t}on{/t} {$message.sent_date|date_format:$format_datetime_small}				
	</p>
	
	<div id="mail-message"><p>{$message.message|nl2br}</p></div>
	
	<div class="twobuttons">
		<form class="singlebutton" method="get" action="{url}/mail/index/delete/id/{$message.id}{/url}" enctype="multipart/form-data">
			
			<input type="submit" class="button" value="{t}Delete{/t}"/>					  
		</form>							
		{if $message.folder ne "SENT" and isset($from_user)}
		<form class="singlebutton" method="get" action="{url}/mail/index/new/to/{$from_user.username}/replytoid/{$message.id}{/url}" enctype="multipart/form-data">
			
			<input type="submit" class="button" value="{t}Reply{/t}"/>				      
		</form>	
		<div class="clear"></div>	
		{/if}						
	</div>
			
</div>
<div class="grid_4 omega">
{include file="file:$theme_controller_path/_nav.tpl"}
</div>	
{include file="file:$theme_global/_footer.tpl"}