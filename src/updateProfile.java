 

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class rateView
 */
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(request, response);
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		
		PrintWriter out = response.getWriter();
        //String userName = request.getParameter("userName").toString();
        //String password = request.getParameter("password").toString();
        
        //String usertype= "tourist";
        String username= request.getParameter("username").toString();

        String fname = request.getParameter("fname").toString();
        //String old_pass = request.getParameter("old_pass").toString();
        //String pass = request.getParameter("pass").toString();
        String lname="null";
        String old_pass="null";
        String pass="null"; 
        
       String email= request.getParameter("email").toString();
       old_pass= request.getParameter("old_pass").toString();
       pass= request.getParameter("pass").toString();
        
        String address="null";
        String city="null";
        String country= request.getParameter("country").toString();
        String mob_no="null";
        String pincode= "null";
        
       
        lname= request.getParameter("lname").toString();
        address= request.getParameter("address").toString();
        city= request.getParameter("city").toString();
        //mob_no= request.getParameter("mob_no").toString();
        pincode= request.getParameter("pincode").toString();
       
       
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
				JSONArray arrayObj=new JSONArray();
				Statement statement = connection.createStatement();
				int flag=0;

				

			       if(!pass.equals("") && !(old_pass).equals(""))
			       {
			    	   ResultSet res=statement.executeQuery("select * from login where username='"+username+"'");
			    	   int flag2 = 0;
						while(res.next()) {
						
							if(username.equalsIgnoreCase(res.getString(2)) && old_pass.equals(res.getString(3)))
							{
								//out.println("<p>Welcome " + username + "</p>");
								flag = 1;
								
							}
													
							  
						}
						if(flag == 1){
							boolean result2 = statement.execute("update login set password='"+pass+"' where username='"+username+"'");
						}
						else{
					        out.println("<p>Dear " + username + "</p>");
							out.println("<p> Password Change failed because Old Password entered by was not correct </p>");
						}

			       }
			       
			       
				String updateUser = "update users set fname='"+fname+"',lname='"+lname+"',email='"+email+"',address='"+address+"',city='"+city+"',country='"+country+"',pincode='"+pincode+"' where username='"+username+"'";
				System.out.println(updateUser);
				//To do :insert the user in login table ..........................................how to insert first record?????????
				//String insertUserLogin = "insert into login values(default,'"+username+"','"+pass+"')";
			//	String query = "SELECT * FROM login";
				boolean result1 = statement.execute(updateUser);
				 //ResultSet res=statement.executeQuery("updateUser");//			execute("updateUser");
				//boolean resultLogin = statement.execute(insertUserLogin);
				
				
				
				
			
				
				
		
				int count =0 ;
				//String temp="{\"reply\":[";
				
				response.getWriter().print("{'success':true}");
				
			    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
			result = "{success:true}";
			System.out.println(result);
			//return ;
			//=result;
		}

	}

}