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
        <script type="text/javascript" src="../JS/site.js"></script>   
		<script type="text/javascript" src="./JS/category.js"></script> 


    <script>
          
    Ext.onReady(function(){

        Ext.QuickTips.init();

        // turn on validation errors beside the field globally
        Ext.form.Field.prototype.msgTarget = 'side';   
      

        var fs = new Ext.FormPanel({
            frame: true,
            title:'Search Advertisements',
            labelAlign: 'right',
            labelWidth: 85,
            width:440,
            waitMsgTarget: true,  

            items: [
                    new Ext.form.FieldSet({
                        title: 'Select a Category',
                        autoHeight: true,
                        defaultType: 'textfield',
                     items: [                            new Ext.form.ComboBox
                                         				(
                                             					{                	
                                                 					store: ['Buy','Sell'], 
                                                 					fieldLabel: 'I want to Buy/Sell *',
                                                 					name: 'buy_sell',
                                                 					typeAhead: true,                    
                                                 					triggerAction: 'all',
                                                 					emptyText:'Enter your choice',
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
                                                             emptyText:'Select a category',
                                                             selectOnFocus:true,
                                                             width:190
                                               	}),
								{
                                    xtype:'textfield',
                                    fieldLabel: 'keywords',
                                    name: 'keywords',
                                    allowBlank:true,
                                    value:'null',
                                    anchor:'95%'
                                }
                         ]
                    })
                ]
                

            });
        
            var submit = fs.addButton({
                text: 'Search',
                disabled:false,
                handler: function(){
                    fs.form.submit({
                    	method:'GET',
                        url:'../adView', 
                        
                        waitMsg:'Loading Data...',

                        success: function (request, response) {
                        	var resp = Ext.decode(response.response.responseText);                  

    						var innerContent="";
    						innerContent+="<br><br>";
    						var i=0;
    						for (i=0; i<resp.size; i++)
    						{
        						
								innerContent += "<table border='0' cellpadding='1' cellspacing='0' width='100%' >";
					        	innerContent += "<tr><td align='left' bgcolor='#BEBEBE'><b>Title :&nbsp&nbsp&nbsp</b>";
					        	innerContent += resp.reply[i].ad_title ;
					        	innerContent += "</td></tr>";

					        	innerContent += "<tr><td align='center'>";
					        	innerContent += resp.reply[i].short_desc ;
					        	innerContent += "</td></tr>";

					        	innerContent += "<tr><td align='left'><b>Posted by :&nbsp&nbsp&nbsp</b>";
					        	innerContent += resp.reply[i].posted_by ;
					        	innerContent += "</td></tr>";

					        	innerContent += "<tr><td align='right'><b>Post date :&nbsp&nbsp&nbsp</b>";
					        	innerContent += resp.reply[i].posted_on ;
					        	innerContent += "</td></tr>";
					        						        	
					        	
					        	innerContent += "<tr><td align='left'><b>Details :&nbsp&nbsp&nbsp</b>";
					        	innerContent += resp.reply[i].details ;
					        	innerContent += "<br></td></tr>";
					        	
					        	innerContent += "</table>";
					        	innerContent += "<HR WIDTH='80%' COLOR='#6699FF'  SIZE='3'><br>";
        					}
        					document.getElementById("ad_content").innerHTML = innerContent ;
    						Ext.MessageBox.alert('Message', 'Load successful');
                            
                        },
                        failure:function(form, action) {
                            Ext.MessageBox.alert('Message', 'Loading failed');
                        }
                        
                    });
                 }
            });


        fs.render('search_ads');


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

<div align="center" id="search_ads"></div>
<div align="center" id="ad_content"></div>

        <br/>

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