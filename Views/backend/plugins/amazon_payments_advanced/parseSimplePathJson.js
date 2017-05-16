Ext.define('AmazonPaymentsAdvanced.SimplePath', {
    extend: 'Ext.window.Window',
    require: [],

    title: 'Amazon Payments Advanced Simple Path',
    height: 300,
    width: 600,
    items:  [

        Ext.create('Ext.form.FormPanel', {
            title      : 'Credentials',
            height     : '100%',
            width      : '100%',
            bodyPadding: 0,
            url        : '',
            renderTo   : Ext.getBody(),
            items: [{
                xtype     : 'textareafield',
                grow      : true,
                name      : 'simplePath',
                //fieldLabel: 'Simple Path',
                anchor    : '100%'
            }],
            buttons: [{
                text: 'Reset',
                handler: function() {
                    this.up('form').getForm().reset();
                }
            }, {
                text: 'Submit',
                formBind: true,
                disabled: true,
                handler: function() {
                    var form = this.up('form').getForm();
                    if (form.isValid()) {
                        var fields = form.getValues();
                        var data;
                        try {
                            data = JSON.parse(fields['simplePath']);
                            btn.up('panel').down('[elementName=amazonSellerId]').setValue(String(data['merchant_id']).trim());
                            btn.up('panel').down('[elementName=amazonAccessKeyId]').setValue(String(data['access_key']).trim());
                            btn.up('panel').down('[elementName=amazonSecretAccessKey]').setValue(String(data['secret_key']).trim());
                            // btn.up('panel').down('[elementName=]').setValue(String(data['marketplaceId']).trim());
                            btn.up('panel').down('[elementName=clientId]').setValue(String(data['client_id']).trim());
                            // btn.up('panel').down('[elementName=]').setValue(String(data['client_secret']).trim());
                            // btn.up('panel').down('[elementName=]').setValue(String(data['uniqueId']).trim());

                            this.up('window').close();
                        }
                        catch(err) {
                            console.dir(err);
                            Ext.Msg.alert('Fehler', 'Bitte fügen Sie Ihre Simple Path Daten ein.');
                        }
                    }
                }
            }]
        })
    ]

});

Ext.onReady(function () {
    var simplePath = Ext.create('AmazonPaymentsAdvanced.SimplePath');
    simplePath.show();
});