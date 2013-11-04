package com.cloud.util;




import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
		
	
	
	public void sendVerify(String stu_email,String stu_nameMd5,String randMd5, String vcode, String ip)
	throws MessagingException {
		
			Message message=getMessage();
			
		
			message.setFrom(new InternetAddress(username));
			message.setRecipient(RecipientType.TO,new InternetAddress(stu_email));
			message.setSentDate(new Date());
			
			message.setSubject("信号与系统");
			
			String msg = "";
			//msg = URLEncoder.encode(msg);
			//msg = URLDecoder.decode(msg);
			try {
				msg = new String(msg.getBytes("utf-8"),"iso8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String m="<a href=\"http://" + ip + ":8080/vote/register_next.jsp?emailmd5="+stu_nameMd5+"&randommd5="
			+randMd5+"&msg=" + msg +"\">" +"http://" + ip + ":8080/vote/register_next.jsp?emailmd5="
			+stu_nameMd5+"&randommd5="+randMd5+"</a><br>您需要输入的验证码为" + vcode;
			
			message.setContent(m,"text/html;charset=utf-8");
			
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
