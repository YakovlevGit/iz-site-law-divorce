{assign var=params value=[
    'id'    => 4,
    'cache' => true,
    'current'   => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    {$object = $result.object}
    <div id="{$object.link_attributes}" class="section-wrapper">
        <section class="section section--testimonials grey-lighten section--style-zigzag">
            <div class="container">
                <div class="section__title section__title--styled">
                    <span>{$object.pagetitle}</span>
                </div>
                <div class="section__content">
                    {$tvTestimonials = $object.tvs.testimonials.value|json_decode:true|array_slice:-10}

                    {if is_array($tvTestimonials)}
                        <div id="carousel-testimonials" class="carousel carousel--testimonials carousel-slider" data-speed="4000">

                            {foreach $tvTestimonials as $data}
                                <div class="carousel-item carousel__item carousel__item--cols-2" href="#slide-{$data.MIGX_id}">
                                    <div class="card">
                                        <div class="card-content">
                                            <p>{$data.text}</p>
                                        </div>
                                        <div class="card-action">
                                            <p>{$data.autor}</p>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                </div>
                {include file="blocks/buttons/viewmore.tpl" title="Все отзывы" uri=$object.uri}

            </div>
        </section>
    </div>
{/if}
