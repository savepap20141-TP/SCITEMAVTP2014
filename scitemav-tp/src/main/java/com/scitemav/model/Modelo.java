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
public class Modelo {
	@Id @GeneratedValue @Column(name = "idmodelo")
	private Integer idModelo;
	
	@Column(length = 60, nullable = false)
	private String nombre;
	
	@ManyToOne
	@JoinColumn(name = "idmarca",nullable = false)
	private Marca modMarca;
	
	@OneToMany(mappedBy ="vehModelo")
	private Collection<Vehiculo> modVehiculos;

	public Integer getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(Integer idModelo) {
		this.idModelo = idModelo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Marca getModMarca() {
		return modMarca;
	}

	public void setModMarca(Marca modMarca) {
		this.modMarca = modMarca;
	}

	public Collection<Vehiculo> getModVehiculos() {
		return modVehiculos;
	}

	public void setModVehiculos(Collection<Vehiculo> modVehiculos) {
		this.modVehiculos = modVehiculos;
	}
}
