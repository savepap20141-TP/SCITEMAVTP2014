package com.scitemav.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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

	@Column(name = "administrador", nullable = true)
	private Boolean administrador;
	
	@Column(name = "sueldo", nullable = true)
	private Double sueldo;
	
	@OneToMany(mappedBy ="reeEmpleado")
	private Collection<EmpleadoRevision> empEmpleadoRevisiones;
	
	@OneToMany(mappedBy ="arcEmpleado")
	private Collection<Archivo> empArchivos;
	
	@OneToMany(mappedBy ="comEmpleado")
	private Collection<Comentario> empComentarios;
	
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

	public Boolean getAdministrador() {
		return administrador;
	}

	public void setAdministrador(Boolean administrador) {
		this.administrador = administrador;
	}

	public Collection<EmpleadoRevision> getEmpEmpleadoRevisiones() {
		return empEmpleadoRevisiones;
	}

	public void setEmpEmpleadoRevisiones(Collection<EmpleadoRevision> empEmpleadoRevisiones) {
		this.empEmpleadoRevisiones = empEmpleadoRevisiones;
	}

	public Double getSueldo() {
		return sueldo;
	}

	public void setSueldo(Double sueldo) {
		this.sueldo = sueldo;
	}

	public Collection<Archivo> getEmpArchivos() {
		return empArchivos;
	}

	public void setEmpArchivos(Collection<Archivo> empArchivos) {
		this.empArchivos = empArchivos;
	}

	public Collection<Comentario> getEmpComentarios() {
		return empComentarios;
	}

	public void setEmpComentarios(Collection<Comentario> empComentarios) {
		this.empComentarios = empComentarios;
	}
}
