{namespace name="frontend/amazon_payments_advanced/main"}
{block name='frontend_bestit_amazon_payments_advanced_button'}
    {if ($bestitAmazonPaymentsAdvancedButtonType == "PwA" && $bestitAmazonPaymentsAdvanced.basketQuantity > 0) || $bestitAmazonPaymentsAdvancedButtonType != "PwA"}
    <div id="AmazonLoginAndPayButton{$bestitAmazonPaymentsAdvancedDisplay}" class="amazon_button_{$bestitAmazonPaymentsCssClass}"
         style="{if $bestitAmazonPaymentsAdvanced.hide}display:none;{/if}{if $bestitAmazonPaymentsAdvancedDisplay == "ModalCart"}float: right;{/if}">
        {if $bestitAmazonPaymentsAdvancedDisplay != 'Bottom'}
            {include file='frontend/amazon_payments_advanced/script.tpl'}
        {/if}
        <script type="text/javascript">
            {if !$bestitAmazonPaymentsTimeout}
            window.onAmazonPaymentsReady = function () {
            {/if}
                var authRequest;
                OffAmazonPayments.Button("AmazonLoginAndPayButton{$bestitAmazonPaymentsAdvancedDisplay}", "{$bestitAmazonPaymentsAdvanced.sellerId}", {
                    type: "{$bestitAmazonPaymentsAdvancedButtonType}",
                    color: "{$bestitAmazonPaymentsAdvancedButtonColor}",
                    size: "{$bestitAmazonPaymentsAdvancedButtonSize}",
                    language: "{$Locale|replace:'_':'-'}",
                    authorization: function () {
                        loginOptions = {
                            scope: "profile payments:widget payments:shipping_address",
                            popup: true
                        };
                        authRequest = amazon.Login.authorize(
                            loginOptions,
                            "{url forceSecure=true controller=AmazonPaymentsAdvanced action=login target=$bestitAmazonPaymentsAdvancedTarget}"
                        );
                    },
                    onError: function (error) {
                        // your error handling code
                    }
                });
            {if !$bestitAmazonPaymentsTimeout}
            }
            {/if};
        </script>
    </div>
    {/if}
{/block}
