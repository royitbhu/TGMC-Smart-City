import java.io.IOException;  
import java.io.PrintWriter;


import java.sql.*;
import java.util.Enumeration;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class postTaxes extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   public static String sessionID ;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public postTaxes() {
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
        System.out.println("userName = ");
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility


        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        //session.setMaxInactiveInterval(2*60);

        String tax_name= request.getParameter("tax_name").toString();
        
        String paid_by= request.getParameter("paid_by").toString();
        String desc= request.getParameter("details").toString();
        if((session != null) && (session.getAttribute("SessionUser")!= null))
	{
        
	String username = session.getAttribute("SessionUser").toString();
        

        try {
        	  Class.forName("com.ibm.db2.jcc.DB2Driver");
        	}
        catch(ClassNotFoundException cnfe) {
        	  System.err.println("Error loading driver: " + cnfe);
        }
               
        System.out.println("reached here");
        String host = "localhost";
        String dbName = "check123";
        int port = 50000;
        String db2URL = "jdbc:db2://localhost:50000/check123";
        String dbusername = "db2inst1";
        String dbpassword = "tgmc";
        System.out.println("reached here");
        //Connection connection;
        try {
        	Connection connection = DriverManager.getConnection(db2URL, dbusername, dbpassword);
        	
        	DatabaseMetaData dbMetaData = connection.getMetaData();
			String productName =
			  dbMetaData.getDatabaseProductName();
			//System.out.println("Database: " + productName);
			String productVersion =
			  dbMetaData.getDatabaseProductVersion();
			System.out.println("reached here");
		Statement statement = connection.createStatement();
		System.out.println("reached here");
		String insertUser = "insert into taxes values(default,'"+tax_name+"','"+paid_by+"','"+desc+"')";
		System.out.println(insertUser);
		boolean result = statement.execute(insertUser);
		System.out.println("reached here");
			
                connection.close();
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	  }

	else
	{
		out.println("Session Invalid. Please Register to access home page.\nIf already registered, sign in here...");
		getServletConfig().getServletContext().getRequestDispatcher(
				        "/call.jsp").forward(request,response);
		System.out.println("reached here");
}		
}   	
}