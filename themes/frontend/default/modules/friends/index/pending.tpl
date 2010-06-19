{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_12 alpha">
<h3>{t}Pending Friend Requests{/t}</h3>
				
				{if count($pending) gt 0}
				
				  {foreach from=$pending item=user}
			  		<div class="grid_12 friendrequests">
					  	
					  	<div class="grid_2 alpha">
						  	<a href="{url}/profile/{$user.friend_username}{/url}" title="{$user.friend_username}">
						  		<img src="/displayimage/{$user.friend_username}/original/80/80/1/jpg/avatar" alt="" height="80" width="80" />
						  	</a>
					  	</div>
					  	
					  	<div class="grid_10 omega">
					  		<h4><a href="{url}/profile/{$user.friend_username}{/url}" title="{$user.friend_username}">{$user.friend_username}</a></h4>
						  	<p>		  	
						  	{t}Request sent on{/t} <em>{$user.invited_on|date_format:$format_date}</em>
						  	</p>
						  	
  							<div class="twobuttons">							
								<form class="singlebutton" method="post" action="{url}/friends/index/pending{/url}" enctype="multipart/form-data">
									<input type="hidden" name="cancel" value="{$user.friend_username}"/>
									<input type="submit" class="button" value="{t}Cancel{/t}"/>				      
								</form>	
								<div class="clear"></div>							
							</div>
												  
						</div>
						
					</div>					  
						  
					
				  {/foreach}
					
				{else}
				<p class="alt">{t}You do not have any pending friend requests.{/t}</p>	
				{/if}
	</div>
	<div class="grid_4 omega">
	{include file="file:$theme_global/_user_nav.tpl"}
	</div>			
{include file="file:$theme_global/_footer.tpl"}