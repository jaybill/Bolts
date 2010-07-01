{if count($pages) gt 1}
<div class="pager">
  {if isset($first)}<a href="{url}{$pager_url}/page/{$first}{/url}" class="first">{t}First{/t}</a>{/if}
  {if isset($prev)}<a href="{url}{$pager_url}/page/{$prev}{/url}" class="previous">Previous{t}Previous{/t}</a>{/if}
  <span>{t}Page{/t} <strong>{$display_page}</strong> {t}of{/t} <strong>{$total_pages}</strong></span>
  {if isset($next)}<a href="{url}{$pager_url}/page/{$next}{/url}" class="next">Next{t}Next{/t}</a>{/if}
  {if isset($last)}<a href="{url}{$pager_url}/page/{$last}{/url}" class="last">Last{t}Last{/t}</a>{/if}      
  <span>{t}Showing {/t} <b>{$starting_item} - {$ending_item}</b> of <b>{$total}</b> {$pager_item_name}</span>
</div>
{/if}