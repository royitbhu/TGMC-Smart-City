import java.io.IOException;  
import java.io.PrintWriter;


import java.sql.*;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateMarketRates extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   public static String sessionID ;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public UpdateMarketRates() {
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
        //System.out.println("userName = " + userName);
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility


        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        //session.setMaxInactiveInterval(2*60);

        String category= request.getParameter("category").toString();
       
        
        String commodity= request.getParameter("commodity").toString();
        
        String price= request.getParameter("price").toString();
        //String short_desc= request.getParameter("short_desc").toString();
        session = request.getSession(false);
        String usertype = session.getAttribute("SessionType").toString();
        System.out.println(usertype);
        if(usertype.equalsIgnoreCase("admin"))
	{
        
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

		Statement statement = connection.createStatement();
		System.out.println(usertype);
		String insertUser = "insert into market_rates values(default,'"+category+"','"+commodity+"','"+price+"')";
		System.out.println(insertUser);
		boolean result = statement.execute(insertUser);
			System.out.println("inserted");
			
                connection.close();
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	  }

	else
	{
		out.println("Session Invalid. Please Sign in as admin to access home page....");
		getServletConfig().getServletContext().getRequestDispatcher(
				        "/call.jsp").forward(request,response);
}		
}   	
}