

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
public class SignUpBusinessman extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpBusinessman() {
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
        HttpSession session = request.getSession( );
        session.setMaxInactiveInterval(2*60);
        //String userName = request.getParameter("userName").toString();
        //String password = request.getParameter("password").toString();
        System.out.println("i reached here 1");
        String usertype= "businessman";
        String username= request.getParameter("username").toString();
        String pass= request.getParameter("pass").toString();
        String fname = request.getParameter("fname").toString();
        
        String lname="null";
        
        String gender= request.getParameter("gender").toString();
        String dob= request.getParameter("dob").toString();
        dob = dob.replace('/', '-');
        
        
        String month=dob.substring(0, 2);
        String date=dob.substring(3, 5);
        String year=dob.substring(6, 10);
        dob=year+"-"+month+"-"+date;
        System.out.println("mob_no ="+dob);
        //dob="'2010-01-27'";
        System.out.println("mob_no ="+dob);
        String email= request.getParameter("email").toString();
        
        
        String address="null";
        String city="null";
        String country= request.getParameter("country").toString();
        String mob_no="null";
        String pincode= "null";
        String city_news = "off";
        try{
        	city_news =request.getParameter("city_news").toString();
        }
        catch(Exception e){}
        String market_rates ="off";
        try{
        	market_rates = request.getParameter("market_rates").toString();	
        }
        catch(Exception e){}
        String bank_name = "null";
        String account_no="null";
        String bank_username="null";
        
       
        lname= request.getParameter("lname").toString();
        address= request.getParameter("address").toString();
        city= request.getParameter("city").toString();
        mob_no= request.getParameter("mob_no").toString();
        pincode= request.getParameter("pincode").toString();
        bank_name=request.getParameter("bank_name").toString();
        account_no= request.getParameter("account_no").toString();
        bank_username= request.getParameter("bank_username").toString();
       
       //System.out.println(lname);
        if(!lname.equalsIgnoreCase("null"))
        	lname="'"+lname+"'";
        //else lname="null";
        if(!city.equalsIgnoreCase("null"))
        	city="'"+city+"'";
        //else city="null";
        if(!address.equalsIgnoreCase("null"))
        	address="'"+address+"'";
        //else address="null";
        if(!bank_name.equalsIgnoreCase("null"))
        	bank_name="'"+bank_name+"'";
        //else bank_name="null";
        if(!bank_username.equalsIgnoreCase("null"))
        	bank_username="'"+bank_username+"'";
        //else bank_username="null";
        
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

				String checkUsername = "SELECT * FROM login";
				ResultSet checkUser = statement.executeQuery(checkUsername);

				while(checkUser.next()) {
					
					if(username.equalsIgnoreCase(checkUser.getString(2)))
					{
						//out.println("<p>Welcome " + username + "</p>");
						flag = 1;
						
					}
								  
				}
				if(flag==0)
				{
								
					String insertUser = "insert into users values(default,'"+fname+"',"+lname+",'"+gender+"','"+dob+"','"+email+"','"+username+"','"+usertype+"',"+address+","+city+",'"+country+"',"+mob_no+","+pincode+",'"+city_news+"','"+market_rates+"',"+bank_name+","+account_no+","+bank_username+")";
					System.out.println(insertUser);
					//To do :insert the user in login table ..........................................how to insert first record?????????
					String insertUserLogin = "insert into login values(default,'"+username+"','"+pass+"')";
				//	String query = "SELECT * FROM login";
					boolean result1 = statement.execute(insertUser);
					boolean resultLogin = statement.execute(insertUserLogin);
					
				
				
				
				
					session.setAttribute("SessionUser", username);
					session.setAttribute("SessionPassword", pass);
					session.setAttribute("SessionType", usertype);
				    System.out.println("session ID: " + session.getId( ));
				    String sessionID = session.getId( );
				    
					
					request.setAttribute("UserName", username);
				     
				}
				else{
					out.println("<p>Dear " + username + "</p>");
					out.println("<p> This username already exists, try another one :-| </p>");
				}
			
				
				
		
				int count =0 ;
				String temp="{\"reply\":[";
				
				//System.out.println(query);
				//temp = temp+"'success':true";
				//System.out.println(temp1);
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