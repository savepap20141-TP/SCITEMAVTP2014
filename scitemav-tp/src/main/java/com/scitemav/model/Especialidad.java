package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Especialidad {
	
	@Id @GeneratedValue @Column(name = "idespecialidad")
	private Integer idEspecialidad;
	
	@Column(length = 60, nullable = false)
	private String descripcion;

	@OneToMany(mappedBy ="empEspecialidad")
	private Collection<Empleado> espEmpleados;

	public Integer getIdEspecialidad() {
		return idEspecialidad;
	}

	public void setIdEspecialidad(Integer idEspecialidad) {
		this.idEspecialidad = idEspecialidad;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Collection<Empleado> getEspEmpleados() {
		return espEmpleados;
	}

	public void setEspEmpleados(Collection<Empleado> espEmpleados) {
		this.espEmpleados = espEmpleados;
	}


}
