{include file="file:$admin_theme_global_path/_header.tpl" page_title="Users"}
<h2>Users</h2>
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

         <div class="grid_6 alpha">
              <div class="pager">
              <a href="#" class="first">First</a>
              <a href="#" class="previous">Previous</a>
              <span>Page <strong>2</strong> of <strong>12</strong></span>
              <a href="#" class="next">Next</a>
              <a href="#" class="last">Last</a>            
              <span>Showing <strong>1-30</strong> of <strong>214</strong></span>
            </div>
              
         </div>
         <div class="grid_10 omega">
			<a href="{url}/bolts/useradmin/edit{/url}">{t}Create New User{/t}</a>         
         </div>
          <div class="clear"></div>





{*include file="file:$admin_theme_global_path/_pager.tpl"*}
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
		<p>{t}No users found.{/t}</p>	
	{/if}

{include file="file:$admin_theme_global_path/_footer.tpl"}
