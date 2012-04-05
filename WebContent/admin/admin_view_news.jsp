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
<link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css"/>

    <!-- GC -->
    <!-- LIBS -->
    <script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
    <!-- ENDLIBS -->
	<script type="text/javascript" src="../ext-3.1.0/ext-all-debug.js"> </script>
    <script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>

    <script>
         
    Ext.onReady(function(){

        Ext.QuickTips.init();
        Ext.form.Field.prototype.msgTarget = 'side';
        
        var store = new Ext.data.JsonStore({
            fields: [
               {name: 'heading'},
               {name: 'details'},
               {name: 'source'},
               {name: 'date'}                         
               ]
        });

        // create the Grid
         var grid = new Ext.grid.GridPanel({
                store: store,
                columns: [
                    {id:'heading',header: 'Heading', width: 160, sortable: true, dataIndex: 'heading'},
                    {header: 'Details', width: 75, sortable: true,  dataIndex: 'details'},
                    {header: 'Source', width: 75, sortable: true,  dataIndex: 'source'},
                    {header: 'Date', width: 75, sortable: true,  dataIndex: 'date'}
                ],
                stripeRows: true,
                autoExpandColumn: 'heading',
                height: 350,
                width: 600,
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
                new  Ext.form.FieldSet({
                	 collapsible: true,
          			 title: 'Enter date here',
           		 	 autoHeight: true ,
          			 defaults: {width:210},
          			 defaultType: 'textfield',
          			 collapsed: false,
                     items: [
                            new Ext.form.DateField({
	                  						fieldLabel: 'News Date',
				                     		name: 'date',
				                     		width:300,
				          			        emptyText:'Enter',
				                     		allowBlank:true,
				                     		value:'null'
               							 })
  							 ]
                        })
                     
                
            ]
        })
      

        grid.render('market_rates');
        var submit = fs.addButton({
            text: 'Submit',
            disabled:false,
            handler: function(){
                fs.form.submit({                    
                	method:'GET',
                    url:'../newsView', 
                    waitMsg:'Saving Data...',
                    /*  Alternatively, instead of using actionfailed / complete (below) you could use these functions:	*/
                    
                    success: function (request, response) {
                	
                	var resp = Ext.decode(response.response.responseText);
            		store.removeAll();
                    store.loadData(resp.reply);            
                    

                    
                    // render the grid to the specified div in the page
                        //market_rates.type="hidden";
						Ext.MessageBox.alert('Message', 'Query Done');
                        
                    },
                    failure:function(form, action) {
                        Ext.MessageBox.alert('Message', 'Query failed');
                    }
                    
                });
             }
        });
       


        fs.render('update_news');


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
<h1 align="center">Latest City News</h1><br><br>

<div id ="market_rates"></div>

<div id="update_news"></div>
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
