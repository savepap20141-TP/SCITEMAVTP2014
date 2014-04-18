package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tiporepuesto")
public class TipoRepuesto {
	@Id @GeneratedValue @Column(name = "idtiporepuesto")
	private Integer idTipoRepuesto;
	
	@Column(name = "nombre",length = 200, nullable = false)
	private String nombre;
	
	@OneToMany(mappedBy ="repTipoRepuesto")
	private Collection<Repuesto> tipRepuestos;

	public Integer getIdTipoRepuesto() {
		return idTipoRepuesto;
	}

	public void setIdTipoRepuesto(Integer idTipoRepuesto) {
		this.idTipoRepuesto = idTipoRepuesto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Collection<Repuesto> getTipRepuestos() {
		return tipRepuestos;
	}

	public void setTipRepuestos(Collection<Repuesto> tipRepuestos) {
		this.tipRepuestos = tipRepuestos;
	}
}
