package com.scitemav.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "fallarevision")
public class FallaRevision {
	@Id @GeneratedValue @Column(name = "idfallarevision")
	private Integer idFallaRevision;
	
	@ManyToOne
	@JoinColumn(name = "idfalla",nullable = false)
	private Falla farFalla;
	
	@ManyToOne
	@JoinColumn(name = "idrevision",nullable = false)
	private Revision farRevision;
	
	@Column(name = "costounitario", nullable = true)
	private Double costoUnitario;
	
	@Column(length = 1000, nullable = true)
	private String comentario;
	
	@Column(name = "urlimagen",length = 300, nullable = true)
	private String urlImagen;

	public Integer getIdFallaRevision() {
		return idFallaRevision;
	}

	public void setIdFallaRevision(Integer idFallaRevision) {
		this.idFallaRevision = idFallaRevision;
	}

	public Revision getFarRevision() {
		return farRevision;
	}

	public void setFarRevision(Revision farRevision) {
		this.farRevision = farRevision;
	}

	public Double getCostoUnitario() {
		return costoUnitario;
	}

	public void setCostoUnitario(Double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getUrlImagen() {
		return urlImagen;
	}

	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}

	public Falla getFarFalla() {
		return farFalla;
	}

	public void setFarFalla(Falla farFalla) {
		this.farFalla = farFalla;
	}
}
