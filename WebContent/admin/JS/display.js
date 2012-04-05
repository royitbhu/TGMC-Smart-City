document.write(
		"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.1//EN''http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd'>"
		+"<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en'>"
		+"<head>"
		+"<title>Varanasi Smart City Home</title>"
		+"<meta http-equiv='content-type' content='text/html; charset=iso-8859-1' />"
		+"<meta name='description'"
		+"content='Varanasi is the most ancient city in India and is deeply influed by culture and religion.' />"
		+"<meta name='keywords' content='Varanasi, Smart City' />"
		+"<meta name='author' content='Shivasheesh' />"
		+"<link rel='stylesheet' href='../CSS/home.css' type='text/css'"
		+"	media='screen' />"
		+"<style type='text/css'>"
		+"#container {"
		+"	background: #f0f0f0 url(../images/bodybg-black.jpg) repeat-x;"
		+"}"
		
		+"#mainmenu a:hover {"
		+"	background: #f0f0f0 url(../images/menuhover-black.jpg) top left repeat-x"
		+"		;"
		+"}"

		+"#mainmenu a.current {"
		+"	background: #f0f0f0 url(../images/menuhover-black.jpg) top left repeat-x"
		+"		;"
		+"}"
		+"</style>"
		
		+" <link rel='stylesheet' type='text/css' href='../ext-3.1.0/resources/css/ext-all.css' />"
		+"       <!--link rel='stylesheet' type='text/css' href='../ext-3.1.0/resources/css/xtheme-gray.css' /-->"
		+"       <link rel='stylesheet' type='text/css' href='../CSS/extjs.css' />"
		

		+"  		</head>"
					
		+"<body>"

		+"<div id='container'>"

		+"<div id='sitename'>"
		+"<h1>Varanasi Smart-City</h1>"
		+"<p style='font-size: 20px;'><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;....where the journey begins.....</i></p></div>"
		+"<div id='mainmenu'>"
		+"<ul>"
		+"<li><a id='home-link' href='admin_home.jsp'><span>Home</span></a></li>"
		+"<li><a id='entertainment-link' href='./update_entertainment.jsp'><span>Entertainment</span></a><li>"
		+"<li><a id='business-link' href='./update_rates.jsp'><span>Update Market Rates</span></a><li>"
		+"<li><a id='business-link' href='./admin_view_rates.jsp'><span>View Market Rates</span></a><li>"
		+"<li><a id='gallery-link' href='update_gallery.jsp'><span>Gallery</span></a><li>"
		+"<li><a id='forum_main-link' href='admin_forum.jsp'><span>Forum</span></a><li>"
		+"<li><a id='news_main-link' href='update_news.jsp'><span>City News</span></a><li>"
		+"<li><a id='news_main-link' href='admin_view_profile.jsp'><span>View Profile</span></a><li>"
		+"<li><a id='news_main-link' href='admin_update_profile.jsp'><span>Update Profile</span></a><li>"
		+"</ul>"
		+"</div>"
		+"<div id='wrap'>"

		+"<div id='leftside'>"
		+"<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome !!!</h1>"
		+"<p><a class='nav' href='admin_home.jsp'>Home</a><span "
		+"class='hide'> | </span> <a class='nav' href='./update_entertainment.jsp'>Entertainment</a><span "
		+"class='hide'> | </span> <a class='nav' href='./update_rates.jsp'>Update Market Rates</a><span "
		+"class='hide'> | </span> <a class='nav' href='./admin_view_rates.jsp'>View Market Rates</a><span "
		+"class='hide'> | </span> <a class='nav' href='./update_gallery.jsp'>Gallery</a><span "
		+"class='hide'> | </span> <a class='nav' href='./forum_main.jsp'>Forum</a><span "
		+"class='hide'> | </span> <a class='nav' href='./update_news.jsp'>City News</a><span "
		+"class='hide'> | </span> <a class='nav' href='./view_profile.jsp'>View Profile</a><span "
		+"class='hide'> | </span> <a class='nav' href='./update_profile.jsp'>Update Profile</a><span "
		+"class='hide'> | </span></p>"
		+"</div>"
		+"<div id='rightside'>"

		+"<td  bgcolor='white' align='right' valign='top'  style='width:15%'>"
		+"<input type='submit' value='Sign out' name='sign_out' >"
		+"</td>"
		+"<br/>"
		+"<br/>"
		+"<a href='./home.jsp'>Click here to switch to normal user view</a>"
		+"<br/>"
		+"<br/>"
		+"<h1>&nbsp;&nbsp;&nbsp;Search</h1>"
		+"<p class='searchform'><input type='text' alt='Search' class='searchbox' /> <input type='submit' value='Go!' " 
		+"class='searchbutton' /></p>"

		+"<h1>&nbsp;&nbsp;&nbsp;Latest news</h1>"
		+"<p style='font-size: 15px'><strong> <script>"
		+"document.write(document.lastModified);"
		+"</script> </strong> look at the date above .... it's cool.. huh ?? what do u say ??</p>"

		+"</div>"


		+"<div id='content'>"
		+"<br>"
		+"<br>");

		/*var i =0 ;
		var newcontent="";
		newcontent+="<table border 0><tr><td>Category</td><td>Commodity</td><td>Price</td></tr>";
		for(i=0;i<resp.size;i++)
		{
			
			newcontent+="<tr><td>"+resp.reply[i].category+"</td>";
			newcontent+="<td>"+resp.reply[i].commodity+"</td>";
			newcontent+="<td>"+resp.reply[i].price+"</td></tr>";
			
		}
		
		document.getElementById('content').innerHTML=newcontent;*/
		