{include file="file:$admin_theme_global_path/_header.tpl" 
include_section_nav="$admin_theme_path/controllers/config/_section_nav.tpl"  
current_section_nav=$mod 
}
<div class="grid_4 sidenav">
	<h3>{t}Modules{/t}</h3>
	{if isset($modules)}
		<ul>
			{foreach from=$modules item=mod}
				<li{if $current eq $mod} style="font-weight: bold; background: #ddd;" class="current"{/if}>
					<a href="{url}/bolts/config/index/modid/{$mod}{/url}">{$mod}</a>
				</li>
			{/foreach}
		</ul>
	{/if}
</div>
<div class="grid_12">
	{if count($config) gt 0}
		<form method="post" action="{url}/bolts/config/index/modid/{$modid}{/url}" enctype="multipart/form-data">
			{foreach from=$config item=setting}
				<p>
					<label for="{$setting.ckey}">{$setting.ckey|replace:'_':' '|capitalize}</label>
					<input type="text" id="{$setting.ckey}" name="{$setting.ckey}" value="{$setting.value}" />
				</p>
			{/foreach}
			<p><input type="submit" class="button save" value="{t}Save{/t}" /></p>
		</form>
	{/if}
</div>
{include file="file:$admin_theme_global_path/_footer.tpl"}
