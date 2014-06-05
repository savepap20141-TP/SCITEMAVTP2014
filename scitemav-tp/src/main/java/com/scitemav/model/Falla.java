package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Falla {

	@Id @GeneratedValue @Column(name = "idfalla")
	private Integer idFalla;
	
	@Column(length = 200, nullable = false)
	private String descripcion;

	@ManyToOne
	@JoinColumn(name = "idtipofalla",nullable = false)
	private TipoFalla falTipoFalla;

	@Column(name = "nrohoras", nullable = true)
	private Double nroHoras;
	
	@OneToMany(mappedBy ="farFalla")
	private Collection<FallaRevision> falFallaRevisiones;
	
	public Integer getIdFalla() {
		return idFalla;
	}

	public void setIdFalla(Integer idFalla) {
		this.idFalla = idFalla;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public TipoFalla getFalTipoFalla() {
		return falTipoFalla;
	}

	public void setFalTipoFalla(TipoFalla falTipoFalla) {
		this.falTipoFalla = falTipoFalla;
	}

	public Collection<FallaRevision> getFalFallaRevisiones() {
		return falFallaRevisiones;
	}

	public void setFalFallaRevisiones(Collection<FallaRevision> falFallaRevisiones) {
		this.falFallaRevisiones = falFallaRevisiones;
	}

	public Double getNroHoras() {
		return nroHoras;
	}

	public void setNroHoras(Double nroHoras) {
		this.nroHoras = nroHoras;
	}
}
