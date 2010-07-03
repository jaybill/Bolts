{include file="file:$admin_theme_global_path/_header.tpl" page_title="Users"}
{include file="file:$admin_theme_global_path/_user_section_nav.tpl" current="users"}
  <div class="grid_16 alpha omega">
      <form action="{url}/bolts/useradmin/index{/url}" method="post" id="filters">
      <label>Filters:</label>
      <select>
          <option>Search Term</option>          
      </select>
      <input type="text" id="searchterm" name="searchterm" value="{$searchterm}"/>
      <input type="submit" value="Add Filter"/>
      </form> 
     {if count($filters_applied) gt 0}
      <ul id="filters-applied">
          <li class="label"><span>Applied Filters:</span></li>
          {foreach from=$filters_applied item=filter_applied}
          <li><a href="#">Before <strong>5/16</strong></a></li>          
          {/foreach}
      </ul>
  	{/if}
  </div>
  	<div class="clear"></div>			

	 <div class="grid_6 alpha pager-hole">
		{include file="file:$admin_theme_global_path/_pager.tpl"}			              
	 </div>
	 <div class="grid_10 omega" >
	 	
	 	<div class="new-record" >         	
			<a href="{url}/bolts/useradmin/edit{/url}" class="new-record-link">{t}Create New User{/t}</a>
		</div>
					         
	 </div>
	  <div class="clear"></div>






	{if count($users) gt 0}	
		<div class="grid_16 alpha omega">        
         <div class="tabular"> 
              <table>
                <col />
                <col />
                <col />
                <col class="last"/>
                
                <thead>
                  <tr>
                    <th><a href="#" class="sort-asc">{t}Username{/t}</a></th>
                    <th><a href="#" class="sort-desc">{t}Full Name{/t}</a></th>                    
                    <th>{t}Email{/t}</th>
                    <th>{t}Last Login{/t}</th>
                  </tr>
                </thead>
  
                <tbody>
                {foreach from=$users item=user key=index}
                  <tr class="{cycle values=",odd"}">
                    <td><a href="{url}/bolts/useradmin/edit/username/{$user.username}{/url}">{$user.username}</a></td>
                    <td>{$user.full_name}</td>                    
                    <td>{$user.email}</td>
                    <td>{$user.last_login_on}</td>
                  </tr>                 
                 {/foreach} 
                                                               
                </tbody>
              </table>
              </div>
              </div>
	{else}
		<div class="no-records">{t}No users found.{/t}</div>
	{/if}

{include file="file:$admin_theme_global_path/_footer.tpl"}
