import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.http.*;

import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.FileRenamePolicy;


public class UploadServlet extends HttpServlet {
   
    private String fileSavePath;

  public void init( ){
    
      // save uploaded files to a 'data' directory in the web app

      //fileSavePath =   getServletContext( ).getRealPath("/") + "data";
	  fileSavePath = "/home/db2inst1/EclipseWorkspace/smartCityVaranasi/WebContent/uploadedFiles";
	  
	  
   
  }
  
  public void doPost(HttpServletRequest request, 
    HttpServletResponse response) throws ServletException,
      java.io.IOException {
	  
	  PrintWriter pw = response.getWriter();

    response.setContentType("text/html");
    java.io.PrintWriter out = response.getWriter( );
    
    out.println("<html>");
    out.println("<head>");
    out.println("<title>File uploads</title>");  
    out.println("</head>");
    out.println("<body>");

    out.println("<h2>Here is information about any uploaded files</h2>");
    FilePart fPart = null;
    try{

        // file limit size of 5 MB
        MultipartParser parser = new MultipartParser(
           request,5 * 1024 * 1024);

        Part _part = null;

        while ((_part = parser.readNextPart( )) != null) {
       
           if (_part.isFile( )) {

               // get some info about the file
        	   fPart = (FilePart) _part;
               String name = fPart.getFileName( );
               System.out.println(fPart.getFilePath());
               if (name != null) {
            	   String ad_id="unknown";
            	   HttpSession session = request.getSession(false);
   				try{
   					//query1=session.getAttribute("contactUsername").toString();
   					ad_id=session.getAttribute("ad_id").toString();
   				}catch(Exception e){}
   				String imagename="";
   				imagename=ad_id+".jpg";
            	   FileRenamer newName = new FileRenamer();
            	   newName.setFilename(imagename);
                   fPart.setRenamePolicy(newName);
                   name = fPart.getFileName( );
                   System.out.println(fPart.getFilePath());
  
                   long fileSize = fPart.writeTo(
                     new java.io.File(fileSavePath));

                   out.println("The user's file path for the file: " +
                     fPart.getFilePath( ) + "<br>");

                   out.println("The content type of the file: " +
                     fPart.getContentType( )+ "<br>");

                   out.println("The file size: " +fileSize+ " bytes<br><br>");
                   
                

                  //commence with another file, if there is one

               } else {
  
               out.println(
                 "The user did not upload a file for this part.");

               }

          }    else if (_part.isParam( )) {
              // do something else if it is a non-file-type parameter,
              //such as a username
          }
  
        }// end while


        out.println("</body>");
        out.println("</html>");

    } catch (java.io.IOException ioe){
       
       //an error-page in the deployment descriptor is 
       //mapped to the java.io.IOException
        throw new java.io.IOException(
            "IOException occurred in: " + getClass( ).getName( ));
    }
    
    /*
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
    	Connection con = DriverManager.getConnection(db2URL, dbusername, dbpassword);
    	
    	DatabaseMetaData dbMetaData = con.getMetaData();
		String productName =
		  dbMetaData.getDatabaseProductName();
		//System.out.println("Database: " + productName);
		String productVersion =
		  dbMetaData.getDatabaseProductVersion();

	Statement statement = con.createStatement();
	System.out.println("reached here");
      PreparedStatement ps = con.prepareStatement("INSERT INTO images VALUES(?,?)");
      String filename=fileSavePath+"/"+fPart.getFilePath( );
      File file = 
         new File(filename);
      FileInputStream fs = new FileInputStream(file);
      ps.setString(1,"default");
      System.out.println("reached here");
      ps.setBinaryStream(2,fs,fs.available());
      System.out.println("reached here");
      //ps.setString(3,"my");
      int i = ps.executeUpdate();
      System.out.println("reached here");
    
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
*/
    
    
    
    
    
  }//doPost
  
  public class FileRenamer implements FileRenamePolicy {

	    private String filename = "unnamed.dat";
	    // This method does not need to be synchronized because createNewFile()
	    // is atomic and used here to mark when a file name is chosen
	    public File rename(File f) {
	        f = new File(f.getParent(), filename);
	        return f;
	    }

	    public void setFilename(String fn) {
	        filename = fn;
	    }
	}


    public void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException,
        java.io.IOException {
        
        throw new ServletException(
            "GET method used with " + getClass( ).getName( )+
                 ": POST method required.");
    }
}


