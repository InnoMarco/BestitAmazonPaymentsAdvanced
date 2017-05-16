{extends file="frontend/index/header.tpl"}

{block name="frontend_index_header_javascript_modernizr_lib" append}
    {if $BestitIsHttps}
        {if $bestitAmazonPaymentsAdvanced.widgetUrl}
            <script type="text/javascript" src="{$bestitAmazonPaymentsAdvanced.widgetUrl}?sellerId={$bestitAmazonPaymentsAdvanced.sellerId}"></script>
        {/if}
    {/if}
{/block}