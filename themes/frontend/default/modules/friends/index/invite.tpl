{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
	<div class="grid_12 alpha">	
	{if $showForm}
	<h3>{t}Confirm Friend Request{/t}</h3>		

			  		<div class="grid_12 friendrequests">
					  	
					  	<div class="grid_2 alpha">
						  	<a href="{url}/profile/{$user.username}{/url}" title="{$user.username}">
						  		<img src="/displayimage/{$user.username}/original/80/80/1/jpg/avatar" alt="" height="80" width="80" />
						  	</a>
					  	</div>
					  	
					  	<div class="grid_10 omega">					  		
						  	<p>		  	
						  	<em><a href="{url}/profile/{$user.username}{/url}" title="{$user.username}">{$user.username}</a></em> {t}must confirm your request. Continue?{/t}
						  	</p>
						  	
  							<div class="twobuttons">
								<form class="singlebutton" method="post" action="{url}/friends/index/invite/username/{$user.username}{/url}" enctype="multipart/form-data">
									<input type="hidden" name="invite" value="Yes"/>
									<input type="submit" class="button" value="{t}Yes{/t}"/>					  
								</form>							
							
								<form class="singlebutton" method="post" action="{url}/friends/index/invite/username/{$user.username}{/url}" enctype="multipart/form-data">
									<input type="hidden" name="invite" value="No"/>
									<input type="submit" class="button" value="{t}No{/t}"/>				      
								</form>	
								<div class="clear"></div>							
							</div>
												  
						</div>
						
					</div>
	{else}<p>&nbsp;</p>				
	{/if}			
	</div>				
	<div class="grid_4 omega">
	{include file="file:$theme_global/_user_nav.tpl"}
	</div>			
{include file="file:$theme_global/_footer.tpl"}
