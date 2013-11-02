package com.cloud.util;




import java.util.*;

import javax.mail.Session;
import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.Message.RecipientType;
import javax.mail.Transport;
import javax.mail.MessagingException;

public class SendMail {
	
	String username="chenyunzhan08@163.com";
	String password="snow21";
	
	private Message getMessage(){

		Properties p=new Properties();
		p.put("mail.transport.protocol","smtp");
		p.put("mail.smtp.host","smtp.163.com");
		p.put("mail.smtp.port","25");
		p.put("mail.smtp.auth","true");
		
		
		MyAuthor auth=new MyAuthor(username,password);
		Session session=Session.getDefaultInstance(p,auth);
		Message message=new MimeMessage(session);
		
		return message;
	}
		
	
	
	public void sendVerify(String stu_email,String stu_nameMd5,String randMd5)
	throws MessagingException {
		
		Message message=getMessage();
		
		
			message.setFrom(new InternetAddress(username));
			message.setRecipient(RecipientType.TO,new InternetAddress(stu_email));
			message.setSentDate(new Date());
			
			message.setSubject("信号与系统");
			String m="<a href=\"http://127.0.0.1:8080/verify/mailVerify?stu_nameMd5="+stu_nameMd5+"&randMd5="+randMd5+"\">" +
					"http://127.0.0.1:8080/verify/mailVerify?stu_nameMd5="+stu_nameMd5+"&randMd5="+randMd5+"</a>";
			
			//"111.167.93.170"为本人电脑临时IP地址
			
			
			message.setContent(m,"text/html;charset=gb2312");
			
			Transport.send(message);
			
		}
	
	public void sendReset(String stu_email,String stu_nameMd5,String randMd5)
	throws MessagingException {
		Message message=getMessage();
		
		
		message.setFrom(new InternetAddress(username));
		message.setRecipient(RecipientType.TO,new InternetAddress(stu_email));
		message.setSentDate(new Date());
		
		message.setSubject("信号与系统");
		String m="<a href=\"http://127.0.0.1:8080/Mail/mailReset?stu_nameMd5="+stu_nameMd5+"&randMd5="+randMd5+"\">" +
				"http://127.0.0.1:8080/Mail/mailReset?stu_nameMd5="+stu_nameMd5+"&randMd5="+randMd5+"</a>";
		
		
		
		
		message.setContent(m,"text/html;charset=gb2312");
		
		Transport.send(message);
		
	}
	
	

}
