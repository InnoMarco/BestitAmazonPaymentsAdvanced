{namespace="frontend/amazon_payments_advanced/main"}

{block name="frontend_checkout_cart_error_messages"}
    {if $smarty.request.apaError}
        <div class="alert is--error is--rounded">
            {* Icon column *}
            <div class="alert--icon">
                <i class="icon--element icon--cross"></i>
            </div>

            {* Content column *}
            <div class="alert--content is--strong">
                {s name="apa_error"}Bei Ihrem Amazon Payments Vorgang ist ein Fehler vorgefallen.{/s}
            </div>
        </div>
    {/if}

    {$smarty.block.parent}
{/block}

{block name="frontend_basket_basket_is_empty"}
    {if $smarty.request.apaError}
        <div class="basket--info-messages">
            <div class="alert is--error is--rounded">
                {* Icon column *}
                <div class="alert--icon">
                    <i class="icon--element icon--cross"></i>
                </div>

                {* Content column *}
                <div class="alert--content is--strong">
                    {s name="apa_error"}Bei Ihrem Amazon Payments Vorgang ist ein Fehler vorgefallen.{/s}
                </div>
            </div>
        </div>
    {/if}

    {$smarty.block.parent}
{/block}

{block name="frontend_checkout_cart_table_actions" append}
    {if $BestitIsHttps}
        {if $bestitAmazonPaymentsAdvanced.displayCartButton.display}
            {if !$bestitAmazonPaymentsAdvancedDisplay}
                {assign var=bestitAmazonPaymentsAdvancedDisplay value=1}
            {else}
                {capture assign=bestitAmazonPaymentsAdvancedDisplay}{$bestitAmazonPaymentsAdvancedDisplay+1}{/capture}
            {/if}
            {if $bestitAmazonPaymentsAdvanced.type > 1}
                {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsCssClass="cart_action amazon_cart_top btn--checkout-proceed right{if $bestitAmazonPaymentsAdvanced.paypalCart} amazon_vs_paypal{else} amazon_only{/if}" bestitAmazonPaymentsAdvancedDisplay=$bestitAmazonPaymentsAdvancedDisplay bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayCartButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color bestitAmazonPaymentsAdvancedTarget=address}
            {else}
                {if $sUserLoggedIn}
                    {include file='frontend/amazon_payments_advanced/amazon_button_pay_only.tpl' bestitAmazonPaymentsCssClass="cart_action amazon_cart_top btn--checkout-proceed right{if $bestitAmazonPaymentsAdvanced.paypalCart} amazon_vs_paypal{else} amazon_only{/if}" bestitAmazonPaymentsAdvancedDisplay=$bestitAmazonPaymentsAdvancedDisplay bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayCartButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color}
                {/if}
            {/if}
        {/if}
    {/if}
{/block}


{block name="frontend_checkout_cart_table_actions_bottom" append}
    {if $BestitIsHttps}
        {if $bestitAmazonPaymentsAdvanced.displayCartButton.display}
            {if !$bestitAmazonPaymentsAdvancedDisplay}
                {assign var=bestitAmazonPaymentsAdvancedDisplay value=1}
            {else}
                {capture assign=bestitAmazonPaymentsAdvancedDisplay}{$bestitAmazonPaymentsAdvancedDisplay+1}{/capture}
            {/if}
            {if $bestitAmazonPaymentsAdvanced.type > 1}
                {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsCssClass="cart_action amazon_cart_bottom btn--checkout-proceed right{if $bestitAmazonPaymentsAdvanced.paypalCart} amazon_vs_paypal{else} amazon_only{/if}" bestitAmazonPaymentsAdvancedDisplay=$bestitAmazonPaymentsAdvancedDisplay bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayCartButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color bestitAmazonPaymentsAdvancedTarget=address}
            {else}
                {if $sUserLoggedIn}
                    {include file='frontend/amazon_payments_advanced/amazon_button_pay_only.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsCssClass="cart_action amazon_cart_bottom btn--checkout-proceed right{if $bestitAmazonPaymentsAdvanced.paypalCart} amazon_vs_paypal{else} amazon_only{/if}" bestitAmazonPaymentsAdvancedDisplay=$bestitAmazonPaymentsAdvancedDisplay bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayCartButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color}
                {/if}
            {/if}
        {/if}
    {/if}
{/block}
