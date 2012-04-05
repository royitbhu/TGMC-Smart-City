<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Varanasi Smart City Home</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<meta name="description"
	content="Varanasi is the most ancient city in India and is deeply influed by culture and religion." />
<meta name="keywords" content="Varanasi, Smart City" />
<meta name="author" content="Shivasheesh" />
<link rel="stylesheet" href="CSS/home.css" type="text/css"
	media="screen" />
<style type="text/css">
#container {
	background: #f0f0f0 url(images/bodybg-black.jpg) repeat-x;
}

#mainmenu a:hover {
	background: #f0f0f0 url(images/menuhover-black.jpg) top left repeat-x
		;
}

#mainmenu a.current {
	background: #f0f0f0 url(images/menuhover-black.jpg) top left repeat-x
		;
}
</style>
        <link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="./CSS/extjs.css" />

        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Loading Core API...';</script>
        <script type="text/javascript" src="./ext-3.1.0/adapter/ext/ext-base.js"></script>
        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Loading UI Components...';</script>
        <script type="text/javascript" src="./ext-3.1.0/ext-all.js"></script>
        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Initializing...';</script>
        <script type="text/javascript" src="./JS/App.js"></script>
        <script type="text/javascript" src="./JS/site.js"></script>
        <script type="text/javascript" src="./JS/visit_varanasi_main.js"></script>
        <script type="text/javascript" src="./JS/init.js"></script>
        
        <script type="text/javascript" src="./JS/login1.js"></script>

    <script>
    Ext.apply(Ext.form.VTypes, {
        
        password : function(val, field) {
            if (field.initialPassField) {
                var pwd = Ext.getCmp(field.initialPassField);
                return (val == pwd.getValue());
            }
            return true;
        },

        passwordText : 'Passwords do not match'
    });
      
    Ext.onReady(function(){
        Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'center';
        var bd = Ext.getBody();
        var sign_up_form = new Ext.FormPanel
        (
                {
           			 labelWidth: 200,
           			 frame:true,
          			 title: 'Sign up as Tourist',
            		 bodyStyle:'padding:5px 5px 50',
           			 width: '100%',
           			 autoHeight : true,
           			 autoScroll : true,
           			 draggable:true,
           			 minWidth : '60%',
            		 items: 
                	 [
                 	 	{
               			 xtype: 'fieldset',
               			 collapsible: true,
               			 title: 'Personal Details',
                		 autoHeight: true ,
               			 defaults: {width:210},
               			 defaultType: 'textfield',
               			 collapsed: false,
               			 items: 
                   			 [
									
               					 {	          	
               					     fieldLabel: 'First Name *',
                  				     name: 'fname',
                  					 allowBlank:true                   
              					 },
                				 {
                   					 fieldLabel: 'Last Name',                   					
                    			     name: 'lname',
                    			      emptyText:'Enter',
                       			   	 value:'null'
                       			     
               					 },                
                				new Ext.form.ComboBox
                				(
                					{                	
                    					store: ['male','female'], 
                    					fieldLabel: 'Gender *',
                    					name: 'gender',
                    					typeAhead: true,                    
                    					triggerAction: 'all',
                    					emptyText:'Select your gender...',
                    					selectOnFocus:true,
                    					allowBlank:true                   
                					}
                				),
               				   	new Ext.form.DateField
               				   	(
                       				   	{
                  						fieldLabel: 'Date of Birth *',
			                     		name: 'dob',
			                     		width:300,
			                     		allowBlank:true
               							 }
              					)
                			]
        			 },
        			 {
				              	xtype: 'fieldset',
				              	title: 'Login Details',
				              	collapsible: true,
				              	autoHeight: true,
				              	defaults: {width:210},
				              	defaultType: 'textfield',
              					items : 
                  					[                       	
               							{
						                    fieldLabel: 'Email *',
						                    name: 'email',
						                    vtype:'email',
						                    allowBlank:true
                						}, 
                						{
						                    fieldLabel: 'Desired Username *',
						                    name: 'username',
						                    allowBlank:true
						                },
						                {
						                	
						                	inputType: 'password',
						                    fieldLabel: 'Password *',
						                    name: 'pass',
						                    id: 'pass',
						                    allowBlank:true    
						                 },
						                 {                	 
						                	 inputType: 'password',
						                     fieldLabel: 'Confirm Password *',
						                     name: 'pass-cfrm',
						                     vtype: 'password',
						                     initialPassField: 'pass', // id of the initial password field
						                     allowBlank:true
						                 },
						             	
           							]
           			},
           			{
				        	    xtype: 'fieldset',
				             	title: 'Contact Details',
				             	collapsible: true,
				             	autoHeight: true,
				             	defaults: {width:210},
				             	defaultType: 'textfield',	 
                  				items: 
                      				[
						                 {
						                      fieldLabel: 'Address',
						                      name: 'address',
			                       			     value:'null'						                                        
						                 },
						                 {
						                      fieldLabel: 'City',
						                      name: 'city',
			                       			     value:'null',
						                      allowBlank:true                  
						                 },
						                  {
						                      fieldLabel: 'Country *',
						                      name: 'country',
						                      allowBlank:true                   
						                  },
						                  						                     
						                  {
						                      fieldLabel: 'Pincode',
						                      name: 'pincode',
						                      
			                       			     value:'null',
						                      allowBlank:true                  
						                  }       
            					]
            		},
            		{
            			 
            			bodyStyle: 'padding-right:5px;',
            			
                        items:         {
                            xtype:'fieldset',
                            checkboxToggle:true,
                            title: 'Subscribe for SMS alerts',
                            
                            collapsed: false,
                            autoHeight: true,
                            defaultType: 'checkbox',  // each item will be a checkbox
                            items: [{
                                fieldLabel: 'SMS alerts for : ',
                                boxLabel: 'Latest City News',
                                name: 'city_news',
                                inputValue: 'ughjj'
                            },{
                                fieldLabel: '',
                                labelSeparator: '',
                                boxLabel: 'Daily Market Rates',
                                name: 'market_rates',
                                inputValue: 'himan'
                            },
                            {
			                      fieldLabel: 'Mobile Number *',
			                      xtype: 'textfield',
			                      width: 210 ,
			                      name: 'mob_no',
			                      allowBlank:true,
			                      value: '123'                   
			                  },
                            {
                            xtype: 'fieldset',
			             	title: 'Payment Details',
			             	labelWidth: 190,
			             	collapsible: true,
			             	autoHeight: true,
			             	defaults: {width:210},
			             	defaultType: 'textfield',
			             	items: [
										{
										    fieldLabel: 'Bank Name *',
										    name: 'bank_name',
										    value:'null',
										    allowBlank:true                   
										},
										{
										    fieldLabel: 'Account No. *',
										    name: 'account_no',
										    value:'null',
										    allowBlank:true                   
										},
										{
										    fieldLabel: 'Bank Username. *',
										    name: 'bank_username',
										    value:'null'	,
										    allowBlank:true                   
										}
					             ]	}			             	
                            ]
                        }
          
						             	
                	},
                	
                    
                	       

		        ],  buttons: [{
	            	text: 'Submit',
	            	scope:this,
	            	handler: function(){
					if(sign_up_form.getForm().isValid()){								
						sign_up_form.getForm().submit({
							method: 'GET',
							url: 'SignUpTourist',
							waitTitle:'Connecting....',									
							waitMsg:'Saving Data...',
		                    success: function (request, response) {
	                    	var resp = Ext.decode(response.response.responseText);
	                    	var i =0 ;
	                    	//document.write(resp.success);
												
							window.location="./tourist/home.jsp";
	                        
	                    },
	                    failure:function(form, action) {
	                        Ext.MessageBox.alert('Message', 'Save failed');
	                    }
							})
						}else{
								Ext.Msg.alert('Update Failed','Please fill in the essential details correctly') ;
						}
	                }
	            	},{
		                text: 'Reset',
		                //onClick : function(e){window.location="sign_up_general.jsp"}
		                handler: function(){
		                	sign_up_form.getForm().reset();
			                }
		            }
            		]
        	}
       );

        sign_up_form.render('display_form');        
        /*
         * ================  Form 2  =======================
         */
       });
    </script>
</head>

<body>

<div id="container">


<script  type="text/javascript" src="./JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_main.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_main.js "></script>
<script  type="text/javascript" src="./JS/rightside_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_main.js "></script>


<div id="content">
<h1 align="center">Tourist Sign Up Form</h1><br><br>
<div id="display_form"></div>
<div id="ft"> 
<div id="footer"><a>&copy; 2009 Knight Webers</a></div>
</div>
</div>
<div class="clearingdiv">&nbsp;</div>
</div>
</div>
</body>
</html>