{namespace name="frontend/amazon_payments_advanced/main"}
{block name="frontend_checkout_shipping_payment_core_payment_fields"}
    {if $BestitIsHttps}
        <input type="hidden" name="payment" value="{$bestitAmazonPaymentsAdvanced.paymentId}" id="payment_mean{$bestitAmazonPaymentsAdvanced.paymentId}"/>
    {/if}
{/block}