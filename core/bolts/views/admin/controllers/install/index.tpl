{include file="file:$current_path/_header.tpl"}
<div class="grid_4 sidenav">
	<p>It appears this is the first time you've run this instance of Bolts.</p>
	<p>Answer the questions and click on the "Install" button below to continue.</p>
</div>
<div class="grid_12">
	<!-- MAIN COLUMN -->
	{if isset($success)}
		{if isset($config_file)}
			<textarea rows="20" cols="80">{$config_file}</textarea>
		{/if}
	{else} 
		<form method="post" action="/" class="multiform" {*enctype="multipart/form-data"*}>
			<h3 class="sec-title">Default Database Settings</h3>		
			<fieldset>
				<p>
					<label>Database Host</label>
					<input type="text" value="{$db_host}" name="db_host" id="db_host" class="text"/>
				</p>
				<p>
					<label>Database Port</label>		
					<input type="text" value="{$db_port}" name="db_port" id="db_port" class="text"/>
				</p>
				<p>
					<label>Database Socket (optional)</label>		
					<input type="text" value="{$db_sock}" name="db_sock" id="db_sock" class="text"/>	
				</p>
				<p>	
					<label>Database Name (must already exist)</label>		
					<input type="text" value="{$db_name}" name="db_name" id="db_name"/>
				</p>
				<p>		
					<label>Database Username</label>		
					<input type="text" value="{$db_user}" name="db_user" id="db_user"/>
				</p>
				<p>	
					<label>Database Password</label>		
					<input type="password" value="{$db_pass}" name="db_pass" id="db_pass"/>
				</p>				
				<h3 class="sec-title">Application Settings</h3>		
				<p>
					<label>Time zone</label>			
					{html_options name=Bolts_timezone id=Bolts_timezone options=$timezones selected=$Bolts_timezone}
				</p>
				<h3 class="sec-title">Admin User Settings</h3>
				<p>
					<label>Username</label>
					<input type="text" value="{$admin_username}" name="admin_username" id="admin_username"/>
				</p>
				<p>
					<label>Email</label>
					<input type="text" value="{$admin_email}" name="admin_email" id="admin_email"/>
				</p>
				
				<h3 class="sec-title">Save and Install</h3>
				<p><input type="submit" class="button yes" value="Install"/></p>
			</fieldset>
		</form>
	{/if}
</div>
{include file="file:$current_path/_footer.tpl"}
