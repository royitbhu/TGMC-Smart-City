<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Varanasi | Main Signup</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<meta name="description"
	content="Varanasi is the most ancient city in India and is deeply influed by culture and religion." />
<meta name="keywords" content="Varanasi, Smart City" />
<meta name="author" content="Shivasheesh" />
<link rel="stylesheet" href="CSS/home.css" type="text/css"
	media="screen" />
<style type="text/css">
#container {
	background: #f0f0f0 url(images/bodybg-black.jpg) repeat-x;
}

#mainmenu a:hover {
	background: #f0f0f0 url(images/menuhover-black.jpg) top left repeat-x
		;
}

#mainmenu a.current {
	background: #f0f0f0 url(images/menuhover-black.jpg) top left repeat-x
		;
}
</style>
<script>                                

function newLocation1()
{
window.location="sign_up_general.jsp";
}
function newLocation2()
{
window.location="sign_up_tourist.jsp";
}
function newLocation3()
{
window.location="sign_up_businessman.jsp";
}

</script>
</head>

<body>

<div id="container">


<script  type="text/javascript" src="./JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_main.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_main.js "></script>
<script  type="text/javascript" src="./JS/rightside_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_main.js "></script>


<div id="content">
        <link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="./CSS/extjs.css" />

        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Loading Core API...';</script>
        <script type="text/javascript" src="./ext-3.1.0/adapter/ext/ext-base.js"></script>
        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Loading UI Components...';</script>
        <script type="text/javascript" src="./ext-3.1.0/ext-all.js"></script>
        <script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Initializing...';</script>
        <script type="text/javascript" src="./JS/App.js"></script>
        <script type="text/javascript" src="./JS/site.js"></script>
        <script type="text/javascript" src="./JS/visit_varanasi_main.js"></script>
        <script type="text/javascript" src="./JS/init.js"></script>
        <script type="text/javascript" src="./JS/login1.js"></script>

<table width="500" height="300" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
              <th height="53" scope="row"><div align="center"><span class="style30"><h2><b>Register As</b></h2> </span></div></th>
            </tr>
	<tr>
		<td align="center">
		<label>
			<input type="button" name="general" value="General" onclick="newLocation1()" >
			</label>
		</td>
	</tr>
	<tr>
		<td align="center"><label>
			<input type="button" name="tourist" value="Tourist" onclick="newLocation2()" >
			</label>
		</td>
	</tr>
	<tr>
		<td align="center">
		<label>
			<input type="button" name="businessman" value="Businessman" onclick="newLocation3()" >
			</label>	
		</td>
	</tr>	
</table>


<div id="ft"> 
<div id="footer"><a>&copy; 2009 Knight Webers</a></div>   
 

</div>

</div>

<div class="clearingdiv">&nbsp;</div>
</div>
</div>

</body>
</html>
