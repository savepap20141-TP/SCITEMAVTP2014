package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Marca {
	@Id @GeneratedValue @Column(name = "idmarca")
	private Integer idMarca;
	
	@Column(length = 60, nullable = false)
	private String nombre;
	
	@OneToMany(mappedBy ="vehMarca")
	private Collection<Vehiculo> marVehiculos;

	public Integer getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Collection<Vehiculo> getMarVehiculos() {
		return marVehiculos;
	}

	public void setMarVehiculos(Collection<Vehiculo> marVehiculos) {
		this.marVehiculos = marVehiculos;
	}
}
