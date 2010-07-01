{if isset($modules)}
<div class="grid_16 alpha omega" id="nav_section">
	<ul>
	{foreach from=$modules item=mod key=index}
		<li{if $index eq 0} class="first"{/if}>
			<a href="{url}/bolts/config/index/modid/{$mod}{/url}"{if $mod eq $current_section_nav} class="current"{/if}>{$mod}</a>
		</li>
	{/foreach}
	</ul>
</div>
<div class="clear"></div>
{/if}