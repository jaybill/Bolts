{include file="file:$admin_theme_global_path/_header.tpl"}
<h2>{t}Configuration{/t}</h2>
{include file="file:$admin_theme_path/controllers/config/_section_nav.tpl" current_section_nav=$modid}

	{if count($config) gt 0}
		<form method="post" action="{url}/bolts/config/index/modid/{$modid}{/url}" enctype="multipart/form-data">
			
			<div class="grid_16 alpha omega">
			<table id="config-form">
			<col class="ckey"/>
			<col class="field"/>
			<col class="checkbox"/>
			<thead>
				<tr>						
						<th>{t}Parameter{/t}</th>
						<th>{t}Value{/t}</td>
						<th>{t}Cached{/t}</td>
				</tr>			
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">
					<input type="submit" class="button save" value="{t}Save{/t}" />
					</td>
				</tr>
			</tfoot>
			<tbody>			
			{foreach from=$config item=setting key=index}					
						<tr>						
							<th scope="row">{$setting.ckey|replace:'_':' '|capitalize}</th>
							<td><input type="text" id="{$setting.ckey}" name="{$setting.ckey}" value="{$setting.value}" /></td>
							<td><input type="checkbox" id="cache-{$setting.ckey}" name="cache-{$setting.ckey}" value="1"{if ($setting.is_cached eq 1)} checked="checked"{/if} /></td>
						</tr>
			{/foreach}
			</tbody>
			
			</table>
			
			
			</div>
			
		</form>
	{/if}

{include file="file:$admin_theme_global_path/_footer.tpl"}
