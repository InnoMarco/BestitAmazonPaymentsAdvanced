{extends file="frontend/index/index.tpl"}
{namespace name="frontend/amazon_payments_advanced/main"}

{block name="frontend_index_header_css_screen" append}
	<link type="text/css" media="all" rel="stylesheet" href="{link file='frontend/_resources/styles/BestitAmazonPaymentsAdvanced.css'}"/>
{/block}

{* Step box *}
{block name="frontend_index_content_top"}
	{include file="frontend/register/steps.tpl" sStepActive="register"}
{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}<hr class="clear" />{/block}

