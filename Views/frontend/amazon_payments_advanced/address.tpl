{extends file="frontend/amazon_payments_advanced/register.tpl"}
{namespace name="frontend/amazon_payments_advanced/main"}
{block name='frontend_index_content'}
	<div class="custom grid_13 cbaregister">
		<h1>{se name='checkout_action_address_headline'}Wählen Sie Ihre Lieferadresse{/se}</h1>
		{if $bestitAmazonPaymentsAdvancedshowDispatchMessage}
			<p class="error">{se name='checkout_actions_address_text_head_unsuccess'}Ihre ausgewählte Lieferadresse können wird leider nicht bearbeiten. Bitte wählen Sie eine andere.{/se}</p>
		{else}
			<p>{se name='checkout_actions_address_text_head'}Wählen Sie hier Ihre Lieferadresse aus. Ihre bei Amazon hinterlegte Rechnungsadresse wird später übermittelt.{/se}</p>
		{/if}
		{include file="frontend/amazon_payments_advanced/widget.tpl" cssClass="amazonSingleWidget"}
		<div class="clear space"></div>
		<p>{se name='checkout_actions_address_text_bottom'}Im nächsten Schritt wählen Sie Ihre bevorzugte Zahlungsart aus.{/se}</p>
			<div class="register--login-action">
				<a class="amazon-check-button" style="opacity: 0.5;" onclick="alert('{s name="amazon_choose_address_first"}Bitte wählen Sie zuerst eine Adresse aus.{/s}'); return false;" title="{s name='checkout_actions_payment_title'}Weiter{/s}">
					<button class="btn right is--primary is--icon-right">{se name="checkout_actions_payment_button"}Weiter{/se} <i class="icon--arrow-right"></i></button>
				</a>
				<a class="amazon-check-button-checked" style="display:none;" href="{url controller='AmazonPaymentsAdvanced' action='wallet' forceSecure}" title="{s name='checkout_actions_payment_title'}Weiter{/s}" id="AmazonAddressWidgetLink">
					<button class="btn right is--primary is--icon-right">{se name="checkout_actions_payment_button"}Weiter{/se} <i class="icon--arrow-right"></i></button>
				</a>
			</div>
		<div class="clear space"></div>
	</div>
{/block}
