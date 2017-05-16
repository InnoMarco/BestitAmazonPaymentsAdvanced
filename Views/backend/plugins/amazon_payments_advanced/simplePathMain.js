var url = document.location.pathname + 'bestitSimplePath';

Ext.Ajax.request({
    url: url,
    params: [],
    method: 'POST',
    success: function (response) {
        var data = Ext.JSON.decode(response.responseText);
        var postData = data["postData"];
        var configData = data['configValues'];
        var amazonUrl = configData['url'];
        var existingFrom = document.getElementById('AmazonRegistrationForm');

        if (existingFrom) {
            existingFrom.remove();
        }

        var form = new Ext.FormPanel({
            frame: true,
            standardSubmit: true,
            hidden: true,
            url: amazonUrl,
            items: [],
            renderTo: Ext.getBody()
        });

        var fieldset = {
            xtype: 'fieldset',
            title: 'SimplePath',
            collapsible: true,
            defaults: {xtype: 'textfield'}, // the default type of the field
            items: []
        };

        Ext.iterate(postData, function (key, value) {

            fieldset.items.push({
                name: key,
                value: value
            });
        });

        form.add(fieldset);

        Ext.MessageBox.show({
            title: 'Amazon Payments',
            msg: 'Weiterleitung zur Registrierung ?',
            buttons: Ext.MessageBox.OKCANCEL,
            fn: function (btn) {
                if (btn == 'ok') {
                    form.submit({target: '_blank'});
                } else {
                    return;
                }
            }
        });
    }
});