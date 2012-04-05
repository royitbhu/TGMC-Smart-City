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
        bd.createChild({tag: 'h2', html: 'Sign up form'});
        var sign_up_form = new Ext.FormPanel
        (
                {
                	 labelWidth: 200,
         			 frame:true,
        			 title: 'Sign up as General User',
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
                  				     emptyText:'Your first name',
                  					 allowBlank:false                   
              					 },
                				 {
                   					 fieldLabel: 'Last Name',                   					
                    			     name: 'lname',
                    					 allowBlank:true,
                    					 emptyText:'Your last name',
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
                    					allowBlank:false
                    					                
                					}
                				),
               				   	new Ext.form.DateField
               				   	(
                       				   	{
                  						fieldLabel: 'Date of Birth *',
			                     		name: 'dob',
			                     		width:210,
			                     		emptyText:'01/01/1947',
			                     		allowBlank:false
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
						                    emptyText:'knight.webers@gmail.com	',
						                    allowBlank:false
                						}, 
                						{
						                    fieldLabel: 'Desired Username *',
						                    name: 'username',
						                    emptyText:'username',
						                    allowBlank:false
						                },
						                {
						                	
						                	inputType: 'password',
						                    fieldLabel: 'Password *',
						                    name: 'pass',
						                    id: 'pass',
						                    emptyText:'Desired password',
						                    allowBlank:false    
						                 },
						                 {                	 
						                	 inputType: 'password',
						                     fieldLabel: 'Confirm Password *',
						                     name: 'pass-cfrm',
						                     vtype: 'password',
						                     initialPassField: 'pass', // id of the initial password field
						                     allowBlank:false
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
						                      name: 'address'	,					                                        
							                      allowBlank:true,
							                      emptyText:'Contact address',
							                      value:'null'
						                 },
						                 {
						                      fieldLabel: 'City',
						                      name: 'city',		                                        
						                      allowBlank:true,
						                      emptyText:'City',
						                      value:'null'                  
						                 },
						                  {
						                      fieldLabel: 'Country *',
						                      name: 'country',
						                      allowBlank:false                   
						                  },
						                  						                     
						                  {
						                      fieldLabel: 'Pincode',
						                      name: 'pincode',
						                      allowBlank:true,
						                      value:'null'                  
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
                            defaultType: 'checkbox',
                            items: [{
                                fieldLabel: 'SMS alerts for : ',
                                boxLabel: 'Latest City News',                               
                                name: 'city_news',
                                allowBlank:true,
                                value:'null'
                            },{
                                fieldLabel: '',
                                labelSeparator: '',
                                boxLabel: 'Daily Market Rates',
                                name: 'market_rates',
                                allowBlank:true,
                                value:'null'
                            },
                            {
			                      fieldLabel: 'Mobile Number *',
			                      width: 210,
			                      xtype: 'textfield',
			                      name: 'mob_no',
			                      allowBlank:true,
			                      value:'null'                   
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
										    allowBlank:false,
										    value:'null'                   
										},
										{
										    fieldLabel: 'Account No. *',
										    name: 'account_no',
										    allowBlank:false,
										    value:'null'                   
										},
										{
										    fieldLabel: 'Bank Username. *',
										    name: 'bank_username',
										    allowBlank:false,
										    value:'null'                   
										}
					             ]	}			             	
                            ]
                        }
          
						             	
                	},
                	
                    
                	       

		        ],   buttons: [{
	            	text: 'Submit',
	            	scope:this,
	            	handler: function(){
					if(sign_up_form.getForm().isValid()){								
						sign_up_form.getForm().submit({
							method: 'GET',
							url: 'SignUpGeneral',
							waitTitle:'Connecting....',									
							waitMsg:'Saving Data...',
		                    success: function (request, response) {
	                    	var resp = Ext.decode(response.response.responseText);
	                    	var i =0 ;
	                    								
							Ext.MessageBox.alert('Message', 'Registration successful.');
							window.location="./general/home.jsp";	                        
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
		                handler: function(){
	                	sign_up_form.getForm().reset();
		                }
		            }
		            
            		]
        	}
       );

        sign_up_form.render('display_form');
              
        
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
<h1 align="center">General User Sign Up Form</h1><br><br>
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