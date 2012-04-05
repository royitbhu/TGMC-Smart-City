 

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
public class updateTaxes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateTaxes() {
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
       // String username= request.getParameter("username").toString();

        String tax_name = request.getParameter("tax_name").toString();
        String paid_by = request.getParameter("paid_by").toString();
        String details=request.getParameter("details").toString();

       
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

				

			       
			       
				String updateMovies = "update taxes set details='"+details+"', paid_by='"+paid_by+"' where tax_name='"+tax_name+"'";
				System.out.println(updateMovies);
				//To do :insert the user in login table ..........................................how to insert first record?????????
				//String insertUserLogin = "insert into login values(default,'"+username+"','"+pass+"')";
			//	String query = "SELECT * FROM login";
				boolean result1 = statement.execute(updateMovies);
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