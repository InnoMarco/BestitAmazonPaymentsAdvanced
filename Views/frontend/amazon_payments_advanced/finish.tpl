{namespace name="frontend/amazon_payments_advanced/main"}
{block name="frontend_index_header_javascript" append}
    {if $BestitIsHttps}
        {if $bestitAmazonPaymentsAdvanced.type > 1 AND $bestitAmazonPaymentsAdvanced.clientId}
            {include file="frontend/amazon_payments_advanced/script.tpl"}
            <script type="application/javascript">
                amazon.Login.logout();
            </script>
        {/if}
    {/if}
{/block}

{block name='frontend_checkout_finish_billing_address_content'}
    {if $BestitIsHttps}
        <div class="panel--body is--wide">
            {if $sUserData.billingaddress.company}
                <strong>{$sUserData.billingaddress.company}{if $sUserData.billingaddress.department}<br/>{$sUserData.billingaddress.department}{/if}</strong>
                <br>
            {/if}

            {$sUserData.billingaddress.firstname} {$sUserData.billingaddress.lastname}<br/>
            {$sUserData.billingaddress.street}<br/>
            {if $sUserData.billingaddress.additional_address_line1}{$sUserData.billingaddress.additional_address_line1}<br/>{/if}
            {if $sUserData.billingaddress.additional_address_line2}{$sUserData.billingaddress.additional_address_line2}<br/>{/if}
            {$sUserData.billingaddress.zipcode} {$sUserData.billingaddress.city}<br/>
            {if $sUserData.additional.state.statename}{$sUserData.additional.state.statename}<br/>{/if}
            {$sUserData.additional.country.countryname}
        </div>
        <div class="panel--body is--wide">
            {s name="info_billing_address"}Die Rechnungsadresse wird ggf. noch durch Ihre bei Amazon hinterlegte Adresse angepasst.{/s}
        </div>
    {/if}
{/block}


{block name='frontend_checkout_finish_shipping_address_content'}
    {if $BestitIsHttps}
        <div class="panel--body is--wide">
            {if $sUserData.shippingaddress.company}
                <strong>{$sUserData.shippingaddress.company}{if $sUserData.shippingaddress.department}<br/>{$sUserData.shippingaddress.department}{/if}</strong>
                <br>
            {/if}

            {$sUserData.shippingaddress.firstname} {$sUserData.shippingaddress.lastname}<br/>
            {$sUserData.shippingaddress.street}<br/>
            {if $sUserData.shippingaddress.additional_address_line1}{$sUserData.shippingaddress.additional_address_line1}<br/>{/if}
            {if $sUserData.shippingaddress.additional_address_line2}{$sUserData.shippingaddress.additional_address_line2}<br/>{/if}
            {$sUserData.shippingaddress.zipcode} {$sUserData.shippingaddress.city}<br/>
            {if $sUserData.additional.stateShipping.statename}{$sUserData.additional.stateShipping.statename}<br/>{/if}
            {$sUserData.additional.countryShipping.countryname}
        </div>
    {/if}
{/block}