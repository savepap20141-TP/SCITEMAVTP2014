package com.scitemav.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class ComentarioBean {
	
	private Integer idComentario;
	private Integer idUsuario;
	private String nombreUsuario;
	private String comentario;
	private Timestamp fechaCreacion;
	private String visibilidad;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getVisibilidad() {
		return visibilidad;
	}
	public void setVisibilidad(String visibilidad) {
		this.visibilidad = visibilidad;
	}
	public Integer getIdComentario() {
		return idComentario;
	}
	public void setIdComentario(Integer idComentario) {
		this.idComentario = idComentario;
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

}
