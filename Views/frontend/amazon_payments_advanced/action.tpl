{namespace name="frontend/amazon_payments_advanced/main"}
{block name="frontend_index_header_css_screen" append}
    {if $BestitIsHttps}
        <style type="text/css">
            .amazon_button_confirm {
                text-align: right;
                margin-top: 10px;
            }

            body.ctl_checkout #content #confirm div.additional_footer {
                height: 32px;
            }
        </style>
    {/if}
{/block}

{block name="frontend_index_header_javascript" append}
    {if $BestitIsHttps}
        <script type="text/javascript" src="{$amazonCBAWidgetUrl}"></script>
    {/if}
{/block}


{block name="frontend_checkout_confirm_submit"}
    {if $BestitIsHttps}
        {s name="amazon_customer_message_on_confirm_page"}Sie wählen Ihre Lieferadresse und Zahlungsart über Ihr Amazon-Konto aus. Erst dann schließen Sie Ihre Bestellung kostenpflichtig ab.{/s}
        {if $bestitAmazonPaymentsAdvanced.type > 1}
            {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsCssClass="confirm" bestitAmazonPaymentsAdvancedDisplay=$bestitAmazonPaymentsAdvancedDisplay bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayCartButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color bestitAmazonPaymentsAdvancedTarget=address}
        {else}
            {include file='frontend/amazon_payments_advanced/amazon_button_pay_only.tpl' bestitAmazonPaymentsTimeout=1 bestitAmazonPaymentsCssClass="confirm" bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayCartButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayCartButton.color}
        {/if}
    {/if}
{/block}

