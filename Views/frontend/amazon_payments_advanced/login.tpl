{extends file="frontend/index/index.tpl"}
{namespace name="frontend/amazon_payments_advanced/main"}
{* Title *}

{* Hide sidebar left *}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}
    <hr class="clear"/>
{/block}

{block name='frontend_index_content_left'}{/block}

{block name='frontend_index_content'}
    {if $BestitIsHttps}
        <div class="content is--wide apalogin">
            {if $bestitALAPError}
                <h1>{s name=error_headline}Technisches Problem{/s}</h1>
                <div class="inner_container">
                    <p>{s name=error_text}Die Anmeldung über Amazon wurde nicht erfolgreich durchgeführt. Bitte probieren Sie es erneut oder wählen Sie eine andere Zahlungsmethode.{/s}</p>
                </div>
                {if $bestitAmazonPaymentsAdvanced.displayErrorButton.display}
                    {if $bestitAmazonPaymentsAdvanced.type > 1}
                        {if $bestitAmazonPaymentsAdvanced.basketQuantity > 0}
                            {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsCssClass="_on_account"  bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayErrorButton.pay bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayErrorButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayErrorButton.color}
                        {else}
                            {include file='frontend/amazon_payments_advanced/amazon_button_login_and_pay.tpl' bestitAmazonPaymentsCssClass="_on_account"  bestitAmazonPaymentsAdvancedButtonType=$bestitAmazonPaymentsAdvanced.displayErrorButton.login bestitAmazonPaymentsAdvancedButtonSize=$bestitAmazonPaymentsAdvanced.displayErrorButton.size bestitAmazonPaymentsAdvancedButtonColor=$bestitAmazonPaymentsAdvanced.displayErrorButton.color}
                        {/if}
                    {else}
                        {include file='frontend/amazon_payments_advanced/amazon_button_pay_only.tpl' bestitAmazonPaymentsCssClass="_on_account" bestitAmazonPaymentsTimeout=1}
                    {/if}
                {/if}
            {elseif $bestitMapALAPAccount}
                <div class="panel--body is--wide">
                    <h1>{s name="map_existing_customer_headline"}Sie besitzen bereits ein Kundenkonto{/s}</h1>
                    <form name="sLogin" method="post" action="{url controller=account action=login forceSecure}">
                        <p>
                            <span class="frontend_account_login">{s name="map_existing_customer_text"}Mit Ihrer bei Amazon hinterlegten E-Mail-Adresse existiert hier bereits ein gültiges Konto. Bitte melden Sie sich mit Ihren Zugangsdaten an um fortfahren zu können.{/s}</span>
                        </p>
                        <fieldset>
                            {block name='frontend_amazon_login_input_email'}
                                <div class="register--login-email">
                                    <input name="email" placeholder="{s name="placeholder_email"}E-Mail-Adresse{/s}" type="email" tabindex="1"
                                           value="{{$bestitMapALAPEmail|escape}|escape}" id="email" class="register--login-field{if $sErrorFlag.email} has--error{/if}"/>
                                </div>
                            {/block}

                            {block name='frontend_amazon_login_input_password'}
                                <div class="register--login-password">
                                    <input name="password" placeholder="{s name="placeholder_password"}Passwort{/s}" type="password" tabindex="2" id="passwort"
                                           class="register--login-field{if $sErrorFlag.password} has--error{/if}"/>
                                </div>
                            {/block}

                            {block name='frontend_amazon_login_input_lostpassword'}
                                <div class="register--login-lostpassword">
                                    <a href="{url controller=account action=password}"
                                       title="{"{s name="lost_password"}Lassen Sie sich Ihr Kennwort per E-Mail zusenden.{/s}"|escape}">
                                        {s name="lost_password_link"}Password vergessen?{/s}
                                    </a>
                                </div>
                            {/block}


                            <div class="action register--login-action">
                                <button class="btn is--primary is--icon-right" name="Submit" type="submit" title="{s name=sign_in_title}Anmelden{/s}">
                                    {s name="sign_in_link"}Anmelden{/s}
                                    <i class="icon--arrow-right"></i>
                                </button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            {/if}
        </div>
    {/if}
{/block}