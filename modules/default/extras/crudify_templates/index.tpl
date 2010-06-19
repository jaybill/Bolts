{capture name=pagetitle}{t}Manage OBJECT_NICENAME{/t}{/capture}
{include file="file:$THEME_GLOBAL_PATH_VAR_NAME/_header.tpl" pagetitle=$smarty.capture.pagetitle}
<div class="grid_12 alpha">
	<h3 class="index">{$smarty.capture.pagetitle}</h3>
	{if count($ROWSET_VAR) gt 0}
		<table>
			<thead>
				<tr>
					<th scope="col">{t}THE_ID{/t}</th>
					<th scope="col">{t}Column 2{/t}</th>
					<th scope="col">{t}Column 3{/t}</th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$ROWSET_VAR item=row key=index}
					<tr class="{if $index mod 2 eq 0}odd{else}even{/if}">
						<td><a href="{url}CREATE_NEW_URL/THE_ID/{$row.THE_ID}{/url}">{$row.THE_ID}</a></td>
						<td>{t}foo{/t}</td>
						<td>{t}bar{/t}</td>
					</tr>
				{/foreach}
			</tbody>
		</table>
	{else}
		<p>{t}No OBJECT_NICENAME found.{/t}</p>
	{/if}	
	{include file="file:$THEME_GLOBAL_PATH_VAR_NAME/_pager.tpl" class="grid_12 alpha omega"}
</div>
<div class="grid_4 omega">
	<h3>{t}Options{/t}</h3>
	<div class="sidemenu">
		<ul>
			<li><a href="{url}CREATE_NEW_URL{/url}">{t}Add New{/t}</a></li>	
		</ul>
	</div>
</div>
{include file="file:$THEME_GLOBAL_PATH_VAR_NAME/_footer.tpl"}
