package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Cargo {
	
	@Id @GeneratedValue @Column(name = "idcargo")
	private Integer idCargo;
	
	@Column(length = 60, nullable = false)
	private String descripcion;

	@OneToMany(mappedBy ="empCargo")
	private Collection<Empleado> carEmpleados;

	public Integer getIdCargo() {
		return idCargo;
	}

	public void setIdCargo(Integer idCargo) {
		this.idCargo = idCargo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Collection<Empleado> getCarEmpleados() {
		return carEmpleados;
	}

	public void setCarEmpleados(Collection<Empleado> carEmpleados) {
		this.carEmpleados = carEmpleados;
	}
}
