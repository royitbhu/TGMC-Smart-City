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

<body> 

<div id="container">


<script  type="text/javascript" src="../JS/sitename_main.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_admin.js "></script>

<div id="wrap">

<script  type="text/javascript" src="./JS/leftside_admin.js "></script>
<script  type="text/javascript" src="./JS/rightside_admin.js "></script>
<script  type="text/javascript" src="./JS/mainmenu_hover_admin.js "></script>

<div id="content">
<h1>Contact information :</h1>


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
			String query1="";
			Statement statement = connection.createStatement();
			try{
				 query1=request.getParameter("username").toString();
			}catch(Exception e){}
			System.out.println(query1);
			//System.out.println(query);
			String query = "SELECT * FROM users where username='"+query1+"'";
			
			//String query = "SELECT * FROM market_rates order by category";
			System.out.println(query);
			ResultSet resultSet = statement.executeQuery(query);
			System.out.println(query);
			
	
			//out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");
	
			%>
			<table border 0>
				<tr><td>Address</td>
					<td>City</td>
					<td>Country</td>
					<td>Email</td>
					<td>Mobile No</td>
				</tr>
			<%
			int count =0 ;
			//System.out.println(query);
			while(resultSet.next()) {
				count++;
					String address = resultSet.getString(9);
					String city = resultSet.getString(10);
					String country = resultSet.getString(11);
					String mob_no = resultSet.getString(12);
					String email = resultSet.getString(6);
					
				//	System.out.println(query);
				
			%>
					<tr><td><%out.println(address); %></td>
					<td><%out.println(city); %></td>
					<td><% out.println(country); %></td>
					<td><% out.println(email); %></td>
					<td><% out.println(mob_no); %></td>
					
				</tr>
				<%} %>
				
			</table>
	
	 
	<%
	
		
		    	
	} catch (SQLException e) {
		
		e.printStackTrace();
		
		
		result = "{success:true}";
		System.out.println(result);
		//return ;
		//=result;
	}
}
else{
	session.setAttribute("contactUsername",request.getParameter("username").toString());
	%>
	<jsp:include page="getPayment.jsp"></jsp:include>
<%

}
//response.getWriter.print("{'success':true}");
%>

        <link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/ext-all.css" />
        <!--link rel="stylesheet" type="text/css" href="./ext-3.1.0/resources/css/xtheme-gray.css" /-->
        <link rel="stylesheet" type="text/css" href="./CSS/extjs.css" />
        <script type="text/javascript" src="./ext-3.1.0/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="./ext-3.1.0/ext-all.js"></script>

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
