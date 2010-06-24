{include file="file:$admin_theme_global_path/_header.tpl" pageTitle="Modules"}
{if count($modules) gt 0}
	<div class="grid_16 faux-thead">
		<div class="grid_3 alpha">{t}Module{/t}</div>
		<div class="grid_1">{t}Version{/t}</div>
		<div class="grid_1">{t}Status{/t}</div>
		<div class="grid_3">{t}Author{/t}</div>
		<div class="grid_6">{t}Description{/t}</div>
		<div class="grid_2 omega">{t}Actions{/t}</div>
	</div>
	{foreach from=$modules item=module key=index}
		<div class="grid_16{if ($index + 1) mod 2 eq 0} even{else} odd{/if} faux-tr">
			<div class="grid_3 alpha">{$module.general.name}</div>
			<div class="grid_1">{$module.general.version}</div>
			<div class="grid_1">
				{if $module.available}
					<span class="module-status module-new" title="{t}Not Installed{/t}">{t}Not installed{/t}</span>
				{elseif $module.is_enabled eq 1}
					<span class="module-status module-active" title="{t}Active{/t}">{t}Active{/t}</span>
				{elseif $module.is_enabled eq 0}
					<span class="module-status module-disabled" title="{t}Disabled{/t}">{t}Disabled{/t}</span>
				{/if}
			</div>
			<div class="grid_3">
				{if isset($module.general.url)}
					<a href="{$module.general.url}">{$module.general.author}</a>
				{else}
					{$module.general.url}
				{/if}
			</div>
			<div class="grid_6"><p>{$module.general.description}</p></div>
			<div class="grid_2 omega">
				{if $module.available}	
					<a class="icon module-install" href="{url}/bolts/module/index/id/{$module.id}/perform/install{/url}" title="{t}Install{/t}">{t}Install{/t}</a>		
				{elseif $module.is_enabled eq 1}		
					<a class="icon module-disable" href="{url}/bolts/module/index/id/{$module.id}/perform/disable{/url}" title="{t}Disable{/t}">{t}Disable{/t}</a>
					<a class="icon module-uninstall" href="{url}/bolts/module/uninstall/id/{$module.id}{/url}" title="{t}Uninstall{/t}">{t}Uninstall{/t}</a>
				{elseif $module.is_enabled eq 0}
					<a class="icon module-enable" href="{url}/bolts/module/index/id/{$module.id}/perform/enable{/url}" title="{t}Enable{/t}">{t}Enable{/t}</a>
					<a class="icon module-uninstall" href="{url}/bolts/module/uninstall/id/{$module.id}{/url}" title="{t}Uninstall{/t}">{t}Uninstall{/t}</a>
				{/if}
			</div>
		</div>
	{/foreach}
{/if}
{include file="file:$admin_theme_global_path/_footer.tpl"}
