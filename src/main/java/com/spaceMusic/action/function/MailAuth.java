package com.spaceMusic.action.function;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator { // 인증번호 보내는 메일 정보 입력하는 클래스

	PasswordAuthentication pa;

	public MailAuth() {
		String mail_id = "spacemusic2222@gmail.com";
		String mail_pw = "vqhjlgbaxdoabnmw";

		pa = new PasswordAuthentication(mail_id, mail_pw);
		
	}	// MailAuth()

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
		
	}	// 신기함..
	
}	// MailAuth class
