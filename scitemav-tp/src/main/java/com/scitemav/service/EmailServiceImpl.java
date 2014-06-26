package com.scitemav.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.scitemav.model.Revision;
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
		String bodyFinal="";
		
		for (int i = 0; i < 10; i++) {
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		}

		firstPassword = sb.toString();

		Usuario user = em.find(Usuario.class, idUsuario);
		String asunto = "Bienvenido usuario de scitemav: "
				+ user.getUsuPersona().getNombre();
		
		bodyFinal = "<div style=' background-color: rgb(235,240,242); margin: 0 auto 0 auto; text-align: center; font-family: arial;'>";
		bodyFinal+= "<h2 style='font-family: arial;'>SCITEMAV</h1>";		
		
		bodyFinal+= "<div style='font-family: arial; text-size=150%;'>";
		bodyFinal+= "Bienvenido al sistema, "+user.getUsuPersona().getNombre()+"<br /><br />";
		bodyFinal+= "Usted ha sido habilitado para ingresar. Sus datos son los siguientes:<br />";
		bodyFinal+= "Usuario: "+user.getEmail()+"<br />";
		bodyFinal+= "Password: "+user.getPassword()+"<br />";
		bodyFinal+= "Por favor, cambie sus datos al ingresar al sistema.<br />";		
		bodyFinal+= "</div>";
		bodyFinal+= "<div style='margin: 0 auto 0 auto; text-align: center;'>";
		bodyFinal+= "<img src='https://raw.githubusercontent.com/savepap20141-TP/SCITEMAVTP2014/master/scitemav-tp/WebContent/images/scitemavlogo.png' heigth='300px' width='300px' />";
		bodyFinal+= "</div><br />";

		
		
		
		/**String body = "Bienvenido nuevo usuario, ha sido habilitado para entrar al sistema<br />" +
					  "Email: "+user.getEmail()+"<br />"+
					  "Password: "+firstPassword;**/
		
		String md5 = DigestUtils.md5Hex(firstPassword);
		user.setPassword(md5);		
		em.merge(user);
		
		EnviarMensaje(user.getEmail(), asunto, bodyFinal);
		return false;
	}
	
	

	@Transactional
	public boolean NotificarRevisionesUsuario(Integer idRevision, Integer idUsuario) {

		Revision rev = em.find(Revision.class, idRevision);
		Usuario user = em.find(Usuario.class, idUsuario);
		String asunto = "Notificacion de scitemav proxima revision: REV-"+idRevision+ " a : "
				+ user.getUsuPersona().getNombre();
		String body = "Se le notifica que se le acerca una revision proxima <br/>" +
					  "Sr. o Sra. : "+user.getUsuPersona().getNombre()+" "+user.getUsuPersona().getApellidoPaterno()+" "+user.getUsuPersona().getApellidoMaterno()+"<br />"+
					  "Su Vehiculo de Nro. Placa : "+rev.getRevVehiculo().getNumeroPlaca()+"<br />"+
					  "La Fecha de su proxima revisión es : "+rev.getFechaProxima()+"<br />"+
					  "El Kilometraje para esta revisión es : "+rev.getKilometrajeProximo()+"<br />";
		
		
		EnviarMensaje(user.getEmail(), asunto, body);
		return false;
	}
	
	@Transactional
	public boolean NotificarRevisionesUsuarioEstado(Integer idRevision, Integer idUsuario, String estado) {

		Revision rev = em.find(Revision.class, idRevision);
		Usuario user = em.find(Usuario.class, idUsuario);
		String asunto = "Notificacion de SCITEMAV cambio de estado en la revision: REV-"+idRevision+ " a : "+estado.toUpperCase()+" "
				+ user.getUsuPersona().getNombre();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();        
		String DateNow = df.format(today);
		String body = "Se le notifica que se su vehiculo esta siendo cambiado al estado: "+estado+" <br/>" +
						"Sr. o Sra. : "+user.getUsuPersona().getNombre()+" "+user.getUsuPersona().getApellidoPaterno()+" "+user.getUsuPersona().getApellidoMaterno()+"<br />"+
						"Su Nro. Documento : "+user.getUsuPersona().getDni()+"<br />"+
						"Su Vehiculo de Nro. Placa : "+rev.getRevVehiculo().getNumeroPlaca()+"<br />"+
						"La Fecha en la que se efectuo esta operacion es : "+DateNow+"<br />";
		
		
		EnviarMensaje(user.getEmail(), asunto, body);
		return false;
	}
}
