{include file="file:$admin_theme_global_path/_header.tpl" page_title="Users"}
{include file="file:$admin_theme_global_path/_user_section_nav.tpl" current="users"}

		<form method="post" action="{url}/bolts/useradmin/edit/username/{$user.username}{/url}">

			<div class="grid_16 alpha omega">
				<table class="form">
				<col class="label"/>
				<col class="input"/>
				<col class="extra"/>
				<thead>
					<tr>
						<th colspan="3"><h4>{if $is_new}{t}New User{/t}{else}{t}Edit User{/t}{/if}</h4></th>						
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
				{if $is_new}
					<tr>
						<th scope="row"><label for="username">{t}Username{/t}</label></th>
						<td><input maxlength="24" type="text" name="username" id="username" /></td>
						<td></td>
					</tr>									
				{/if}
			
				<tr>
					<th scope="row"><label for="full_name">{t}Full Name{/t}</label></th>
					<td><input maxlength="{$full_name_length}" type="text" value="{$user.full_name}" name="full_name" id="full_name" /></td>
					<td></td>
				</tr>
			
				<tr>
					<th scope="row"><label for="email">{t}Email{/t}</label></th>
					<td><input type="text" value="{$user.email}" name="email" id="email"  /></td>
					<td></td>
				</tr>
				
				<tr>
					<th scope="row"><label for="gender">{t}Gender{/t}</label></th>
					<td>{html_options name=gender options=$genders selected=$user.gender}</td>
					<td></td>
				</tr>								
								
				<tr>
					<th scope="row"><label>{t}Birthday{/t}</label></th>
					<td><input type="text" value="{$user.birthday}" name="birthday" id="birthday"  /></td>
					<td></td>
				</tr>
				
				<tr>
					<th scope="row"><label for="country">{t}Country{/t}</label></th>
					<td>{html_options name=country_code options=$countries selected=$user.country_code}</td>
					<td></td>
				</tr>							

				<tr>
					<th scope="row"><label for="aboutme">{t}About Me{/t}</label></th>
					<td><textarea name="aboutme" id="aboutme">{$user.aboutme}</textarea></td>
					<td></td>
				</tr>

				<tr>
					<th scope="row"><label for="role_id" class="full">{t}Role{/t}</label></th>
					<td>{html_options
					name="role_ids[]"
					id="role_ids"
					options=$roles
					selected=$selected_roles
					multiple="multiple"
					
					class="jq-picker"}</td>
					<td></td>
				</tr>			
				
				
				<tr>
					<th scope="row"><label for="newpassword">{if !$is_new}{t}New{/t} {/if}{t}Password{/t}</label></th>
					<td><input type="password" value="" name="newpassword" id="newpassword"  /></td>
					<td></td>
				</tr>			
				
				<tr>
					<th scope="row"><label for="confirm">{if !$is_new}{t}New{/t} {/if}{t}Password (again){/t}</label></th>
					<td><input type="password" value="" name="confirm" id="confirm" /></td>
					<td></td>
				</tr>	
		
				</tbody>
			
			</table>
			
			
			</div>			

		</form>
	

{include file="file:$admin_theme_global_path/_footer.tpl"}
