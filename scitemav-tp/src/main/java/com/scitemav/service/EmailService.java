package com.scitemav.service;


public interface EmailService {
	
	public void propiedades();
	public String mensajeEmail();
	public String cabeceraEmail();
	public void preparaEnviar(String para, String cabecera, String cuerpo);
	public boolean EnviarMensaje(String to);
	//Método final para enviar mensaje
	public boolean EnviarMensaje(String to, String cabecera, String cuerpo);
	public boolean habilitarUsuario(Integer idUsuario);
	public boolean NotificarRevisionesUsuario(Integer idRevision, Integer idUsuario);
	public boolean NotificarRevisionesUsuarioEstado(Integer idRevision, Integer idUsuario, String estado);
}
