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
<link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css"/>
   <link rel="stylesheet" type="text/css" href="../CSS/fileuploadfield.css"/>

    <!-- GC -->
    <!-- LIBS -->
    <script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="../ext-3.1.0/ext-all-debug.js"> </script>
    <!-- ENDLIBS -->

    <script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>
	<script type="text/javascript" src="../JS/FileUploadField.js"></script>


    <script>
          
    Ext.onReady(function(){
        Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'center';
        var bd = Ext.getBody();
        bd.createChild({tag: 'h2', html: 'Post Ads Here'});
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
                                    data : Ext.data.category // from states.js
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
									Ext.Msg.alert('Status','Post Ads Succesfull',function(btn,text){
										//if(btn=='ok'){
												var redirect='uploadImage.jsp';
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
							Ext.Msg.alert('Post Ads failed ','Please try again') ;
					}
                }
            	},{
            	text: 'Reset',
            	handler: function(){
            	post_ads.getForm().reset();
            	}
            	}]
        });

        post_ads.render("display_form");

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
<div id="content">
 

<h1 align="center">Post Your Ads in Single Step</h1><br><br>

            <div id="display_form"></div>

        <br/>

 <link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="../CSS/extjs.css" />
		<script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>		
        <script type="text/javascript" src="./JS/site_admin.js"></script>   
		<script type="text/javascript" src="./JS/category.js"></script> 
    
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
