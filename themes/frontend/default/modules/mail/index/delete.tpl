{include file="file:$theme_global/_header.tpl" pagetitle="Delete Message"}
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_12 alpha">

<h3>{t}Delete Message{/t}</h3>			

				
<p>Are you sure that you want to delete the message titled '{$message.subject|escape}'?</p>	
{include file="file:$theme_global/_deleteform.tpl" d_url="/mail/index/delete/id/`$message.id`"}			
				
</div>
<div class="grid_4 omega">
{include file="file:$theme_controller_path/_nav.tpl"}
</div>	
{include file="file:$theme_global/_footer.tpl"}