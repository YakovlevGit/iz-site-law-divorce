{assign var=params value=[
    'id'    => 5,
    'current'   => true,
    'cache' => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    {$object = $result.object}
    {$tvPortfolio = $object.tvs.portfolio.value|json_decode:true}

    {if is_array($tvPortfolio)}

        {$count = (count($tvPortfolio) > 2) ? 2 : count($tvPortfolio)}
        {$keys = array_rand($tvPortfolio, $count)}

        <section id="{$object.link_attributes}" class="section section--vin-case">
            <div class="container">
                <div class="section__title section__title--styled">
                    <span>Примеры выигранных дел</span>
                </div>
                <div class="grid">
                    {foreach $keys as $key}
                        {$data = $tvPortfolio[$key]}
                        <div class="grid__cell s12 l6" style="margin-bottom: 20px;">
                            <div class="card horizontal">
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

                {include file="blocks/buttons/viewmore.tpl" uri=$object.uri title="Еще примеры дел"}

            </div>
        </section>
    {/if}

{/if}