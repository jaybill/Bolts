{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_12 alpha">
<h3>{$pagetitle}</h3>
				
	{if count($mail) ne 0}
	<div id="statustext">{$status_text}</div>	
	{include file="file:$theme_global/_pager.tpl" class="grid_12 omega" items_label="messages"}					
	
	{foreach from=$mail item=message}
	<div id="msg-{$message.id}" class="grid_12 omega mail-item {$message.cssclass}">
		<div class="grid_1 alpha">
			<p><a href="{url}/mail/index/view/id/{$message.id}{/url}" class="mail-icon">{$message.status}</a></p>			  	
	  	</div>
	  	<div class="grid_3">
	  		<p>
			{if $folder eq 'sent'}
				{if $message.user_missing}
				{$message.to_username}
				{else}
				<a href="{url}/profile/{$message.to_username}{/url}">{$message.to_username}</a>
				{/if}			
			{else}
				{if $message.user_missing}
				{$message.from_username}
				{else}
				<a href="{url}/profile/{$message.from_username}{/url}">{$message.from_username}</a>
				{/if}
			{/if}			
		  	</p>
	  	</div>
	  	<div class="grid_5">	
			<p>
			<a href="{url}/mail/index/view/id/{$message.id}{/url}">{$message.subject|truncate:50}</a>			
			</p>
		</div>
		<div class="grid_3 omega">
		<p>
		{$message.sent_date|date_format:$format_datetime_small}
		</p>
		</div>
	</div>
	{/foreach}
	
	{include file="file:$theme_global/_pager.tpl" class="grid_12 omega"  items_label="messages"}
	
	{else}
	<p class="alt">Nothing here. You have 0 messages.</p>
	{/if}
				
			
</div>
<div class="grid_4 omega">
{include file="file:$theme_controller_path/_nav.tpl"}
</div>	
{include file="file:$theme_global/_footer.tpl"}
