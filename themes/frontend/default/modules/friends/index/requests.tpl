{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
	<div class="grid_12 alpha">		
	<h3>{t}Friend Requests{/t}</h3>		
				{if count($requests) gt 0}
				
				  {foreach from=$requests item=friend}
			  		<div class="grid_12 friendrequests">
					  	
					  	<div class="grid_2 alpha">
						  	<a href="{url}/profile/{$friend.friend_username}{/url}" title="{$friend.friend_username}">
						  		<img src="/displayimage/{$friend.friend_username}/original/80/80/1/jpg/avatar" alt="" height="80" width="80" />
						  	</a>
					  	</div>
					  	
					  	<div class="grid_10 omega">
					  		<h4><a href="{url}/profile/{$friend.friend_username}{/url}" title="{$friend.friend_username}">{$friend.friend_username}</a></h4>
						  	<p>		  	
						  	{t}Request received on{/t} <em>{$friend.invited_on|date_format:$format_date}</em>
						  	</p>
						  	
  							<div class="twobuttons">
								<form class="singlebutton" method="post" action="{url}/friends/index/requests{/url}" enctype="multipart/form-data">
									<input type="hidden" name="approve" value="{$friend.friend_username}"/>
									<input type="submit" class="button" value="{t}Approve{/t}"/>					  
								</form>							
							
								<form class="singlebutton" method="post" action="{url}/friends/index/requests{/url}" enctype="multipart/form-data">
									<input type="hidden" name="reject" value="{$friend.friend_username}"/>
									<input type="submit" class="button" value="{t}Reject{/t}"/>				      
								</form>	
								<div class="clear"></div>							
							</div>
												  
						</div>
						
					</div>					  
						  
					
				  {/foreach}
					
				{else}
				<div class="grid_12">
					<p>{t}You do not have any pending friend requests to approve or reject.{/t}</p>	
				</div>
				{/if}
	</div>				
	<div class="grid_4 omega">
	{include file="file:$theme_global/_user_nav.tpl"}
	</div>			
{include file="file:$theme_global/_footer.tpl"}