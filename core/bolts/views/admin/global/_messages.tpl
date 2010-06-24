{if isset($success)}
	<div class="status success grid_16">
		<div class="grid_16">	
			{$success}
		</div>
	</div>
{/if}

{if isset($notice)}
	<div class="status notice grid_16">
		<div class="grid_16">
			{$notice}
		</div>
	</div>
{/if}

{if count($errors) gt 0}
	<div class="status error grid_16">
		<div class="grid_16">
			{t}Error{/t}
		</div>
	</div>
	<div class="error-list grid_16">
		<ul>
			{foreach from=$errors item=error}
				<li>{$error}</li>
			{/foreach}
		</ul>
	</div>
{/if}
