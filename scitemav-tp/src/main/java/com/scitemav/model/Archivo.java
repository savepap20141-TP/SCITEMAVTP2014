package com.scitemav.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Archivo {

	@Id @GeneratedValue @Column(name = "idarchivo")
	private Integer idArchivo;
	
	@ManyToOne
	@JoinColumn(name = "idrevision",nullable = true)
	private Revision arcRevision;
	
	@ManyToOne
	@JoinColumn(name = "idvehiculo",nullable = true)
	private Vehiculo arcVehiculo;
	
	@ManyToOne
	@JoinColumn(name = "idusuario",nullable = false)
	private Usuario arcUsuario;
	
	@Column(name = "urlimagen",length = 300, nullable = true)
	private String urlImagen;
	
	@Column(name = "tipoarchivo", length = 100, nullable = true)	
	private String tipoArchivo;
	
	@Column(length = 10, nullable = true)	
	private Long size;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	
	@Column(length = 1000, nullable = true)
	private String descripcion;

	public Integer getIdArchivo() {
		return idArchivo;
	}

	public void setIdArchivo(Integer idArchivo) {
		this.idArchivo = idArchivo;
	}

	public Revision getArcRevision() {
		return arcRevision;
	}

	public void setArcRevision(Revision arcRevision) {
		this.arcRevision = arcRevision;
	}

	public Vehiculo getArcVehiculo() {
		return arcVehiculo;
	}

	public void setArcVehiculo(Vehiculo arcVehiculo) {
		this.arcVehiculo = arcVehiculo;
	}

	public Usuario getArcUsuario() {
		return arcUsuario;
	}

	public void setArcUsuario(Usuario arcUsuario) {
		this.arcUsuario = arcUsuario;
	}

	public String getUrlImagen() {
		return urlImagen;
	}

	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}

	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getTipoArchivo() {
		return tipoArchivo;
	}

	public void setTipoArchivo(String tipoArchivo) {
		this.tipoArchivo = tipoArchivo;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}
	
}
