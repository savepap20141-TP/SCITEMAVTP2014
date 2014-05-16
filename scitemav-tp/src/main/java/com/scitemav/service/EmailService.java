package com.scitemav.service;


public interface EmailService {
	
	public void propiedades();
	public String mensajeEmail();
	public String cabeceraEmail();
	public void preparaEnviar(String para, String cabecera, String cuerpo);
	public boolean EnviarMensaje(String to);
	

}
