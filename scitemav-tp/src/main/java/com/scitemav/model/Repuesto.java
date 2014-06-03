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
public class Repuesto {
	@Id @GeneratedValue @Column(name = "idrepuesto")
	private Integer idRepuesto;
	
	@Column(length = 200, nullable = false)
	private String nombre;

	@ManyToOne
	@JoinColumn(name = "idtiporepuesto",nullable = false)
	private TipoRepuesto repTipoRepuesto;

	@OneToMany(mappedBy ="rerRepuesto")
	private Collection<RepuestoRevision> repRepuestoRevisiones;
	
	public Integer getIdRepuesto() {
		return idRepuesto;
	}

	public void setIdRepuesto(Integer idRepuesto) {
		this.idRepuesto = idRepuesto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public TipoRepuesto getRepTipoRepuesto() {
		return repTipoRepuesto;
	}

	public void setRepTipoRepuesto(TipoRepuesto repTipoRepuesto) {
		this.repTipoRepuesto = repTipoRepuesto;
	}

	public Collection<RepuestoRevision> getRepRepuestoRevisiones() {
		return repRepuestoRevisiones;
	}

	public void setRepRepuestoRevisiones(Collection<RepuestoRevision> repRepuestoRevisiones) {
		this.repRepuestoRevisiones = repRepuestoRevisiones;
	}
}
