{namespace name="frontend/amazon_payments_advanced/main"}
{if $BestitIsHttps}
    <div id="{$bestitAmazonPaymentsAdvancedWidget}WidgetDiv" class="{$cssClass}"></div>
    {include file='frontend/amazon_payments_advanced/script.tpl'}
    {if $bestitAmazonPaymentsAdvanced.type > 1}
        <script type="application/javascript">
            new OffAmazonPayments.Widgets.{$bestitAmazonPaymentsAdvancedWidget}({
                sellerId: '{$bestitAmazonPaymentsAdvanced.sellerId}',
                {if $bestitAmazonPaymentsAdvancedWidget eq 'AddressBook'}
                onOrderReferenceCreate: function (orderReference) {
                    var amazonOrderReferenceId = orderReference.getAmazonOrderReferenceId();
                    var _href = $("a#AmazonAddressWidgetLink").attr("href");
                    $("a#AmazonAddressWidgetLink").attr("href", _href + "/{$bestitAmazonPaymentsAdvanced.session}/" + amazonOrderReferenceId);
                },
                {/if}
                {if $bestitAmazonPaymentsAdvancedWidget eq 'AddressBook'}onAddressSelect{else}onPaymentSelect{/if}: function (orderReference) {
                    $('a.amazon-check-button').hide();
                    $('a.amazon-check-button-checked').show();
                },
                design: {
                    designMode: {if $bestitAmazonPaymentsAdvanced.smartphoneCollapsible}'smartphoneCollapsible'{else}'responsive'{/if}
                },
                onError: function (error) {
                    // your error handling code
                }
            }).bind("{$bestitAmazonPaymentsAdvancedWidget}WidgetDiv");
        </script>
    {else}
        <script type="text/javascript">
            new OffAmazonPayments.Widgets.{$bestitAmazonPaymentsAdvancedWidget}({
                sellerId: '{$bestitAmazonPaymentsAdvanced.sellerId}',
                amazonOrderReferenceId: '{$bestitAmazonPaymentsAdvanced.purchaseId}',
                {if $bestitAmazonPaymentsAdvancedWidget eq 'AddressBook'}onAddressSelect{else}onPaymentSelect{/if}: function (orderReference) {
                    $('a.amazon-check-button').hide();
                    $('a.amazon-check-button-checked').show();
                },
                design: {
                    designMode: {if $bestitAmazonPaymentsAdvanced.smartphoneCollapsible}'smartphoneCollapsible'{else}'responsive'{/if}
                },
                onError: function (error) {
                    // your error handling code
                }
            }).bind("{$bestitAmazonPaymentsAdvancedWidget}WidgetDiv");
        </script>
    {/if}
{/if}
