{extends file="page.tpl"}

{block name=content}
    <div class="container no-bottom-margin">
        <h1>
            {field name=pagetitle}
        </h1>

        {$tvPortfolio = {tv name=portfolio}|json_decode:true|array_reverse}

        {if is_array($tvPortfolio)}
            <div class="grid">
                {foreach $tvPortfolio as $data}

                    <div class="grid__cell s12 l6" style="margin-bottom: 1.5rem;">
                        <div class="card horizontal card--customize-portfolio">
                            <div class="card-image">

                                {$images = $data.images|json_decode:true}

                                {if is_array($images)}
                                    <figure class="lightbox-gallery">
                                            <span class="item-hover">
                                                {foreach $images as $key => $item}

                                                    {snippet name="phpthumbof" params=[
                                                    "input" => $item.image,
                                                    "options" => "&w=640&h=800&zc=0&aoe=0&far=0&q=70"
                                                    ] assign=thumb}

                                                    {if $key == 0}

                                                        <a href="{$thumb}">
                                                            <i class="material-icons">zoom_in</i>
                                                        </a>

                                                    {else}

                                                        <a href="{$thumb}" style="display: none;"></a>

                                                    {/if}

                                                {/foreach}
                                            </span>

                                        {snippet name="phpthumbof" params=[
                                            "input" => $images[0].image,
                                            "options" => "&w=160&h=200&zc=0&aoe=0&far=0&q=70"
                                        ] assign=thumb}
                                        <img src="{$thumb}">
                                    </figure>
                                {/if}

                            </div>
                            <div class="card-stacked">
                                <div class="card-content">
                                    <div class="page__content">
                                        <div class="h6">{$data.title}</div>
                                        {$data.content}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                {/foreach}
            </div>
        {/if}

    </div>
{/block}