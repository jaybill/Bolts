{include file="file:$admin_theme_global_path/_header.tpl" pageTitle="$module_title Resources for $roleshortname"}
<div class="grid_4 sidenav">
	<h3>{t}Modules{/t}</h3>
	<ul>
		{foreach from=$modules item=module}
			<li><a href="{url}/default/resource/edit/id/{$role.id}/modid/{$module}{/url}">{$module}</a></li>
		{/foreach}	
	</ul>
	<ul>
		<li><a href="{url}/default/role/index{/url}">{t}Back to Roles{/t}</a><br /></li>
	</ul>
</div>
<div class="grid_12">
	<form action="{url}/default/resource/edit/id/{$role.id}/modid/{$modid}{/url}" method="post">
		{foreach from=$actions key=module_name item=module}
			{foreach from=$module key=controller_name item=controller}
				<h3 class="sec-title">{$controller_name}</h3>
				<ul class="checkboxlist">
					{foreach from=$controller key=action_name item=action}
						<li>
							{if $action.inherited}
								<label><input type="checkbox" checked="checked" id="{$module_name}-{$controller_name}-{$action_name}" disabled="disabled"/> {$action_name} <i>({t}inherited{/t})</i></label>
							{else}
								<label><input type="checkbox" name="resource[]" id="{$module_name}-{$controller_name}-{$action_name}" value="{$module_name}-{$controller_name}-{$action_name}" {if $action.allowed}checked="checked"{/if}/> {$action_name}</label>
							{/if}
						</li>
					{/foreach}
				</ul>
			{/foreach}
		{/foreach}
		{if count($extra_resources) gt 0}
			<h3 class="sec-title">{t}Extra{/t}</h3>
			<ul class="checkboxlist">
				{foreach from=$extra_resources item=extra_resource key=resource_name}
					<li>
						{if $extra_resource.inherited}
							<label><input type="checkbox" checked="checked" disabled="disabled"/> {$extra_resource.nicename} <i>({t}inherited{/t})</i></label>
						{else}
							<label><input type="checkbox" name="extra_resource[]" value="{$resource_name}" {if $extra_resource.allowed}checked="checked"{/if}/> {$extra_resource.nicename}</label>
						{/if}
					</li>
				{/foreach}
			</ul>
		{/if}
		<p><input type="submit" class="button save" value="{t}Save{/t}" /></p>
	</form>
</div>
{include file="file:$admin_theme_global_path/_footer.tpl"}
