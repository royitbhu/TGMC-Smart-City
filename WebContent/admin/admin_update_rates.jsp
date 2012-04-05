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

    Ext.onReady(function(){

        Ext.QuickTips.init();

        // turn on validation errors beside the field globally
        Ext.form.Field.prototype.msgTarget = 'side';
        var store = new Ext.data.JsonStore({
            fields: [
               {name: 'category'},
               {name: 'commodity'},
               {name: 'price'},
                                    
               ]
        });
        var fs = new Ext.FormPanel({
            frame: true,
            title:'Market Rates Updates',
            labelAlign: 'left',
            labelWidth: 85,
            width:340,
            waitMsgTarget: true,

			
            items: [
                new Ext.form.FieldSet({
                    title: 'Commodity Information',
                    autoHeight: true,
                    defaultType: 'textfield',
                    items: [ new Ext.form.ComboBox({
                        fieldLabel: 'Category',
                        name:'category',
                        id:'category',
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
                    }), {
                            fieldLabel: 'Commodity',
                            name: 'commodity',
                            id:'commodity',
                            allowBlank:false,
                            width:190,
                            readOnly:false
                        },
                        {
                            fieldLabel: 'Price',
                            name: 'price',
                            id:'price',
                            width:190,
                            height:30,
                            readOnly:false
                        }
                    ]
                }),
                            ]
        });

        var submit = fs.addButton({
            text: 'Submit',
            disabled:false,
            handler: function(){
			if(fs.getForm().isValid()){								
				fs.getForm().submit({
					method: 'GET',
					url: '../updateRates',
					waitTitle:'Connecting....',									
					waitMsg:'Saving Data...',
	            		success : function(){
								Ext.Msg.alert('Status','Rates Update Successful',function(btn,text){
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
						Ext.Msg.alert('Rates Update Failed','Please fill in the essential details') ;
				}
            }
        });
        // simple button add
        fs.addButton('Load', function(){
           
/*        	var resp = Ext.decode(response.responseText);
         	//store.removeAll();
         	store.loadData(resp.reply);
*/
var thecategory = Ext.getCmp('category');
var thecommodity = Ext.getCmp('commodity');
        Ext.Ajax.request({
        	  method: 'GET',
        	  params:{category:thecategory.value,commodity:thecommodity.value},
				url:'../loadRates',
				waitMsg: 'Loading...',

				success:function(response,request)
				{
            	var resp = Ext.decode(response.responseText);
	             	//store.removeAll();
	             	store.loadData(resp.reply);
	
	             	Ext.getCmp('category').setValue(store.getAt(0).data.category);
	             	Ext.getCmp('commodity').setValue(store.getAt(0).data.commodity);
	             	Ext.getCmp('price').setValue(store.getAt(0).data.price);
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
