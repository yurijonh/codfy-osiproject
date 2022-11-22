package com.qosi.model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailAccess {
	
	private Properties prop;
	private gerarCodigo cod = new gerarCodigo();
	private String codigo;
	private Database ld = new Database();
	
	public String getCodigo() {
		setCodigo();
		return codigo;
	}
	
	private String setCodigo() {
		this.codigo = this.cod.gerarCod();
		return codigo;
	}

	public void getProp(String email) {
		prop = System.getProperties();
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
	    	  protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("email", "senha");
					
				}
		});
		
		try {
	         MimeMessage message = new MimeMessage(session);

	         //remetente
	         message.setFrom(new InternetAddress("queroquestif@gmail.com"));

	         //destinat�rio
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

	         //Assunto da mensagem
	         message.setSubject("Código de verificação QueroQuest.");

	         //corpo da mensagem
	         message.setText("Seu código de verificação é: "+getCodigo());
	         this.ld.inserirCod(this.codigo);

	         //realizar envio
	         Transport.send(message);         
	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	}	
}
