package com.snl.service.mail;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class MailService {
	
	private MailSender mailSender;
	
	private SimpleMailMessage message;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }
    public void setSimpleMailMessage(SimpleMailMessage message) {
    	this.message = message;
    }

    public void sendMail(String to, String msg) {
      
    	String[] toEmail = to.split(";");
    	for(int i=0; i<toEmail.length; i++){
    		message.setTo(toEmail[i]);    				
    	}
    	//message.setTo(to);
        message.setText(msg);
        try{
            this.mailSender.send(message);
        }
        catch(MailException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
