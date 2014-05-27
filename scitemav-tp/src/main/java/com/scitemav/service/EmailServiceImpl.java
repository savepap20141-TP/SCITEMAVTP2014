package com.scitemav.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.model.Usuario;

@Service
public class EmailServiceImpl implements EmailService {

	Session mailSession;
	private String fromUser;
	private String fromUserEmailPassword;
	private String emailHost;
	private String cabecera;
	private String cuerpo;
	Properties emailProperties;
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static Random rnd = new Random();

	@PersistenceContext
	EntityManager em;

	@Override
	public void propiedades() {
		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", "587");
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
		mailSession = Session.getDefaultInstance(emailProperties, null);
		setFromUser("savepaptp20141@gmail.com");
		setFromUserEmailPassword("#savepaptp20141");
		setEmailHost("smtp.gmail.com");
	}

	@Override
	public String mensajeEmail() {
		return "Mensaje";
	}

	@Override
	public String cabeceraEmail() {
		return "Asunto";
	}

	@Override
	public void preparaEnviar(String para, String cabecera, String cuerpo) {
		try {
			MimeMessage emailMessage = new MimeMessage(mailSession);
			emailMessage.addRecipient(Message.RecipientType.TO,
					new InternetAddress(para));
			emailMessage.setSubject(cabecera);
			emailMessage.setContent(cuerpo, "text/html");
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(getEmailHost(), getFromUser(),
					getFromUserEmailPassword());
			transport
					.sendMessage(emailMessage, emailMessage.getAllRecipients());
			transport.close();
			System.out.println("Email sent successfully.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	@Override
	public boolean EnviarMensaje(String to) {
		propiedades();
		preparaEnviar(to, cabeceraEmail(), mensajeEmail());
		return true;
	}

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getFromUserEmailPassword() {
		return fromUserEmailPassword;
	}

	public void setFromUserEmailPassword(String fromUserEmailPassword) {
		this.fromUserEmailPassword = fromUserEmailPassword;
	}

	public String getEmailHost() {
		return emailHost;
	}

	public void setEmailHost(String emailHost) {
		this.emailHost = emailHost;
	}

	@Override
	public boolean EnviarMensaje(String to, String cabecera, String cuerpo) {
		propiedades();
		preparaEnviar(to, cabecera, cuerpo);
		return true;
	}

	@Transactional
	public boolean habilitarUsuario(Integer idUsuario) {
		// Generacion de password automatica aleatorio
		StringBuilder sb = new StringBuilder(10);
		String firstPassword = "";

		for (int i = 0; i < 10; i++) {
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		}

		firstPassword = sb.toString();

		Usuario user = em.find(Usuario.class, idUsuario);
		String asunto = "Bienvenido usuario de scitemav: "
				+ user.getUsuPersona().getNombre();
		String body = "Bienvenido nuevo usuario, ha sido habilitado para entrar al sistema<br />" +
					  "Email: "+user.getEmail()+"<br />"+
					  "Password: "+firstPassword;
		
		String md5 = DigestUtils.md5Hex(firstPassword);
		user.setPassword(md5);		
		em.merge(user);
		
		EnviarMensaje(user.getEmail(), asunto, body);
		return false;
	}

}
