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

        var fs = new Ext.FormPanel({
            frame: true,
            title:'View latest city news here',
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
          			 emptyText:'01/01/1947',
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
        var submit = fs.addButton({
            text: 'Search',
            disabled:false,
            handler: function(){
                fs.form.submit({                    
                	method:'GET',
                    url:'../newsView', 
                    waitMsg:'Saving Data...',
                    /*  Alternatively, instead of using actionfailed / complete (below) you could use these functions:	*/
                    
                    success: function (request, response) {
                	
                	var resp = Ext.decode(response.response.responseText);

                	var innerContent="";
					innerContent+="<br><br>";
					var i=0;
					for (i=0; i<resp.size; i++)
					{
						
						innerContent += "<table border='0' cellpadding='1' cellspacing='0' width='100%' >";
			        	innerContent += "<tr><td align='left' bgcolor='#BEBEBE'><b>Title :&nbsp&nbsp&nbsp ";
			        	innerContent += resp.reply[i].heading ;
			        	innerContent += "</b></td></tr>";

			        	innerContent += "<tr><td align='left'><b>News date :&nbsp&nbsp&nbsp ";
			        	innerContent += resp.reply[i].source ;
			        	innerContent += "</b></td></tr>";
			        	
			        	innerContent += "<tr><td align='center'><a href='http://" + resp.reply[i].date + "'>";
			        	innerContent += resp.reply[i].date ;
			        	innerContent += "</a></td></tr>";

			        	innerContent += "<tr><td align='left'><b>Details :&nbsp&nbsp&nbsp</b>";
			        	innerContent += resp.reply[i].details ;
			        	innerContent += "<br></td></tr>";
			        	
			        	innerContent += "</table>";
			        	innerContent += "<HR WIDTH='80%' COLOR='#6699FF'  SIZE='3'><br>";
					}
					document.getElementById("ad_content").innerHTML = innerContent ;
						Ext.MessageBox.alert('Message', 'Query completed.');
                        
                    },
                    failure:function(form, action) {
                        Ext.MessageBox.alert('Message', 'Query failed');
                    }
                    
                });
             }
        });
       


        fs.render('view_news');


    });
    </script>
</head>

<body> 

<div id="container">

<script  type="text/javascript" src="../JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_main.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_main.js "></script>
<script  type="text/javascript" src="./JS/rightside_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_main.js "></script>

<div id="content">
<h1 align="center">Latest City News</h1><br><br>

<div align="center" id="view_news"></div>
<div align="center" id="ad_content"></div>

    <link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="../ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="../CSS/extjs.css" />
		<script type="text/javascript" src="../ext-3.1.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext-3.1.0/ext-all.js"></script>		
        <script type="text/javascript" src="../JS/site.js"></script>   
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
