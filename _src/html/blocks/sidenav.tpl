{if {config name=site_start} == $modx->resource->id}
    {$config = 'navbarMainPage'}
    {else}
    {$config = 'navbarMobileInnerPage'}
{/if}

<ul id="sidenav-mobile" class="sidenav">
    {snippet name="Wayfinder@{$config}"}
</ul>