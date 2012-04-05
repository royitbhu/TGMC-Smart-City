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
 <style type=text/css>
        .upload-icon {
            background: url('../shared/icons/fam/image_add.png') no-repeat 0 0 !important;
        }
        #fi-button-msg {
            border: 2px solid #ccc;
            padding: 5px 10px;
            background: #eee;
            margin: 5px;
            float: left;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="../CSS/extjs.css" />
		<script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>		
        <script type="text/javascript" src="../JS/site.js"></script>   
		<script type="text/javascript" src="./JS/category.js"></script> 

	<script type="text/javascript" src="../JS/FileUploadField.js"></script>


    <script>
          
    Ext.onReady(function(){
        Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'center';
        var bd = Ext.getBody();
        var post_ads = new Ext.FormPanel({
            labelAlign: 'top',
            frame:true,
            title: 'Post Your advertisements here...',
            bodyStyle:'padding:5px 5px 0',
            width: 600,
            autoHeight: true,
            items: [{
                layout:'column',
                items:[{
                    columnWidth:.5,
                    layout: 'form',
                    items: [
                            new Ext.form.ComboBox
                				(
                					{                	
                    					store: ['Buy','Sell'], 
                    					fieldLabel: 'I want to Buy/Sell *',
                    					name: 'buy_sell',
                    					typeAhead: true,                    
                    					triggerAction: 'all',
                    					emptyText:'Enter your choice...',
                    					selectOnFocus:true,
                    					allowBlank:false                   
                					}
                				),

                                new Ext.form.ComboBox({
                                fieldLabel: 'Category',
                                name:'category',
                                store: new Ext.data.ArrayStore({
                                    fields: ['abbr', 'category'],
                                    data : Ext.data.category
                                }),
                                valueField:'abbr',
                                displayField:'category',
                                typeAhead: true,
                                mode: 'local',
                                triggerAction: 'all',
                                emptyText:'Select a category...',
                                selectOnFocus:true,
                                width:190
                            	}),
                	{
                        xtype:'textfield',
                        fieldLabel: 'Ad title',
                        name: 'ad_title',
                        anchor:'95%'
                    }, {
                        xtype:'textfield',
                        fieldLabel: 'Short Description',
                        name: 'short_desc',
                        anchor:'95%'
                    }, {
                        xtype:'textfield',
                        fieldLabel: 'Keywords (For Search Results)',
                        name: 'keywords',
                        anchor:'95%'
                    }]
                }]
            },{
                xtype:'htmleditor',
                id:'bio',
                fieldLabel:'Ad Description',
                height:200,
                name: 'desc',
                anchor:'98%'
            }],

            buttons: [{
            	text: 'Submit',
            	scope:this,
            	handler: function(){
				if(post_ads.getForm().isValid()){								
					post_ads.getForm().submit({
						method: 'POST',
						url: '../postad',
						waitTitle:'Connecting....',									
						waitMsg:'Saving Data...',
		            		success : function(){
									Ext.Msg.alert('Status','Registration Successful',function(btn,text){
										//if(btn=='ok'){
												var redirect='./admin_home.jsp';
												window.location=redirect;
											//}
										});
			            		},

			            	failure:function(form,action){
										if (action.failureType == 'server'){
												obj = Ext.util.JSON.decode(action.response.responseText); 
				                                Ext.Msg.alert('Login Failed!', obj.errors.reason); 
											}else{
												Ext.Msg.alert('Warning!', 'Authentication server is unreachable : ' + action.response.responseText);		
											}
										post_ads.getForm().reset(); 
					            	}
						})
					}else{
							Ext.Msg.alert('Failed to post ad','Please fill in the essential details') ;
					}
                }
            	},{
            	text: 'Reset',
            	handler: function(){
            	post_ads.getForm().reset();
            	}
            	}]
        });
        
        /*post_ads.on({
        actioncomplete: function(form, action){
                            // Only enable the submit button if the load worked
                      
            if(action.type == 'submit'){
                        // If the responseText is a null string, Ext doesnt raise an error so trap it here 
                        // as an error because it should be some json.
                if(action.response.responseText == '') {
                    Ext.MessageBox.alert('post_ads.actioncomplete error', 'Form submit returned an empty string instead of json');
                } else Ext.MessageBox.alert('post_ads.actioncomplete', 'All OK.'); // Optional. Just for testing
            }
        },
                        // The following code could be rationalised but I did it this way to make it easier
                        // to follow and for you to test it yourself.
                        // NOTE: the line var result = Ext.decode(action.response.responseText); must be
                        // called AFTER you have made sure there wasnt a failureType == "connect" or you 
                        // will probably get a JS error in the Ext library.
                            
        actionfailed: function(form,action){
            //alert('actionfailed');            
            if(action.type == 'load') { // Handle the LOAD errors
                if (action.failureType == "connect") { 
                    Ext.MessageBox.alert('post_ads.actionfailed error', 'Form load failed. Could not connect to server.');
                } else {
                    if (action.response.responseText != '') {
                        var result = Ext.decode(action.response.responseText);
                        if(result && result.msg) {            
                            Ext.MessageBox.alert('post_ads.actionfailed error', 'Form load failed with error: ' + action.result.msg);
                        } else {
                            Ext.MessageBox.alert('post_ads.actionfailed error', 'Form load failed with unknown error (possibly missing the "success" field in the json). Action type='+action.type+', failure type='+action.failureType);
                          }
                    } else {
                        Ext.MessageBox.alert('post_ads.actionfailed error', 'Form load returned an empty string instead of json');
                      }
                  }
            } 

            if(action.type == 'submit') { // Handle the SUBMIT errors
				
                if (action.failureType == "connect") { 
                    Ext.MessageBox.alert('post_ads.actionfailed error', 'Form submit failed. Could not connect to server.');
                } else 
                    if (action.failureType == "server") { 
                        // These arent "errors" as such, they are validation issues trapped by the server script and passed back for the user to correct
                    } else {    
                        var result = Ext.decode(action.response.responseText); 
                        if(result && result.msg) {            
                            Ext.MessageBox.alert('post_ads.actionfailed error', 'Form submit failed with error: ' + action.result.msg);
                        } else {
                            Ext.MessageBox.alert('actionfailed Error', 'Form submit returned unknown error. Action type='+action.type+', failure type='+action.failureType);
                          }
                      }
            }   
            
        } // end actionfailed listener
    }); // end post_ads.on*/
    

        post_ads.render("display_form");

    });
    </script>
</head>

<body> <%@ include file='checkSession.jsp' %>

<div id="container">

<script  type="text/javascript" src="../JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_main.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_main.js "></script>
<script  type="text/javascript" src="./JS/rightside_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_main.js "></script>

<div id="content">
 

<h1 align="center">Post Your Ads in Single Step</h1><br><br>

            <div id="display_form"></div>

   <br/> 

<div id="ft"> 
<div id="footer"><a>&copy; 2009 Knight Webers</a></div>   
 
   
</div>

 
</div>

<div class="clearingdiv">&nbsp;</div>
</div>
</div>

</body>
</html>
