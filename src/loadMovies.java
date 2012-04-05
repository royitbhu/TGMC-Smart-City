

import java.io.IOException;
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
public class loadMovies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadMovies() {
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
		        //String movie_name = request.getParameter("movie_name").toString();
		        String mall_name = request.getParameter("mall_name").toString();
//		        String details=request.getParameter("details").toString();

				//System.out.println(query);
				String query ="";//= "SELECT * FROM movies where movie_name='"+movie_name+"' and mall_name='"+mall_name+"'";
				
				//String query = "SELECT * FROM market_rates order by category";
				System.out.println(query);
				ResultSet resultSet = statement.executeQuery(query);
				System.out.println(query);
				

				//out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");

				int count =0 ;
				String temp="{\"reply\":[";
				
				//System.out.println(query);
				while(resultSet.next()){
					count++;
						String movie_name2=resultSet.getString(2);
						String mall_name2=resultSet.getString(3);
						String details2=resultSet.getString(4);
				
						//temp = temp+"{'fname':'"+fname+"','lname'='"+lname+"','gender':'"+gender+"','dob':'"+dob+"','username':'"+username+"','email':'"+email+"','address':'"+address+"','city':'"+city+"','country':'"+country+"','pincode':'"+pincode+"'},";
						//temp = temp+"{'fname':'"+fname+"','lname'='"+lname+"','gender':'"+gender+"','dob':'"+dob+"','username':'"+username+"','address':'"+address+"','city':'"+city+"','country':'"+country+"','pincode':'"+pincode+"'},";
						//temp = temp+"{'address':'"+address+"','city':'"+city+"','country':'"+country+"','mob_no':'"+mob_no+"','email':'"+email+"'},";
						temp = temp+"{'movie_name':'"+movie_name2+"','mall_name':'"+mall_name+"','details':'"+details2+"'},";
						
						
						
						//arrayObj.add(category);
						  // arrayObj.add(commodity);
						   //arrayObj.add(price);
				//%>
					
				}
				
				int i=temp.length();
				char buf[]=new char[i];
				temp.getChars(0, i, buf, 0);
				buf[i-1]=']';
				String temp1=new String(buf);
				temp1=temp1+",'size':"+count+",'success':true}";
				
				//temp = temp+"'success':true";
				System.out.println(temp1);
				response.getWriter().print(temp1);
				
			    	
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