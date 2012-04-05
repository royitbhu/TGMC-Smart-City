import java.io.IOException;  
import java.io.PrintWriter;


import java.sql.*;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class postNews extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   public static String sessionID ;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public postNews() {
		super();
	}   	
	
	/* (non-Java-doc)
 	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String userName = request.getParameter("userName").toString();
        //System.out.println("userName = " + userName);
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		System.out.println("reached inside");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        //session.setMaxInactiveInterval(2*60);

	String title= request.getParameter("title").toString();
       
        
        String news_url= request.getParameter("news_url").toString();
        
        String details= request.getParameter("details").toString();
        //String short_desc= request.getParameter("short_desc").toString();
        session = request.getSession(false);
        String usertype = session.getAttribute("SessionType").toString();
        System.out.println(usertype);
        if(usertype.equalsIgnoreCase("admin"))
	{
        	System.out.println("reached inside");
        	System.out.println(usertype);
        

        try {
        	  Class.forName("com.ibm.db2.jcc.DB2Driver");
        	}
        catch(ClassNotFoundException cnfe) {
        	  System.err.println("Error loading driver: " + cnfe);
        }
               
        
        String host = "localhost";
        String dbName = "check123";
        int port = 50000;
        String db2URL = "jdbc:db2://localhost:50000/check123";
        String dbusername = "db2inst1";
        String dbpassword = "tgmc";
        //Connection connection;
        try {
        	Connection connection = DriverManager.getConnection(db2URL, dbusername, dbpassword);
        	
        	DatabaseMetaData dbMetaData = connection.getMetaData();
			String productName = dbMetaData.getDatabaseProductName();
			//System.out.println("Database: " + productName);
			String productVersion =
			  dbMetaData.getDatabaseProductVersion();
			System.out.println("reached inside");
		Statement statement = connection.createStatement();
		System.out.println(usertype);
		String insertUser = "insert into news values(default,'"+title+"','"+details+"',CURRENT DATE,'"+news_url+"')";
		System.out.println(insertUser);
		boolean result = statement.execute(insertUser);
			System.out.println("inserted");
			
                connection.close();
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().print("{'success':true}");
	  }
       
	else
	{
		out.println("Session Invalid. Please Register to access home page.\nIf already registered, sign in here...");
		getServletConfig().getServletContext().getRequestDispatcher(
				        "/call.jsp").forward(request,response);
}		
}   	
}