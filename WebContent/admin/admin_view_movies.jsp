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
 
		<script type="text/javascript" src="./JS/theatres.js"></script> 


    <script>
          
    Ext.onReady(function(){

        Ext.QuickTips.init();

        // turn on validation errors beside the field globally
        Ext.form.Field.prototype.msgTarget = 'side';
        var store = new Ext.data.JsonStore({
            fields: [
               {name: 'movie_name'},
               {name: 'mall_name'},
               {name: 'details'}                           
               ]
        });

        // create the Grid
        var grid = new Ext.grid.GridPanel({
            store: store,
            columns: [
                {id:'movie_name',header: 'Movie Name', width: 160, sortable: true, dataIndex: 'movie_name'},
                {header: 'Mall Name', width: 75, sortable: true,  dataIndex: 'mall_name'},
                {header: 'Details', width: 75, sortable: true,  dataIndex: 'details'}
            ],
            stripeRows: true,
            autoExpandColumn: 'movie_name',
            height: 350,
            width: 600,
            title: 'Movies in Varanasi',
            // config options for stateful behavior
            stateful: true,
            stateId: 'grid'        
        });
        var fs = new Ext.FormPanel({
            frame: true,
            title:'Search Movies',
            labelAlign: 'left',
            labelWidth: 85,
            width:440,
            waitMsgTarget: true,  

            items: [
                new Ext.form.FieldSet({
                    title: 'Movies in Varanasi',
                    autoHeight: true,
                    defaultType: 'textfield',
                    items: [
                            new Ext.form.ComboBox({
                            fieldLabel: 'theatre_name',
                            name:'theatre_name',
                            store: new Ext.data.ArrayStore({
                                fields: ['abbr', 'theatre_name'],
                                data : Ext.data.theatres // from states.js
                            }),
                            valueField:'abbr',
                            displayField:'theatre_name',
                            typeAhead: true,
                            mode: 'local',
                            triggerAction: 'all',
                            
                            emptyText:'Select a Theatre',
                            selectOnFocus:true,
                            width:190
                            
                            
                        }),{
                                xtype:'textfield',
                                fieldLabel: 'Movie name',
                                name: 'movie_name',
                                allowBlank:true,
                                value:'null',
                                anchor:'95%'
                            }
                     ]
                })
            ]
            

        });

        grid.render('movies');
        var submit = fs.addButton({
            text: 'Search',
            disabled:false,
            handler: function(){
                fs.form.submit({
                	method:'GET',
                    url:'../movieView',
                    waitMsg:'Saving Data...',
                    /*  Alternatively, instead of using actionfailed / complete (below) you could use these functions:	*/
                    
                    success: function (request, response) {
                    	var resp = Ext.decode(response.response.responseText);
                    	store.removeAll();
                        store.loadData(resp.reply);
                    	/*var i =0 ;
                    	document.write("<table border 0><tr><td>Movie Name</td><td>Cinema Hall</td><td>Details</td></tr>");
						for(i=0;i<resp.size;i++)
						{
							
							document.write("<tr><td>"+resp.reply[i].movie_name+"</td>");
							document.write("<td>"+resp.reply[i].mall_name+"</td>");
							document.write("<td>"+resp.reply[i].details+"</td></tr>");
							
						}*/
						
						Ext.MessageBox.alert('Message', 'Query Completed');
                        
                    },
                    failure:function(form, action) {
                        Ext.MessageBox.alert('Message', 'Save failed');
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
<h1>....where the journey begins.....</h1>


<div align="center" id="movies"></div>
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
