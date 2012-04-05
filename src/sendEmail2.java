

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.security.Security;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class sendEmail2
 */
public class sendEmail2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendEmail2() {
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
		String args[];
		GoogleTest obj=new GoogleTest();
		try {
			obj.main2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public class GoogleTest{

		private static final String SMTP_HOST_NAME = "smtp.gmail.com";
		private static final String SMTP_PORT = "465";
		private static final String emailMsgTxt = "Test Message Contents";
		private static final String emailSubjectTxt = "A test from gmail";
		private static final String emailFromAddress = "hs.thegreat@gmail.com";
		private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		public final String[] sendTo = { "goluagarwal5@gmail.com"};


		public void main2() throws Exception {
		System.out.println("reached in googletest");
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

		new GoogleTest().sendSSLMessage(sendTo, emailSubjectTxt,emailMsgTxt, emailFromAddress);
		System.out.println("Sucessfully Sent mail to All Users");
		}

		public void sendSSLMessage(String recipients[], String subject,
		String message, String from) throws MessagingException {
		boolean debug = true;

		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtps.host", SMTP_HOST_NAME);
		props.put("mail.smtps.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtps.port", SMTP_PORT);
		props.put("mail.smtps.user", "hs.thegreat@gmail.com");
		props.put("mail.smtps.socketFactory.port", SMTP_PORT);
		props.put("mail.smtps.socketFactory.class", SSL_FACTORY);
		props.put("mail.smtps.socketFactory.fallback", "false");

		Session session = Session.getDefaultInstance(props,	new javax.mail.Authenticator() {

		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hs.thegreat@gmail.com", "koshish87");
		}
		});

		session.setDebug(debug);

		Message msg = new MimeMessage(session);
		InternetAddress addressFrom = new InternetAddress(from);
		msg.setFrom(addressFrom);
		
		System.out.println("reached in googletest");
		
		InternetAddress[] addressTo = new InternetAddress[recipients.length];
		for (int i = 0; i < recipients.length; i++) {
		addressTo[i] = new InternetAddress(recipients[i]);
		}
		msg.setRecipients(Message.RecipientType.TO, addressTo);
		System.out.println("reached in googletest");
		// Setting the Subject and Content Type
		msg.setSubject(subject);
		msg.setContent(message, "text/plain");
		System.out.println("All set");
		Transport.send(msg);
		System.out.println("went");
		}
		}

}

