{namespace name="frontend/amazon_payments_advanced/main"}
{if $BestitIsHttps}
    {if $bestitAmazonPaymentsAdvanced.type > 1 AND $bestitAmazonPaymentsAdvanced.clientId}
        <script type="application/javascript">
            window.onAmazonLoginReady = function () {
                amazon.Login.setClientId('{$bestitAmazonPaymentsAdvanced.clientId}');
            };
        </script>
    {/if}
    {if $Controller == 'checkout' || $Controller == 'AmazonPaymentsAdvanced' || $Controller == 'account' || $Controller == 'register' || $Controller == 'detail'}
        <script type="text/javascript" src="{$bestitAmazonPaymentsAdvanced.widgetUrl}?sellerId={$bestitAmazonPaymentsAdvanced.sellerId}"></script>
    {/if}
{/if}