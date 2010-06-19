{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_12 alpha">
<h3>{if $user.username eq $loggedInUsername}My{else}{$user.username}'s{/if} {t}Friends{/t}</h3>
				
				{if count($friends) gt 0}
				
				  {foreach from=$friends item=friend}
			  		<div class="grid_12 friendrequests">
					  	
					  	<div class="grid_2 alpha">
						  	<a href="{url}/profile/{$friend.username}{/url}" title="{$friend.username}">
						  		<img src="/displayimage/{$friend.username}/original/80/80/1/jpg/avatar" alt="" height="80" width="80" />
						  	</a>
					  	</div>
					  	
					  	<div class="grid_10 omega">
					  		<h4><a href="{url}/profile/{$friend.username}{/url}" title="{$friend.username}">{$friend.username}</a></h4>

						  	{if $user.username eq $loggedInUsername}
				
  							<div class="twobuttons">							
								<form class="singlebutton" method="get" action="{url}/friends/index/delete/username/{$friend.username}{/url}" enctype="multipart/form-data">									
									<input type="submit" class="button" value="{t}End Friendship{/t}"/>				      
								</form>	
								<div class="clear"></div>							
							</div>
							
							{/if}					  
						</div>
						
					</div>					  
						  
					
				  {/foreach}
					
				{else}
				<p class="alt">{t}No friends yet.{/t}</p>	
				{/if}
	</div>
	<div class="grid_4 omega">
	{include file="file:$theme_global/_user_nav.tpl"}
	</div>			
{include file="file:$theme_global/_footer.tpl"}