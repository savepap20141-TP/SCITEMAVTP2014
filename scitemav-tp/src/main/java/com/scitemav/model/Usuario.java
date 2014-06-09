package com.scitemav.model;

import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Usuario {
	
	@Id @GeneratedValue @Column(name = "idusuario")	
	private Integer idUsuario;
	
	@Column(length = 60, nullable = false)
	private String email;
	@Column(length = 60, nullable = false)
	private String password;
	@Column(name = "fechacreacion", nullable = true)
	private Timestamp fechaCreacion;
	@Column(name = "activo", nullable = true)
	private Boolean activo;
	@Column(length = 60, nullable = false)
	private String estado;
	
	@OneToOne(mappedBy="perUsuario")
	private Persona usuPersona;
	
	@OneToMany(mappedBy ="arcUsuario")
	private Collection<Archivo> usuArchivos;
	
	public Collection<Archivo> getUsuArchivos() {
		return usuArchivos;
	}
	public void setUsuArchivos(Collection<Archivo> usuArchivos) {
		this.usuArchivos = usuArchivos;
	}
	public Collection<Comentario> getUsuComentarios() {
		return usuComentarios;
	}
	public void setUsuComentarios(Collection<Comentario> usuComentarios) {
		this.usuComentarios = usuComentarios;
	}
	@OneToMany(mappedBy ="comUsuario")
	private Collection<Comentario> usuComentarios;
	
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public Persona getUsuPersona() {
		return usuPersona;
	}
	public void setUsuPersona(Persona usuPersona) {
		this.usuPersona = usuPersona;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

}
