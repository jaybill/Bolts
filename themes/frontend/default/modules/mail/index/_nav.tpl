<h3>{t}Mail{/t}</h3>
<div class="sidemenu">
<ul>
	<li><a href="{url}/mail{/url}">{t}Inbox{/t} ({message_count username=$loggedInUsername}/{message_count type="total" username=$loggedInUsername})</a></li>
	<li><a href="{url}/mail/index/index/folder/sent{/url}">{t}Sent Items{/t} ({message_count type="sent" username=$loggedInUsername})</a></li>
</ul>
</div>