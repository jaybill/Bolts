{include file="file:$current_path/_header.tpl"}
		
	{if isset($success)}

 		{if isset($config_file)}

			<textarea rows="20" cols="80">{$config_file}</textarea>

		{/if}
		
	{else} 
		<form method="post" action="/" class="multiform" enctype="multipart/form-data">
				<table>
                	<col id="fieldname" />
                    <col id="field" />
                    <col id="help"/>

                    <tr>
						<th scope="row"><label>Database Host</label></th>
						<td><input type="text" value="{$db_host}" name="db_host" id="db_host" class="text"/></td>
                        <td>the hostname of the server where the database server runs</td>
                    </tr>
                    
                    <tr>
						<th scope="row"><label>Database Port</label></th>
						<td><input type="text" value="{$db_port}" name="db_port" id="db_port" class="text"/></td>
                        <td>the port the database server uses (usually 3306)</td>
                    </tr>                    
                    
					<tr>
						<th scope="row"><label>Database Socket</label></th>
						<td><input type="text" value="{$db_sock}" name="db_sock" id="db_sock" class="text"/></td>
                        <td> the socket that the database server uses (optional)</td>
                    </tr> 
						
					<tr>
						<th scope="row"><label>Database Name</label></th>
						<td><input type="text" value="{$db_name}" name="db_name" id="db_name"/></td>
                        <td>name of the database to use (must already exist)</td>
                    </tr>                        
                        
					<tr>
						<th scope="row"><label>Database Username</label></th>
						<td><input type="text" value="{$db_user}" name="db_user" id="db_user"/></td>
                        <td>username that has the ability to create tables in the database</td>
                    </tr>						
                        	
					<tr>
						<th scope="row"><label>Database Password</label></th>
						<td><input type="password" value="{$db_pass}" name="db_pass" id="db_pass"/></td>
                        <td>password for the above database user</td>
                    </tr>						
							
					<tr>
						<th scope="row"><label>Time zone</label></th>
						<td>
                        <!--{html_options name=Bolts_timezone id=Bolts_timezone options=$timezones selected=$Bolts_timezone}-->
	                    <select>
    	    	            <option>America/Los Angeles</option>
        	            </select>
                        <td>the timezone that this instance of Bolts should use</td>
                    </tr>					

					<tr>
						<th scope="row"><label>Applcation Name</label></th>
						<td><input type="text" value="{$app_name}" name="app_name" id="app_name"/></td>
                        <td>the name of your application. (this can be changed later)</td>
                    </tr>								
					
					<tr>
						<th scope="row"><label>Admin Username</label></th>
						<td><input type="text" value="{$admin_username}" name="admin_username" id="admin_username"/></td>
                        <td>username for the admin user (password assigned later)</td>
                    </tr>				
								
					<tr>
						<th scope="row"><label>Admin Email</label></th>
						<td><input type="text" value="{$admin_email}" name="admin_email" id="admin_email"/></td>
                        <td>email address of the admin user</td>
                    </tr>

			</table>
			<span id="submit">	
			<input type="submit" class="button yes" value="Install"/>
			</span>
	    </form>
	{/if}

{include file="file:$current_path/_footer.tpl"}
