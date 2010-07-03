  <h2>{t}Users{/t}</h2>

  
          <div class="grid_16 alpha omega" id="nav_section">
      <ul>
          <li class="first"><a{if $current eq "users"} class="current"{/if} href="{url}/bolts/useradmin/index{/url}">{t}User List{/t}</a></li>
          <li><a{if $current eq "roles"} class="current"{/if} href="{url}/bolts/role/index{/url}">{t}Roles{/t}</a></li>
          <li><a{if $current eq "resource"} class="current"{/if} href="{url}/bolts/resource/index{/url}">{t}Resources{/t}</a></li>
      </ul>
  </div>        
 <div class="clear"></div>