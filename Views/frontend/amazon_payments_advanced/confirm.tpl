{extends file="frontend/checkout/confirm.tpl"}
{namespace name="frontend/amazon_payments_advanced/main"}
{block name="frontend_index_header_css_screen"}
    {$smarty.block.parent}
    {if $BestitIsHttps}
        <style type="text/css">
            .invoice-address, .shipping-address, .payment-display .actions, #confirm-billing-address, #confirm-shipping-address, #confirm-show-payment, #confirm-select-payment {
                display: none;
            }

            #confirm .personal-information .payment-display {
                height: 65px;
            }

            .APASingleConfirmWidget {
                margin-bottom: 0.25rem;
                height: 150px;
                width: auto;
            }

            .APASingleConfirmWidgetAction {
                margin-bottom: 1.25rem;
            }
        </style>
    {/if}
{/block}

{block name="frontend_index_header_javascript_jquery"}
    {$smarty.block.parent}
    {if $BestitIsHttps}
        <script type='text/javascript'>
            jQuery(document).ready(function() {
                jQuery("input[type='submit']").attr("disabled", false);

                jQuery("form").submit(function () {
                    jQuery("input[type='submit']").attr("disabled", true);
                    return true;
                });
            });
        </script>
    {/if}
{/block}

{block name='frontend_checkout_confirm_information_addresses'}
    {if $BestitIsHttps}
    <div class="information--panel-item" style="width: 100%;">
        <div class="panel  is--rounded block information--panel">
            <div class="APAConfirmWidgets">
                {include file='frontend/amazon_payments_advanced/script.tpl'}
                <div id="readOnlyAddressBookWidgetDiv" class="APASingleConfirmWidget"></div>
                <div class="action APASingleConfirmWidgetAction">
                    <a href="{url controller='AmazonPaymentsAdvanced' action='address' forceSecure}"
                       title="{s name='checkout_confirm_widget_address_book_title'}Adresse ändern{/s}" class="button-middle small btn btn-default btn-small">
                        {s name="checkout_confirm_widget_address_book_link"}Adresse ändern{/s}
                    </a>
                </div>
                <div id="readOnlyWalletWidgetDiv" class="APASingleConfirmWidget"></div>
                <div class="action APASingleConfirmWidgetAction">
                    <a href="{url controller='AmazonPaymentsAdvanced' action='wallet' forceSecure}"
                       title="{s name='checkout_confirm_widget_wallet_title'}Zahlungsart ändern{/s}"
                       class="button-middle small btn btn-default btn-small">
                        {s name="checkout_confirm_widget_wallet_link"}Zahlungsart ändern{/s}
                    </a>
                </div>

                <script type="application/javascript">
                    new OffAmazonPayments.Widgets.AddressBook({
                        sellerId: '{$bestitAmazonPaymentsAdvanced.sellerId}',
                        amazonOrderReferenceId: '{$bestitAmazonPaymentsAdvanced.purchaseId}',
                        displayMode: "Read",
                        design: {
                            designMode: {if $bestitAmazonPaymentsAdvanced.smartphoneCollapsible}'smartphoneCollapsible'{else}'responsive'{/if}
                        },
                        onError: function (error) {
                        }
                    }).bind("readOnlyAddressBookWidgetDiv");
                </script>
                <script type="application/javascript">
                    new OffAmazonPayments.Widgets.Wallet({
                        sellerId: '{$bestitAmazonPaymentsAdvanced.sellerId}',
                        amazonOrderReferenceId: '{$bestitAmazonPaymentsAdvanced.purchaseId}',
                        displayMode: "Read",
                        design: {
                            designMode: {if $bestitAmazonPaymentsAdvanced.smartphoneCollapsible}'smartphoneCollapsible'{else}'responsive'{/if}
                        },
                        onError: function (error) {
                        }
                    }).bind("readOnlyWalletWidgetDiv");
                </script>
            </div>
            <div class="space"></div>
            {if $sDispatches}
                <div class="content--confirm">
                    <input type="hidden" name="payment" value="{$sPayment.id}"/>
                    {*Shipping method*}

                    <div class="confirm--inner-container block">
                        <div class="dispatch--method-list panel has--border is--rounded block">
                            <h3 class="dispatch--method-headline panel--title is--underline">{s namespace='frontend/checkout/shipping_payment' name='ChangeShippingTitle'}{/s}</h3>
                            <div class="panel--body is--wide block-group">
                                {foreach $sDispatches as $dispatch}
                                    <div class="dispatch--method{if $dispatch@last} method_last{else} method{/if} block">
                                        <div class="method--input">
                                            <input type="radio" disabled="disabled" id="confirm_dispatch{$dispatch.id}" class="radio auto_submit" value="{$dispatch.id}" name="sDispatch"{if $dispatch.id eq $sDispatch.id} checked="checked"{/if}/>
                                        </div>
                                        <div class="method--label is--first">
                                            <label class="method--name is--strong" for="confirm_dispatch{$dispatch.id}">{$dispatch.name}</label>
                                        </div>
                                        {if $dispatch.description}
                                            <div class="method--description">
                                                {$dispatch.description}
                                            </div>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    <div class="action APASingleConfirmWidgetAction">
                        <a href="{url controller='checkout' action='shippingPayment' sTarget='checkout' sTargetAction='index'}" class="button-middle small btn btn-default btn-small">
                            {s namespace='frontend/checkout/shipping_payment' name='ChangeShippingTitle'}Versandart wählen{/s}
                        </a>
                    </div>
                </div>
            {/if}
            <div class="space"></div>
            {if $bestitAmazonPaymentsAdvanced.sandbox}
                <script type="application/javascript">
                    function saveSimulation(str) {
                        if (window.XMLHttpRequest) {
                            xmlhttp = new XMLHttpRequest();
                            xmlhttp.open("GET", "{url controller=AmazonPaymentsAdvanced action=simulation forceSecure=true}?simulation=" + str, true);
                            xmlhttp.send();
                        }
                    }
                </script>
                <h2 class="headingbox">Simulierung</h2>
                <select name="simulation" id="amazon_simulation_code_select" onchange="saveSimulation(this.value)">
                    <option value="">Normale Bestellung</option>
                    <option value="authorize-AmazonRejected">Ungültige Autorisierung</option>
                    <option value="authorize-invalidpaymentmethod-1">Ungültige Zahlungsart für 1 Minute</option>
                    <option value="authorize-invalidpaymentmethod-2">Ungültige Zahlungsart für 2 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-5">Ungültige Zahlungsart für 5 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-10">Ungültige Zahlungsart für 10 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-20">Ungültige Zahlungsart für 20 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-30">Ungültige Zahlungsart für 30 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-45">Ungültige Zahlungsart für 45 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-60">Ungültige Zahlungsart für 60 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-90">Ungültige Zahlungsart für 90 Minuten</option>
                    <option value="authorize-invalidpaymentmethod-120">Ungültige Zahlungsart für 2 Stunden</option>
                    <option value="authorize-invalidpaymentmethod-240">Ungültige Zahlungsart für 4 Stunden</option>
                    <option value="capture-AmazonRejected">Ungültiges Capture</option>
                </select>
                <div class="space"></div>
            {/if}
        </div>
    </div>
    {/if}
{/block}

{block name="frontend_checkout_confirm_information_payment"}{/block}

