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
    <link rel="stylesheet" type="text/css" href="grid-examples.css" />
    <link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="../CSS/extjs.css" />
		<script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>		
        <script type="text/javascript" src="../JS/site.js"></script>   
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
               {name: 'price'}                           
               ]
        });

        // create the Grid
        var grid = new Ext.grid.GridPanel({
            store: store,
            columns: [
                {id:'category',header: 'category', width: 160, sortable: true, dataIndex: 'category'},
                {header: 'Commodity', width: 200, sortable: true,  dataIndex: 'commodity'},
                {header: 'Price', width: 200, sortable: true,  dataIndex: 'price'}
            ],
            stripeRows: true,
            autoExpandColumn: 'category',
            height: 350,
            minColumnWidth: 500,
            width: '80%',
            title: 'Market Rates',
            // config options for stateful behavior
            stateful: true,
            stateId: 'grid'
        });
        var fs = new Ext.FormPanel({
            frame: true,
            title:'Update Market Rates',
            labelAlign: 'right',
            labelWidth: 85,
            width:440,
            waitMsgTarget: true,  

            items: [
                new Ext.form.FieldSet({
                    title: 'Commodity Details',
                    autoHeight: true,
                    defaultType: 'textfield',
                    items: [
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
                        })
                     ]
                })
            ]

        });

        grid.render('market_rates');        
        var submit = fs.addButton({
            text: 'Search',
            disabled:false,
            handler: function(){
                fs.form.submit({
                    
                	method:'GET',
                    url:'../rateView', 
                    waitMsg:'Saving Data...',
                    /*  Alternatively, instead of using actionfailed / complete (below) you could use these functions:	*/
                    
                    success: function (request, response) {
                	
                	var resp = Ext.decode(response.response.responseText);
            		store.removeAll();
                    store.loadData(resp.reply);

                      // render the grid to the specified div in the page
                        market_rates.type="hidden";  
						Ext.MessageBox.alert('Message', 'Query executed.');
                        
                    },
                    failure:function(form, action) {
                        Ext.MessageBox.alert('Message', 'Query failed');
                    }
                    
                });
             }
        });
       


        fs.render('view_rates');


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
<h1>....where the journey begins.....</h1>

<div align="center" id="view_rates"></div> <br><br>
<div align="center" id="market_rates"></div>

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
