package com.scitemav.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comentario {

	@Id @GeneratedValue @Column(name = "idcomentario")
	private Integer idComentario;
	
	@ManyToOne
	@JoinColumn(name = "idrevision",nullable = true)
	private Revision comRevision;
	
	@ManyToOne
	@JoinColumn(name = "idvehiculo",nullable = true)
	private Vehiculo comVehiculo;
	
	@ManyToOne
	@JoinColumn(name = "idempleado",nullable = true)
	private Empleado comEmpleado;
	
	@ManyToOne
	@JoinColumn(name = "idcliente",nullable = true)
	private Cliente comCliente;
	
	@ManyToOne
	@JoinColumn(name = "idusuario",nullable = false)
	private Usuario comUsuario;
	
	@Column(length = 1000, nullable = true)
	private String comentario;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	
	@Column(name = "visibilidad",length = 300, nullable = false)
	private String visibilidad;

	public Integer getIdComentario() {
		return idComentario;
	}

	public void setIdComentario(Integer idComentario) {
		this.idComentario = idComentario;
	}

	public Revision getComRevision() {
		return comRevision;
	}

	public void setComRevision(Revision comRevision) {
		this.comRevision = comRevision;
	}

	public Vehiculo getComVehiculo() {
		return comVehiculo;
	}

	public void setComVehiculo(Vehiculo comVehiculo) {
		this.comVehiculo = comVehiculo;
	}

	public Usuario getComUsuario() {
		return comUsuario;
	}

	public void setComUsuario(Usuario comUsuario) {
		this.comUsuario = comUsuario;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}		

	public String getVisibilidad() {
		return visibilidad;
	}

	public void setVisibilidad(String visibilidad) {
		this.visibilidad = visibilidad;
	}

	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Empleado getComEmpleado() {
		return comEmpleado;
	}

	public void setComEmpleado(Empleado comEmpleado) {
		this.comEmpleado = comEmpleado;
	}

	public Cliente getComCliente() {
		return comCliente;
	}

	public void setComCliente(Cliente comCliente) {
		this.comCliente = comCliente;
	}
	
}
