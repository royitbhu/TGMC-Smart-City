
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class sendEmail extends HttpServlet {

   //default value for mail server address, in case the user 
   //doesn't provide one
   private final static String DEFAULT_SERVER = "";
  public static  String SMTP_HOST_NAME;
   public static String SMTP_AUTH_USER;
   public static String SMTP_AUTH_PWD;

  public void doPost(HttpServletRequest request, 
    HttpServletResponse response) throws ServletException,
      java.io.IOException {
          
      //obtain the values for email components from
      //request parameters
	  SMTP_HOST_NAME = "smtp.gmail.com";

	   SMTP_AUTH_USER = "plstalk2me@gmail.com";

	   SMTP_AUTH_PWD = "koshish";

      //if (smtpServ == null || smtpServ.equals(""))
        //  smtpServ = DEFAULT_SERVER;
      /*
      String from = request.getParameter("from");
      String to = request.getParameter("to");
      String subject = request.getParameter("subject");
      String emailContent = request.getParameter("emailContent");
    */
      String from = "hs.thegreat@gmail.com";
      String to = "plstalk2me@gmail.com";
      String subject = "hello";
      String emailContent = "successful mail sent from servlet";
      response.setContentType("text/html");
      java.io.PrintWriter out = response.getWriter( );

      out.println(
        "<html><head><title>Email message sender</title></head><body>");
     
      try {
       
           sendMessage(SMTP_HOST_NAME, SMTP_AUTH_USER, SMTP_AUTH_PWD, to, from, subject, emailContent);
           
       } catch (Exception e) {
       
           throw new ServletException(e.getMessage( )); 
           
       }
       
       out.println(
            "<h2>The message was sent successfully</h2>");
    
       out.println("</body></html>");

  } //doPost
     
  private void sendMessage(String smtpServer,String SMTP_AUTH_USER, String SMTP_AUTH_PWD,String to, String from,
    String subject,String emailContent) throws Exception {
     
      Properties properties = System.getProperties( );
      //populate the 'Properties' object with the mail
      //server address, so that the default 'Session'
      properties.put("mail.transport.protocol", "smtp");
      properties.put("mail.smtp.starttls.enable","true");
      properties.put("mail.smtp.host", smtpServer);
      //props.put("mail.smtp.host", SMTP_HOST_NAME);
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "465");
      Authenticator auth = new SMTPAuthenticator();
    //auth = null;
   

      Session session = Session.getDefaultInstance(properties,auth);
      Message mailMsg = new MimeMessage(session);//a new email message
      InternetAddress[] addresses = null;
    System.out.println("ok");
      try {
   

          if (to != null) {
        
              //throws 'AddressException' if the 'to' email address
              //violates RFC822 syntax
              addresses = InternetAddress.parse(to, false);
              mailMsg.setRecipients(Message.RecipientType.TO, addresses);
        
          } else {
        
              throw new MessagingException(
                "The mail message requires a 'To' address.");
        
          }

          if (from != null) {
        
              mailMsg.setFrom(new InternetAddress(from));
        
          } else {
        
              throw new MessagingException(
                "The mail message requires a valid 'From' address.");
        
          } 
        
          if (subject != null)
              mailMsg.setSubject(subject);

          if (emailContent != null)
              mailMsg.setText(emailContent);
        System.out.println("again ok");
          //Finally, send the mail message; throws a 'SendFailedException' 
          //if any of the message's recipients have an invalid address
          Transport.send(mailMsg);
          System.out.println("final ok");
          } catch (Exception exc) {
     
              throw exc;
    
          }
     
  }//sendMessage
    
  public void doGet(HttpServletRequest request, 
      HttpServletResponse response) throws ServletException,
          java.io.IOException {
                  

      //doGet( ) calls doPost( )...
      doPost(request, response);

  }//doGet
  
  private class SMTPAuthenticator extends javax.mail.Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
		String username = SMTP_AUTH_USER;
		String password = SMTP_AUTH_PWD;
		return new PasswordAuthentication(username, password);
		}
		}


		
    
}//EmailServlet
