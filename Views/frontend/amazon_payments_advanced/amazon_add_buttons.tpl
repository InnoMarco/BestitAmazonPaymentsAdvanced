{namespace name="frontend/amazon_payments_advanced/main"}
{block name='frontend_register_login_customer' append}
    {if $BestitIsHttps && $bestitAmazonPaymentsAdvanced.type > 1}
        {if $bestitAmazonPaymentsAdvanced.displayRegisterButton.display && $bestitAmazonPaymentsAdvanced.controller eq 'register' && $bestitAmazonPaymentsAdvanced.action eq 'index'}
            <div class="panel has--border is--rounded amazon-account--panel">
                <h2 class="panel--title is--underline">{s name="amazon_login_and_pay_headline"}Login und Bezahlen mit Amazon{/s}</h2>
                <div class="panel--body is--wide">
                    {if $BestitAmazonPaymentsAdvancedEmptyBasket}
                        {include file="frontend/_includes/messages.tpl" type="error" content="{s name='amazon_login_and_pay_empty_basket'}<span class='is--strong' style='color: darkred'>Sie müssen einen Artikel im Warenkorb haben um sich mit Amazon anmelden zu können.</span>{/s}"}
                        <div>&nbsp;</div>
                    {/if}

                    {if $bestitAmazonPaymentsAdvanced.userId}
                        <p>{s name="amazon_login_and_pay_user_signed_in"}Sie sind bereits über Ihr Amazon Konto angemeldet.{/s}
                            <a href="{url controller=AmazonPaymentsAdvanced action=logout}" onclick="amazon.Login.logout();">{s name="amazon_login_and_pay_sign_out_link"}Abmelden{/s}</a>
                        </p>
                    {else}
                        {if $bestitAmazonPaymentsAdvanced.basketQuantity > 0}
                            {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsAdvancedDisplay='Login' bestitAmazonPaymentsCssClass="on_account"  bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayRegisterButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayRegisterButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayRegisterButton.color bestitAmazonPaymentsAdvancedTarget=address}
                            <p>{s name="amazon_login_and_pay_user_signed_out"}Bezahlen Sie diese Bestellung schnell und einfach mit Ihrem Amazon Kundenkonto.{/s}</p>
                        {else}
                            {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsAdvancedDisplay='Login' bestitAmazonPaymentsCssClass="on_account"  bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayRegisterButton.login bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayRegisterButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayRegisterButton.color bestitAmazonPaymentsAdvancedTarget=account}
                            <p>{s name="amazon_login_and_pay_button_on_login_page"}Melden Sie sich schnell und einfach mit Ihrem Amazon Kundenkonto an.{/s}</p>
                        {/if}
                    {/if}
                </div>
            </div>
        {/if}
    {/if}
{/block}

{block name="frontend_checkout_ajax_cart_button_container" append}
    {if $BestitIsHttps}
        {if $bestitAmazonPaymentsAdvanced.displayModalCartButton.display}
            {if $bestitAmazonPaymentsAdvanced.type > 1}
                {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsAdvancedDisplay=ModalCart bestitAmazonPaymentsCssClass="ajaxButton button--container{if $bestitAmazonPaymentsAdvanced.paypalCart} amazon_vs_paypal{else} amazon_only{/if}" bestitAmazonPaymentsTimeout=0 bestitAmazonPaymentsAdvancedButtonType="{$bestitAmazonPaymentsAdvanced.displayModalCartButton.pay}" bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayModalCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayModalCartButton.color bestitAmazonPaymentsAdvancedTarget=address}
            {/if}
        {/if}
    {/if}
{/block}
