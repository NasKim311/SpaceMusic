package com.spaceMusic.action.function;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;

public class GoogleEmailAction implements Action { // 이메일 인증하는 action

	// 경로 설정 메소드
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();

		HashMap<String, String> maildata = new HashMap<>();
		maildata.put("user_email", req.getParameter("user_email"));

		req.setAttribute("authenticationNum", welcomeMailSend(maildata.get("user_email")));

		forward.setRedirect(false);
		forward.setPath("/signup.jsp");

		return forward;

	} // execute()

	// 난수(인증번호) 설정 메소드
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();

	} // RandomNum()

	//---------------------------------------------------------------------------------------------------------------------------	
	
	// 인증번호 메일 보내는 메소드
	public String welcomeMailSend(String recipient) {

		Properties prop = System.getProperties();

		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");

		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");

		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");

		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");

		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		// 난수 설정 메소드
		String authenticationNum = RandomNum();

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());

			// 발송자를 지정한다. 발송자의 메일, 발송자명
			msg.setFrom(new InternetAddress("spacemusic2222@gmail.com", "표시될 이름"));

			// 수신자의 메일을 생성한다.
			InternetAddress to = new InternetAddress(recipient);

			// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
			// 숨은 참조 설정이 가능하다.
			// Message.RecipientType.TO : 받는 사람
			// Message.RecipientType.CC : 참조
			// Message.RecipientType.BCC : 숨은 참조
			msg.setRecipient(Message.RecipientType.TO, to);

			// 메일의 제목 지정
			msg.setSubject("SpaceMusic 인증번호", "UTF-8");

			// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			msg.setText("인증번호 : " + authenticationNum, "UTF-8");

			Transport.send(msg);

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}

		return authenticationNum;

	} // welcomeMailSend()

} // GoogleEmailAction class
