{namespace name="frontend/amazon_payments_advanced/main"}

{block name='frontend_bestit_amazon_payments_advanced_button'}
    {$bestitAmazonPaymentsAdvanced.display = $amazon.display +1}
    {include file='frontend/amazon_payments_advanced/script.tpl'}
    <div id="payWithAmazonDiv{$bestitAmazonPaymentsAdvanced.display}"
         class="amazon_button_{$bestitAmazonPaymentsCssClass}"{if $bestitAmazonPaymentsAdvanced.hide} style="display:none;"{/if}>
        <img src="{$bestitAmazonPaymentsAdvanced.buttonUrl}?sellerId={$bestitAmazonPaymentsAdvanced.sellerId}&type={$bestitAmazonPaymentsAdvancedButtonType}&size={$bestitAmazonPaymentsAdvancedButtonSize}&color={$bestitAmazonPaymentsAdvancedButtonColor}&language={$Locale|replace:'_':'-'}"
             style="cursor: pointer;"/>
    </div>
    <script type="text/javascript">
        {if !$bestitAmazonPaymentsTimeout}
        {literal}
        window.onAmazonPaymentsReady = function () {
            {/literal}
            {/if}
            var amazonOrderReferenceId;
            new OffAmazonPayments.Widgets.Button({
                sellerId: '{$bestitAmazonPaymentsAdvanced.sellerId}',
                onSignIn: function (orderReference) {
                    amazonOrderReferenceId = orderReference.getAmazonOrderReferenceId();
                    window.location = '{url forceSecure controller=AmazonPaymentsAdvanced action=address}?{$bestitAmazonPaymentsAdvanced.session}=' + amazonOrderReferenceId;
                },
                onError: function (error) {

                }
            }).bind("payWithAmazonDiv{$bestitAmazonPaymentsAdvanced.display}");
            {if !$bestitAmazonPaymentsTimeout}{literal}}{/literal}{/if};
    </script>
{/block}