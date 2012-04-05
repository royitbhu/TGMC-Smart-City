

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Security;
import java.util.Properties;
import java.security.Security;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


//import sendEmail2.GoogleTest;
 
/**
 * Servlet implementation class sendEmail3
 */
public class sendEmail3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendEmail3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		SimpleMail obj=new SimpleMail();
		try {
			obj.main2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	 
	   public class SimpleMail {
	   
		   public void main2() throws AddressException, MessagingException {
	      
	      
	         Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	         final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	      // Get a Properties object
	         Properties props = System.getProperties();
	  	 props.setProperty("proxySet","true");
	  	 props.setProperty("http.proxyHost","10.1.1.19");
	  	 props.setProperty("http.proxyPort","80");

	         props.setProperty("socksProxyHost","10.1.1.19");
	         props.setProperty("socksProxyPort","80");
	         props.setProperty("mail.smtp.host", "smtp.gmail.com");
	         props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	         props.setProperty("mail.smtp.socketFactory.fallback", "false");
	         props.setProperty("mail.smtp.port", "465");
	         props.setProperty("mail.smtp.socketFactory.port", "465");
	         props.put("mail.smtp.auth", "true");
	         props.put("mail.smtps.auth", "true");
	         props.put("mail.debug", "true");
	         props.put("mail.store.protocol", "pop3");
	         props.put("mail.transport.protocol", "smtp");
	         final String username = "hs.thegreat";
	         final String password = "koshish87";
	         Session session = Session.getDefaultInstance(props, 
	                              new Authenticator(){
	                                 protected PasswordAuthentication getPasswordAuthentication() {
	                                    return new PasswordAuthentication(username, password);
	                                 }});
	      
	       // -- Create a new message --
	         Message msg = new MimeMessage(session);
	      
	      // -- Set the FROM and TO fields --
	         msg.setFrom(new InternetAddress("hs.thegreat@gmail.com"));
	         msg.setRecipients(Message.RecipientType.TO, 
	                          InternetAddress.parse("hs.thegreat@gmail.com",false));
	         msg.setSubject("Hello");
	         msg.setText("How are you");
	         msg.setSentDate(new Date());
	         System.out.println("All Set");
	         Transport.send(msg);
	         System.out.println("Message sent.");
	      }
	   }

}
