import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InsertImage extends  HttpServlet{
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException{
    PrintWriter pw = response.getWriter();
    String host = "localhost";
    String dbName = "check123";
    int port = 50000;
    String db2URL = "jdbc:db2://localhost:50000/check123";
    String dbusername = "db2inst1";
    String dbpassword = "tgmc";
    //Connection connection;
    try {
    	Connection con = DriverManager.getConnection(db2URL, dbusername, dbpassword);
    	
    	DatabaseMetaData dbMetaData = con.getMetaData();
		String productName =
		  dbMetaData.getDatabaseProductName();
		//System.out.println("Database: " + productName);
		String productVersion =
		  dbMetaData.getDatabaseProductVersion();

	Statement statement = con.createStatement();

      PreparedStatement ps = con.prepareStatement("INSERT INTO images VALUES(?,?)");
      File file = 
         new File("C:/apache-tomcat-6.0.16/webapps/CodingDiaryExample/images/5.jpg");
      FileInputStream fs = new FileInputStream(file);
      ps.setInt(1,8);
      ps.setBinaryStream(2,fs,fs.available());
      int i = ps.executeUpdate();
      if(i!=0){
        pw.println("image inserted successfully");
      }
      else{
        pw.println("problem in image insertion");
      }  
    }
    catch (Exception e){
      System.out.println(e);
    }
  }
}