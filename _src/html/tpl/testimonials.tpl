{extends file="page.tpl"}

{block name=content}
    <div class="container no-bottom-margin">
        <h1>
            {field name=pagetitle}
        </h1>
        <div class="grid">
            {$tvTestimonials = {tv name=testimonials}|json_decode:true|array_reverse}

            {if is_array($tvTestimonials)}
                {foreach $tvTestimonials as $data}
                    <div class="grid__cell s12 m6 l4" style="margin-bottom: 20px;">
                        <div class="card card--bordered z-depth-0 card--customize-testimonials">
                            <div class="card-content">
                                <p>{$data.text}</p>
                            </div>
                            <div class="card-action">
                                <p>{$data.autor}</p>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        </div>
    </div>
{/block}