{extends file="frontend/amazon_payments_advanced/register.tpl"}
{namespace name="frontend/amazon_payments_advanced/main"}

{block name='frontend_index_content'}
    {if $BestitIsHttps}
        <div class="custom grid_13 cbaregister">
            {if $bestitAmazonPaymentsAdvancedError}
                <div class="alert is--error is--rounded">
                    <div class="alert--icon">
                        <i class="icon--element icon--cross"></i>
                    </div>
                    <div class="alert--content">
                        {s name='checkout_actions_wallet_head_error'}Es ist ein Fehler mit der Zahlungsart aufgetreten. Bitte w&auml;hlen Sie eine andere oder kontaktieren Sie den Shopbetreiber.{/s}
                    </div>
                </div>
            {/if}
            <h1>{se name='checkout_actions_wallet_headline'}Wählen Sie eine Zahlungsart{/se}</h1>
            <p>{se name='checkout_actions_wallet_head'}Die angezeigten Zahlungsarten haben Sie bei Amazon hinterlegt.{/se}</p>
            {include file="frontend/amazon_payments_advanced/widget.tpl" cssClass="amazonSingleWidget"}
            <div class="clear space"></div>

            <p>{se name='checkout_actions_wallet_bottom'}Im nächsten Schritt erhalten Sie eine Übersicht und können Ihre Bestellung abschließen.{/se}</p>

            <a href="{url controller='AmazonPaymentsAdvanced' action='address'}" title="{s name='checkout_actions_wallet_return_to_address_title'}Andere Adresse auswählen{/s}">
                <button type="button" class="btn left is--icon-left">{se name="checkout_actions_wallet_return_to_address_button"}Zurück{/se}<i class="icon--arrow-left"></i>
                </button>
            </a>
            <a class="amazon-check-button" style="opacity: 0.5;"
               onclick="alert('{s name="amazon_choose_payment_first"}Bitte wählen Sie zuerst eine Zahlungsart aus.{/s}'); return false;"
               title="{s name='checkout_actions_shipping_title'}Weiter{/s}">
                <button class="btn right is--primary is--icon-right">{se name="checkout_actions_shipping_button"}Weiter{/se}<i class="icon--arrow-right"></i></button>
            </a>
            <a class="amazon-check-button-checked" style="display: none;" href="{url controller='AmazonPaymentsAdvanced' action='register' forceSecure}"
               title="{s name='checkout_actions_shipping_title'}Weiter{/s}">
                <button class="btn right is--primary is--icon-right">{se name="checkout_actions_shipping_button"}Weiter{/se}<i class="icon--arrow-right"></i></button>
            </a>

            <div class="clear space"></div>
        </div>
    {/if}
{/block}