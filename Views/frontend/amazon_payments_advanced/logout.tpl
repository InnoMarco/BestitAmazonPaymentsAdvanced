{extends file='frontend/index/index.tpl'}
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

{* Breadcrumb *}
{block name='frontend_index_start'}{/block}
{block name='frontend_index_content_left'}{/block}

{block name='frontend_index_content'}
    {if $BestitIsHttps}
        <div class="account--logout account--content content is--wide">

            {block name="frontend_account_logout_info"}
                <div class="account--welcome panel">

                    {block name="frontend_account_logout_info_headline"}
                        <h1 class="panel--title">{se name='sign_out_headline'}Amazon Abmeldung erfolgreich{/se}</h1>
                    {/block}

                    {block name="frontend_account_logout_info_content"}
                        <div class="panel--body is--wide">
                            <p class="logout--text">{se name='sign_out_text'}Sie wurden erfolgreich von Ihrem Amazon Konto abgemeldet.{/se}</p>
                        </div>
                    {/block}

                    {block name="frontend_account_logout_info_actions"}
                        <div class="panel--actions is--wide">
                            <a class="btn is--secondary is--icon-left" href="{url controller='index'}" title="{"{s name='go_to_front_page_title'}{/s}"|escape}">
                                <i class="icon--arrow-left"></i>{s name="go_to_front_page_button"}Zur Startseite{/s}
                            </a>
                        </div>
                    {/block}
                </div>
            {/block}

        </div>
    {/if}
{/block}




