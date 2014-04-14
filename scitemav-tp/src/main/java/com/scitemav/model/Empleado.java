package com.scitemav.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Empleado {
	
	@Id @GeneratedValue @Column(name = "idempleado")
	private Integer idEmpleado;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idpersona", nullable = false)
	private Persona empPersona;
	
	@ManyToOne
	@JoinColumn(name = "idcargo",nullable = false)
	private Cargo empCargo;
	
	@ManyToOne
	@JoinColumn(name = "idespecialidad")
	private Especialidad empEspecialidad;

	public Integer getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(Integer idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public Persona getEmpPersona() {
		return empPersona;
	}

	public void setEmpPersona(Persona empPersona) {
		this.empPersona = empPersona;
	}

	public Cargo getEmpCargo() {
		return empCargo;
	}

	public void setEmpCargo(Cargo empCargo) {
		this.empCargo = empCargo;
	}

	public Especialidad getEmpEspecialidad() {
		return empEspecialidad;
	}

	public void setEmpEspecialidad(Especialidad empEspecialidad) {
		this.empEspecialidad = empEspecialidad;
	}
}
