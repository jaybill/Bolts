{include file="file:$current_path/_header.tpl"}

	<p>
		Congratulations! You've successfully installed Bolts!
	</p>
	<p>
		An administrator account has been created and a <b>random</b> password assigned:
	</p>
	<p>
		<b>Username:</b> {$username}<br />
		<b>Password:</b> {$password}
	</p>
	<p>
		You should make a note of this password, because this is the <i>last time</i> we're going to show it to you.
	</p>
	<h3>Things you could do right now</h3>
	<ul>
		<li><a href="{url}/bolts/useradmin/edit/username/{$username}{/url}">Edit your profile or change your password.</a></li>
		<li><a href="{url}/bolts/config/index{/url}">View or change configuration settings.</a></li>
		<li><a href="{url}/{/url}">View the site.</a></li>
	</ul>

{include file="file:$current_path/_footer.tpl"}
