<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Varanasi | Update News </title>
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



    <script>
          
    Ext.onReady(function(){
        Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'center';
        var bd = Ext.getBody();
        var update_city_news = new Ext.FormPanel({
            labelAlign: 'top',
            frame:true,
            title: 'Update city news...',
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
                        fieldLabel: 'News Heading',
                        name: 'title',
                        height:50,
                        anchor:'95%'
                    },{
                        xtype:'textfield',
                        fieldLabel: 'Related link',
                        name: 'news_url',                        
                        anchor:'95%'
                    }]
                }]
            },{
                xtype:'htmleditor',
                id:'bio',
                fieldLabel:'News details',
                height:200,
                name: 'details',
                anchor:'98%'
            }],

            buttons: [{
            	text: 'Submit',
            	scope:this,
            	handler: function(){
				if(update_city_news.getForm().isValid()){								
					update_city_news.getForm().submit({
						method: 'POST',
						url: '../postNews',
						//waitTitle:'Connecting....',									
						//waitMsg:'Saving Data...',
		            		success : function(){
									Ext.Msg.alert('Status','news update Successful',function(btn,text){
										//if(btn=='ok'){
												var redirect='admin_home.jsp ';
												window.location=redirect;
											//}
										});
			            		}

			            	/*failure:function(form,action){
										if (action.failureType == 'server'){
												obj = Ext.util.JSON.decode(action.response.responseText); 
				                                Ext.Msg.alert('Login Failed!', obj.errors.reason); 
											}else{
												Ext.Msg.alert('Warning!', 'Authentication server is unreachable : ' + action.response.responseText);		
											}
										update_city_news.getForm().reset(); 
					            	}*/
						})
					}else{
							Ext.Msg.alert('news update Failed','Please fill in the essential details correctly') ;
					}
                }
            	},{
            	text: 'Reset',
            	handler: function(){
            	update_city_news.getForm().reset();
            	}
            	}]
        });

        update_city_news.render("update_news");

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
<h1>....where the journey begins.....</h1>



<div align="center" id="update_news"></div>
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
