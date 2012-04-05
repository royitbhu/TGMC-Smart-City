

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class rateView
 */
public class executeSQL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public executeSQL() {
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
				String query="";
				JSONArray arrayObj=new JSONArray();
				Statement statement = connection.createStatement();
				try{
					 query=request.getParameter("query").toString();
				}catch(Exception e){}
				System.out.println(query);
				query.toLowerCase();
				int r=query.indexOf("select");
				
				if(r>=0 && r<=9)
				{
					int rows=statement.getMaxRows();
					ResultSet resultSet = statement.executeQuery(query);
					int count =0 ;
					String temp="{\"reply\":[";
					
					//System.out.println(query);
					while(resultSet.next()){
						count++;
							
							String r1 = resultSet.getString(1);
							String r2 = resultSet.getString(2);
							String r3 = resultSet.getString(3);
							
							//response.getWriter().print("{'category':'"+category+"','commodity':'"+commodity+"','price':'"+price+"'}");
							temp = temp+"{'r1':'"+r1+"','r2':'"+r2+"','r3':'"+r3+"'},";
							
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
					temp1=temp1+",'size':"+count+",'queryType':'select','success':true}";
					
					//temp = temp+"'success':true";
					System.out.println(temp1);
					response.getWriter().print(temp1);
				
				}
				else
				{
					r=query.indexOf("update");
					if(r>=0 && r<9)
					{
						int result1 = statement.executeUpdate(query);
						response.getWriter().print("{'queryType':'update','success':true}");
						
					}
					else
					{
						boolean result2=statement.execute(query);
						response.getWriter().print("{'queryType':'other','success':true}");
						
					}
					
					
				}
				
				System.out.println(query);
				

				//out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");

				
			    	
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