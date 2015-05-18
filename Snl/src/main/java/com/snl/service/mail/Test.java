package com.snl.service.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
	public static void main(String args[]){
		ApplicationContext context = 
	             new ClassPathXmlApplicationContext("Spring-Mail.xml");
	 
	    	MailService mm = (MailService) context.getBean("mailService");
	        mm.sendMail("kyseleee@naver.com",
	    		   "Testing only \n\n Hello Spring Email Sender");
	}
}
