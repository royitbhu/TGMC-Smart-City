<%@page language="java" pageEncoding="UTF-8" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
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
<h1>Taxes imposed in Banaras.....</h1>


<%@ page import="java.util.*, java.sql.*" %>

<%
if((session.getAttribute("SessionType").toString()).equals("businessman") || ((session.getAttribute("SessionType").toString()).equals("admin")))
{

	try {
		  Class.forName("com.ibm.db2.jcc.DB2Driver");
		}
		catch(ClassNotFoundException cnfe) {
	  		System.err.println("Error loading driver: " + cnfe);
		}	
	   
		String result;
		String host = "localhost";
		String dbName = "check123";
		int port = 8080;
		String db2URL = "jdbc:db2://localhost:50000/check123";
		String dbusername = "db2inst1";
		String dbpassword = "tgmc";
		//Connection connection;
		try {
			Connection connection = DriverManager.getConnection(db2URL, dbusername, dbpassword);
	
			DatabaseMetaData dbMetaData = connection.getMetaData();
			String productName =
	  		dbMetaData.getDatabaseProductName();
			//System.out.println("Database: " + productName);
			String productVersion =
	  		dbMetaData.getDatabaseProductVersion();
			//System.out.println("Version: " + productVersion);
	
	
			// make statement and execute
			
			Statement statement = connection.createStatement();
			
			String query = "SELECT * FROM taxes";
			
			//String query = "SELECT * FROM market_rates order by category";
			System.out.println(query);
			ResultSet resultSet = statement.executeQuery(query);
			System.out.println(query);
			
	
			//out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");
	
			%>
			<table border 0>
				<tr><td>Tax Name</td>
					<td>Paid By</td>
					<td>Details</td>
				</tr>
			<%
			int count =0 ;
			//System.out.println(query);
			while(resultSet.next()) {
				count++;
					String tax_name = resultSet.getString(2);
					String paid_by = resultSet.getString(3);
					String details = resultSet.getString(4);
				//	System.out.println(query);
				
			%>
					<tr><td><%out.println(tax_name); %></td>
					<td><%out.println(paid_by); %></td>
					<td><% out.println(details); %></td>
				</tr>
				<%} %>
				
			</table>
	
	 
	<%
	
		
		    	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
		
		result = "{success:true}";
		System.out.println(result);
		//return ;
		//=result;
	}
}
else
{
	out.println("You are not authorised to view taxes. Please login as a businessman");
}
//response.getWriter.print("{'success':true}");
%>


        <br/>

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
