
/*
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/

import java.io.IOException;  
import java.io.PrintWriter;


import java.sql.*;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class for Servlet: GreetingServlet
 *
 */
 public class login extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   public static String sessionID ;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public login() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String userName = request.getParameter("userName").toString();
        System.out.println("I reached in login");
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility


        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession( );
        session.setMaxInactiveInterval(30*60);
        String username = request.getParameter("username").toString();
        String password = request.getParameter("password").toString();
        //response.getWriter().print("{'gfcfvg':'ghgh', 'jhuj':99}");
       
        
        try {
        	  Class.forName("com.ibm.db2.jcc.DB2Driver");
        	}
        catch(ClassNotFoundException cnfe) {
        	  System.err.println("Error loading driver: " + cnfe);
        }
               
        
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
			
			String query = "SELECT * FROM login";
			ResultSet resultSet = statement.executeQuery(query);

	        out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Servlet GreetingServlet</title>");
	        out.println("</head>");
	        out.println("<body>");
//	        out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");
	        
	        
	        

	        int flag = 0;
			while(resultSet.next()) {
			
				if(username.equalsIgnoreCase(resultSet.getString(2)) && password.equals(resultSet.getString(3)))
				{
					//out.println("<p>Welcome " + username + "</p>");
					flag = 1;					
				}
				System.out.println("starteD"+resultSet.getString(2)+"Ended");

			
				  
			}
			if(flag == 1){
				String usertype="";
				String usertypeQuery = "Select usertype from users where username = '"+username+"'";
				System.out.println(usertypeQuery);
				ResultSet usertypeResult = statement.executeQuery(usertypeQuery);
				while(usertypeResult.next()) {
						usertype = usertypeResult.getString(1);
				}
				System.out.println(usertype);
				if(session == null)
				{
					out.println("<p> Login not successfull, session expired. Try again</p>");
					out.println("\n");
					//out.println("</p>");
					out.println("</body>");
			        out.println("</html>");

				}
				//else
				/*{
					
					out.println("<p>Welcome " + username + "</p>");
					out.println("<p> LOGIN Successfull </p>");
					out.println("\n");
					//out.println("</p>");
					out.println("</body>");
			        out.println("</html>");
					
				}*/
				session.setAttribute("SessionUser", username);
				session.setAttribute("SessionPassword", password);
				session.setAttribute("SessionType", usertype);
		        System.out.println("session ID: " + session.getId( ));
		        sessionID = session.getId( );
		        
				
				request.setAttribute("UserName", username);

			  //  try {
		    	if(usertype.equals("general"))
		    	{
				      //getServletConfig().getServletContext().getRequestDispatcher(
				      //  "../admin/home.jsp").forward(request,response);
			    	response.sendRedirect("/smartCityVaranasi/general/home.jsp");
			    	return;
		    	}
			    	if(usertype.equals("tourist"))
			    	{
					      //getServletConfig().getServletContext().getRequestDispatcher(
					      //  "../admin/home.jsp").forward(request,response);
				    	response.sendRedirect("/smartCityVaranasi/tourist/home.jsp");
				    	return;
			    	}
			    	if(usertype.equals("businessman"))
			    	{
					      //getServletConfig().getServletContext().getRequestDispatcher(
					      //  "../admin/home.jsp").forward(request,response);
				    	response.sendRedirect("/smartCityVaranasi/businessman/home.jsp");
				    	return;
			    	}
			    	if(usertype.equals("admin"))
			    	{
					      //getServletConfig().getServletContext().getRequestDispatcher(
					      //  "../admin/home.jsp").forward(request,response);
				    	response.sendRedirect("/smartCityVaranasi/admin/home.jsp");
				    	return;
			    	}
			    

			    //} catch (ServletException e) {
			      // TODO Auto-generated catch block
			      //e.printStackTrace();
			//    } 
				
				
			}
			else{
				out.println("<p>Dear " + username + "</p>");
				out.println("<p> LOGIN failed due to wrong User name or Password </p>");
			}
			
			connection.close();
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }   	  	    
}