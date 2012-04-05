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
        var post_ads = new Ext.FormPanel({
            labelAlign: 'top',
            frame:true,
            title: 'Enter Tax Details here...',
            bodyStyle:'padding:5px 5px 0',
            width: 600,
            autoHeight: true,
            items: [{
                layout:'column',
                items:[{
                    columnWidth:.5,
                    layout: 'form',
                    items: [{
                        xtype:'textfield',
                        fieldLabel: 'Tax Name',
                        name: 'tax_name',
                        anchor:'95%'
                    }, {
                        xtype:'textfield',
                        fieldLabel: 'To be Paid By :',
                        name: 'paid_by',
                        anchor:'95%'
                    } ]
                }]
            },{
                xtype:'htmleditor',
                id:'bio',
                fieldLabel:'Details',
                height:200,
                name: 'details',
                anchor:'98%'
            }],

            buttons: [{
            	text: 'Submit',
            	scope:this,
            	handler: function(){
				if(post_ads.getForm().isValid()){								
					post_ads.getForm().submit({
						method: 'POST',
						url: '../postTaxes',
						waitTitle:'Connecting....',									
						waitMsg:'Saving Data...',
		            		success : function(){
									Ext.Msg.alert('Status','Insertion Successful',function(btn,text){
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
 

<h1 align="center">Add New Tax Details</h1><br><br>

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
