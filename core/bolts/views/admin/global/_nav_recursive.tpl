{foreach from=$items item=item}
	<li>
		<a href="{if isset($item.url)}{url}{$item.url}{/url}{else}#{/if}">{$item.link_text}</a>
		{if count($item.children) gt 0}
			<ul>
				{include file="file:$admin_theme_global_path/_nav_recursive.tpl" items=$item.children}
			</ul>
		{/if}
	</li>
{/foreach}
