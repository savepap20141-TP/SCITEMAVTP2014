package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Distrito {
	@Id @GeneratedValue @Column(name = "iddistrito")
	private Integer idDistrito;
	
	@Column(length = 60, nullable = false)
	private String nombre;
	
	@OneToMany(mappedBy ="perDistrito")
	private Collection<Persona> disPersonas;

	public Integer getIdDistrito() {
		return idDistrito;
	}

	public void setIdDistrito(Integer idDistrito) {
		this.idDistrito = idDistrito;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Collection<Persona> getDisPersonas() {
		return disPersonas;
	}

	public void setDisPersonas(Collection<Persona> disPersonas) {
		this.disPersonas = disPersonas;
	}


}
