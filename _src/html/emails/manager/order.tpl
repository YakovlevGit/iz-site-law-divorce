{extends file="emails/manager.tpl"}

{block name=message}
    <p>Заказ услуги от посетителя сайта.</p>
    {if $properties.service}
        {if $object = $modx->getObject('modResource', $properties.service)}
            <p>Заказана услуга: {$object->pagetitle}</p>
        {else}
            <p>Заказ услуги от посетителя сайта.</p>
        {/if}
    {/if}
    {if $properties.comment}
        <p>Комментарий к заказу:</p>
        <p>{$properties.comment|default:'Сообщение отсутствует.'}</p>
    {/if}
{/block}