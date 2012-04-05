

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
public class adView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adView() {
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
				String keywords="null";
				JSONArray arrayObj=new JSONArray();
				Statement statement = connection.createStatement();
				String buy_sell=request.getParameter("buy_sell").toString();
				try{
					 keywords=request.getParameter("keywords").toString();
				}catch(Exception e){}
				System.out.println(keywords);
				String category="Select a category";
				try{
					 category=request.getParameter("category").toString();
				}catch(Exception e){}
				System.out.println(category);
				//System.out.println(query);
				String query="";
				if(category.equalsIgnoreCase("Select a category"))
				{
					query="select * from ads where buy_sell='"+buy_sell+"'";
				}
				else
				{
					query="select * from ads where buy_sell='"+buy_sell+"' and category='"+category+"'";
				}
				
				
				
				
				
				//String query = "SELECT * FROM market_rates order by category";
				System.out.println(query);
				ResultSet resultSet = statement.executeQuery(query);
				System.out.println(query);
				

				//out.println("<h1>Servlet GreetingServlet at " + request.getContextPath () + "</h1>");

				int count =0 ;
				String temp="{\"reply\":[";
				
				//System.out.println(query);
				while(resultSet.next()){
					
						String ad_title = resultSet.getString(3);
						System.out.println(ad_title);
						String short_desc = resultSet.getString(4);
						String keywords1 = resultSet.getString(5);
						String details = resultSet.getString(6);
						String posted_by = resultSet.getString(8);
						String posted_on=resultSet.getString(7);
						if(keywords.equalsIgnoreCase("null"))
						{
							temp = temp+"{'ad_title':'"+ad_title+"','short_desc':'"+short_desc+"','details':'"+details+"','posted_by':'"+posted_by+"','posted_on':'"+posted_on+"'},";
							count++;
						}						
						else
						{
							int r=keywords1.indexOf(keywords);
							System.out.println(r);
							if(r>=0)
							{
								temp = temp+"{'ad_title':'"+ad_title+"','short_desc':'"+short_desc+"','details':'"+details+"','posted_by':'"+posted_by+"','posted_on':'"+posted_on+"'},";
								count++;
							}
								
						}
						//temp = temp+"{'movie_name':'"+movie_name+"','mall_name':'"+mall_name+"','details':'"+details+"'},";
						
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