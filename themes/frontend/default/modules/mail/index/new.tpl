{include file="file:$theme_global/_header.tpl"}
{include file="file:$theme_global/_messages.tpl"}
<div class="grid_4 alpha">
{include file="file:$theme_global/_user_image.tpl" user=$to_user}
{if isset($to_user)}
	<h4><a href="{url}/profile/{$from_user.username}{/url}">{$to_user.username}</a></h4>
{else}
	{$message.to_user} ({t}user no longer exists{/t})
{/if}
</div>
<div class="grid_8">
<h3>{if isset($reply_to_message)}{t}Reply to Message{/t}{else}{t}New Message{/t}{/if}</h3>

				<form id="contactform" action="{url}/mail/index/new{/url}" method="post">


						<p>
						<label>{t}From{/t}</label><br />
						<a href="{url}/profile/{$from_user.username}{/url}">{$loggedInFullName} &lt;{$loggedInUsername}&gt;</a>
						</p>
					
						<p>
						<label>{t}To{/t}</label><br />
						<a href="{url}/profile/{$to_user.username}{/url}">{$to_user.full_name} &lt;{$to_user.username}&gt; {if $loggedInUsername eq $to_user.username} (me){/if}</a>
						</p>
						
						<p>	
						<label>{t}Subject{/t}</label><br />
						<input type="text" name="subject" maxlength="100" class="text" value="{$subject}"/>
						</p>
						
						<p>
						<label for="editor">{t}Message{/t}</label><br />
						<textarea rows="15" cols="10" id="editor" class="mrt" name="body">{if isset($reply_to_message)}{include file="file:$theme_controller_path/_reply.tpl"}{/if}</textarea>
						</p>
					
						<p>
						<input type='hidden' name='to_username' value='{$to_user.username}'/>
						{if isset($replytoid)}
						<input type='hidden' name='replytoid' value='{$replytoid}'/>
						{/if}
						<input type='hidden' name='striptags' value='1'/>
						<input type="submit" id="send" class="button" value="{t}Send{/t}"/>
						</p>

					
				</form>
</div>	
<div class="grid_4 omega">
{if isset($reply_to_message)}
{include file="file:$theme_controller_path/_nav.tpl"}
{else}
{include file="file:$theme_global/_user_nav.tpl" user=$to_user}
{/if}
</div>	
{include file="file:$theme_global/_footer.tpl"}