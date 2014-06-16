package com.scitemav.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "repuestorevision")
public class RepuestoRevision {
	@Id @GeneratedValue @Column(name = "idrepuestorevision")
	private Integer idRepuestoRevision;
	
	@ManyToOne
	@JoinColumn(name = "idrepuesto",nullable = false)
	private Repuesto rerRepuesto;
	
	@ManyToOne
	@JoinColumn(name = "idrevision",nullable = false)
	private Revision rerRevision;
	
	@Column(name = "costounitario", nullable = true)
	private Double costoUnitario;
	
	@Column(length = 1000, nullable = true)
	private String comentario;
	
	@Column(name = "cantidad", nullable = true)
	private Integer cantidad;
	
	@Column(name = "costo", nullable = true)
	private Double costo;

	public Integer getIdRepuestoRevision() {
		return idRepuestoRevision;
	}

	public void setIdRepuestoRevision(Integer idRepuestoRevision) {
		this.idRepuestoRevision = idRepuestoRevision;
	}

	public Repuesto getRerRepuesto() {
		return rerRepuesto;
	}

	public void setRerRepuesto(Repuesto rerRepuesto) {
		this.rerRepuesto = rerRepuesto;
	}

	public Revision getRerRevision() {
		return rerRevision;
	}

	public void setRerRevision(Revision rerRevision) {
		this.rerRevision = rerRevision;
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

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getCosto() {
		return costo;
	}

	public void setCosto(Double costo) {
		this.costo = costo;
	}
}
