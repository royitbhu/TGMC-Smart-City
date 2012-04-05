

  Ext.onReady(function(){   
    var win;
    var button = Ext.get('sign-in-btn');
    button.on('click', function(){
    if(!win){
        win = new Ext.Window({
            buttonAlign : 'right',
            iconCls     : 'lock',
            title       : 'Please Login',
            layout      : 'border',
            width       : 500,
            height      : 250,
            minHeight   : 250,
            closable    : true,
            draggable   : true,
            id          : 'login-win',
            //closeAction:'hide',
            //plain       : true,
            items       : [smartCity, loginForm],
            resizable   : true,

            keys: {
                key: [13],
                fn: function() {
                      loginForm.getForm().getEl().dom.action = '../../../login';
                      loginForm.getForm().getEl().dom.method = 'POST';
                      loginForm.getForm().submit();
                },
                scope:this
            },

            buttons: [{
                handler: function() {
            	loginForm.getForm().getEl().dom.action = '../../../login';
                loginForm.getForm().getEl().dom.method = 'POST';
                loginForm.getForm().submit();
			      },
			      scope: this,
			      text: 'Login'
			},{
                text: 'Sign up for an account',
                scope: this,
                handler: function() {
                    window.open('../../sign_up_main.jsp');
                }
            }]
        });
    }
    win.show();
    });
    
    var smartCity = new Ext.Panel({
        baseCls: 'x-plain',
        id: 'login-logo',
        region: 'center'
      });

      this.username = new Ext.form.TextField({
          name: 'username',
          allowBlank: false,
          fieldLabel: 'Username',
          vtype:'alphanum',
          //minLength: 2,
          blankText: 'Only alpha and numeric value allowed with 2 min length',
          anchor: '90%'
      });

      this.password = new Ext.form.TextField({
          fieldLabel: 'Password',
          allowBlank: false,
          inputType: 'password',
          name: 'password',
          //minLength: 2,
          anchor: '90%'
      });

      var loginForm = new Ext.form.FormPanel({
          id: 'login-form',
          baseCls: 'x-plain',
          standardSubmit: true,
          width: 450,
          frame: false,
          height: 70,
          region: 'south',
          defaultType: 'textfield',
          items: [username, password]
      });

  });