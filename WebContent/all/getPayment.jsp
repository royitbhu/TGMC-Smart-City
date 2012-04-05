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
        var store = new Ext.data.JsonStore({
            fields: [
               {name: 'address'},
               {name: 'country'},
               {name: 'city'},
               {name: 'mob_no'},
               {name: 'email'}                           
               ]
        });

        // create the Grid
        var grid = new Ext.grid.GridPanel({
            store: store,
            columns: [
                {id:'address',header: 'address', width: 160, sortable: true, dataIndex: 'address'},
                {header: 'city', width: 75, sortable: true,  dataIndex: 'city'},
                {header: 'country', width: 75, sortable: true,  dataIndex: 'country'},
                {header: 'mob_no', width: 75, sortable: true,  dataIndex: 'mob_no'},
                {header: 'email', width: 75, sortable: true,  dataIndex: 'email'}
            ],
            stripeRows: true,
            autoExpandColumn: 'address',
            height: 350,
            width: 600,
            title: 'Market Rates',
            // config options for stateful behavior
            stateful: true,
            stateId: 'grid'        
        });
        
        var fs = new Ext.FormPanel({
            frame: true,
            title:'Payment Details',
            labelAlign: 'right',
            labelWidth: 85,
            width:440,
            waitMsgTarget: true,  

            items: [
                    new Ext.form.FieldSet({
                        title: '',
                        autoHeight: true,
                        defaultType: 'textfield',
                     items: [      
								{
                                    xtype:'textfield',
                                    fieldLabel: 'bank_name',
                                    name: 'bank_name',
                                    allowBlank:false,
                                    anchor:'95%'
                                },
                                
								{
                                    xtype:'textfield',
                                    fieldLabel: 'account_no',
                                    name: 'account_no',
                                    allowBlank:false,
                                    
                                    anchor:'95%'
                                },
                                
								{
                                    xtype:'textfield',
                                    fieldLabel: 'bank_username',
                                    name: 'bank_username',
                                    allowBlank:false,
                                    
                                    anchor:'95%'
                                },
                                
								{
                                    xtype:'textfield',
                                    fieldLabel: 'passwords',
                                    name: 'passwords',
                                    allowBlank:false,
                                    
                                    anchor:'95%'
                                }
                         ]
                    })
                ]
                

            });

        	grid.render('market_rates');
            var submit = fs.addButton({
                text: 'Pay',
                disabled:false,
                handler: function(){
                    fs.form.submit({
                    	method:'GET',
                        url:'getPayment',
                        waitMsg:'Saving Data...',
                        /*  Alternatively, instead of using actionfailed / complete (below) you could use these functions:	*/
                        
                        success: function (request, response) {
                        	var resp = Ext.decode(response.response.responseText);
                        	store.removeAll();
                            store.loadData(resp.reply); 
                        	/*var i =0 ;
                        	document.write("<table border 2><tr><td>Address</td><td>City</td><td>Country</td><td>Mobile No</td><td>Email Address</td></tr>");
    						for(i=0;i<resp.size;i++)
    						{
    							    							
    							document.write("<tr><td>"+resp.reply[i].address+"</td>");
    							document.write("<td>"+resp.reply[i].city+"</td>");
    							document.write("<td>"+resp.reply[i].country+"</td>");
    							document.write("<td>"+resp.reply[i].mob_no+"</td>");
    							document.write("<td>"+resp.reply[i].email+"</td>");
    							
    							
    						}*/
    						Ext.MessageBox.alert('Message', 'Saved OK');
                            
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
			
<body> 

<div id="container">


<script  type="text/javascript" src="../JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_admin.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_admin.js "></script>
<script  type="text/javascript" src="./JS/rightside_admin.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_admin.js "></script>

<div id="content">
<h1>....where the journey begins.....</h1>


<div align="center" id="market_rates"></div>
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
