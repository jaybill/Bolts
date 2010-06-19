{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
	<div class="grid_12 alpha">	
	
	<h3>{t}End Friendship{/t}</h3>		

			  		<div class="grid_12 friendrequests">
					  	
					  	<div class="grid_2 alpha">
						  	<a href="{url}/profile/{$user.username}{/url}" title="{$user.username}">
						  		<img src="/displayimage/{$user.username}/original/80/80/1/jpg/avatar" alt="" height="80" width="80" />
						  	</a>
					  	</div>
					  	
					  	<div class="grid_10 omega">					  		
						  	<p>		  	
						  	{t}Are you sure you want to end your friendship with {/t} <em><a href="{url}/profile/{$user.username}{/url}" title="{$user.username}">{$user.username}</a></em>?
						  	</p>
						  	
  							<div class="twobuttons">
								<form class="singlebutton" method="post" action="{url}/friends/index/delete/username/{$user.username}{/url}" enctype="multipart/form-data">
									<input type="hidden" name="delete" value="Yes"/>
									<input type="submit" class="button" value="{t}Yes{/t}"/>					  
								</form>							
							
								<form class="singlebutton" method="post" action="{url}/friends/index/delete/username/{$user.username}{/url}" enctype="multipart/form-data">
									<input type="hidden" name="delete" value="No"/>
									<input type="submit" class="button" value="{t}No{/t}"/>				      
								</form>	
								<div class="clear"></div>							
							</div>
												  
						</div>
						
					</div>
			
	</div>				
	<div class="grid_4 omega">
	{include file="file:$theme_global/_user_nav.tpl"}
	</div>			
{include file="file:$theme_global/_footer.tpl"}
