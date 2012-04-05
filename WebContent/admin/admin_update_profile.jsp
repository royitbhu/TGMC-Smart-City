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
<link rel="stylesheet" href="../CSS/home.css" type="text/css" 
media="screen" />
<style type="text/css">
#container {
	background: #f0f0f0 url(../images/bodybg-black.jpg) repeat-x;
}

#mainmenu a:hover {
	background: #f0f0f0 url(../images/menuhover-black.jpg) top left repeat-x
		;
}

#mainmenu a.current {
	background: #f0f0f0 url(../images/menuhover-black.jpg) top left repeat-x
		;
}
</style>
	 <link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="../CSS/extjs.css" />
		<script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>		
        <script type="text/javascript" src="./JS/site_admin.js"></script>   
		<script type="text/javascript" src="./JS/category.js"></script> 

		<script type="text/javascript">
		function IncludeJavaScript(jsFile){
		  document.write('<script type="text/javascript" src="' + jsFile + '"></scr' + 'ipt>'); 
		}
		</script>

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

        // turn on validation errors beside the field globally
        Ext.form.Field.prototype.msgTarget = 'side';
        var store = new Ext.data.JsonStore({
            fields: [
               {name: 'fname'},
               {name: 'lname'},
               {name: 'gender'},
               {name: 'dob'},
               {name: 'username'},
               {name: 'email'},
               {name: 'address'},
               {name: 'city'},
               {name: 'country'},
               {name: 'pincode'},                           
               ]
        });
        var fs = new Ext.FormPanel({
            frame: true,
            title:'My Profile',
            labelAlign: 'left',
            labelWidth: 85,
            width:340,
            waitMsgTarget: true,

			
            items: [
                new Ext.form.FieldSet({
                    title: 'Personal Information',
                    autoHeight: true,
                    defaultType: 'textfield',
                    items: [{
                            fieldLabel: 'First Name',
                            name: 'fname',
                            id:'fname',
                            width:190,
                            readOnly:true
                        }, {
                            fieldLabel: 'Last Name',
                            name: 'lname',
                            id:'lname',
                            width:190,
                            readOnly:false
                        }, {
                        	fieldLabel: 'Gender',
                            name: 'gender',
                            width:190,
                            id:'gender',
                            readOnly:true
                        },

                        new Ext.form.DateField({
                            fieldLabel: 'Date of Birth',
                            name: 'dob',
                            width:190,
                            id:'dob',
                            readOnly:true,
                            allowBlank:true
                        })
                    ]
                }),
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
			                    fieldLabel: 'Email Id',
			                    name: 'email',
			                    vtype:'email',
			                    id:'email',
			                    readOnly:false,
			                    allowBlank:true
 						},     
    						{
			                    fieldLabel: 'Username',
			                    name: 'username',
			                    id:'username',
			                    readOnly:true,
			                    allowBlank:true
			                }			             	
							]
			},
            {
              	xtype: 'fieldset',
              	title: 'Change Password',
              	collapsible: true,
              	 collapsed: true,
              	autoHeight: true,
              	defaults: {width:210},
              	defaultType: 'textfield',
					items : 
  					[
						{
							
							inputType: 'password',
						    fieldLabel: 'Current Password *',
						    name: 'old_pass',
						    id: 'old_pass',
						    allowBlank:true
						       
						 },
		                {
		                	
		                	inputType: 'password',
		                    fieldLabel: 'New Password *',
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
							
		                 }
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
		                      id:'address'						                                        
		                 },
		                 {
		                      fieldLabel: 'City',
		                      name: 'city',
		                      id:'city',
		                      allowBlank:true                  
		                 },
		                  {
		                      fieldLabel: 'Country',
		                      name: 'country',
		                      id:'country',
			                      allowBlank:true                   
		                  },
		                  						                     
		                  {
		                      fieldLabel: 'Pincode',
		                      name: 'pincode',
		                      id:'pincode',
		                      allowBlank:true                  
		                  }       
				]
	}
            ]
        });

        var submit = fs.addButton({
            text: 'Submit',
            disabled:true,
            handler: function(){
			if(fs.getForm().isValid()){								
				fs.getForm().submit({
					method: 'GET',
					url: '../updateProfile',
					waitTitle:'Connecting....',									
					waitMsg:'Saving Data...',
	            		success : function(){
								Ext.Msg.alert('Status','Profile Update Successful',function(btn,text){
									//if(btn=='ok'){
											var redirect='admin_home.jsp ';
											window.location=redirect;
										//}
									});
		            		}
/*
		            	failure:function(form,action){
									if (action.failureType == 'server'){
											obj = Ext.util.JSON.decode(action.response.responseText); 
			                                Ext.Msg.alert('Login Failed!', obj.errors.reason); 
										}else{
											Ext.Msg.alert('Warning!', 'Authentication server is unreachable : ' + action.response.responseText);		
										}
									post_ads.getForm().reset(); 
				            	}*/
					})
				}else{
						Ext.Msg.alert('Registration Failed','Please fill in the essential details') ;
				}
            }
        });
        // simple button add
        fs.addButton('Load', function(){
            fs.getForm().load({
            	//method: 'GET',
                //url:'loadProfile',
                //waitMsg:'Loading'
                });
/*        	var resp = Ext.decode(response.responseText);
         	//store.removeAll();
         	store.loadData(resp.reply);
*/
          Ext.Ajax.request({
        	  method: 'GET',
				url:'../loadProfile',
				waitMsg: 'Loading...',

				success:function(response,request)
				{
            	var resp = Ext.decode(response.responseText);
	             	//store.removeAll();
	             	store.loadData(resp.reply);
	
	             	Ext.getCmp('fname').setValue(store.getAt(0).data.fname);
	             	Ext.getCmp('lname').setValue(store.getAt(0).data.lname);
	             	Ext.getCmp('gender').setValue(store.getAt(0).data.gender);
	             	Ext.getCmp('dob').setValue(store.getAt(0).data.dob);
	             	Ext.getCmp('username').setValue(store.getAt(0).data.username);
	             	Ext.getCmp('email').setValue(store.getAt(0).data.email);
	             	Ext.getCmp('address').setValue(store.getAt(0).data.address);
	             	Ext.getCmp('city').setValue(store.getAt(0).data.city);
	             	Ext.getCmp('country').setValue(store.getAt(0).data.country);
	             	Ext.getCmp('pincode').setValue(store.getAt(0).data.pincode);
	                submit.enable();
	             	
					},
					
				failure:function(){
						Ext.Msg.alert('Message','Load failed');
						}

					
                });
                 
           
        });

        // explicit add

        fs.render('update_profile');

        fs.on({
            actioncomplete: function(response,request){
                if(action.type == 'load'){
                    submit.enable();
                }
            }
        });

    });


    </script>
</head>
<body> <%@ include file='checkSession.jsp' %>

<div id="container">


<script  type="text/javascript" src="../JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_admin.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_admin.js "></script>
<script  type="text/javascript" src="./JS/rightside_admin.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_admin.js "></script>


<div id="content" style="min-width:600px;">
<h1>....where the journey begins.....</h1>


<div align="center" id="update_profile"></div>
<div align="center" id="market_rates"></div>

        <br/>

        <link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="./CSS/extjs.css" />
        <script type="text/javascript" src="./ext-3.1.0/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="./ext-3.1.0/ext-all.js"></script>

    <div style="clear:both"></div>


<div id="ft"> 
<div id="footer"><a>&copy; 2009 Knight Webers</a></div>   
 

</div>


</div>

<div class="clearingdiv">&nbsp;</div>
</div>
</div>

</body>
</html>
