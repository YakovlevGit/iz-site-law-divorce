{if {config name=site_start} == $modx->resource->id}
    {$config = 'navbarMainPage'}
    {else}
    {$config = 'navbarInnerPage'}
{/if}

<nav class="nav">
    <div class="nav-wrapper">
        {if {config name=site_start} == $modx->resource->id}
            <span class="brand-logo">
                <img src="assets/images/logo_razvody.png" class="responsive-img" />
                Юрпрофит
                <small>Расторжение брака</small>
            </span>
            {else}
            <a href="{$modx->makeUrl({config name=site_start})}" class="brand-logo">
                <img src="assets/images/logo_razvody.png" class="responsive-img" />
                Юрпрофит
                <small>Расторжение брака</small>
            </a>
        {/if}
        <a href="#" data-target="sidenav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="nav--desktop">
            {snippet name="Wayfinder@{$config}"}
        </ul>
    </div>
</nav>