package com.scitemav.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "empleadorevision")
public class EmpleadoRevision {
	@Id @GeneratedValue @Column(name = "idempleadorevision")
	private Integer idEmpleadoRevision;
	
	@ManyToOne
	@JoinColumn(name = "idrevision",nullable = false)
	private Revision reeRevision;
	
	@ManyToOne
	@JoinColumn(name = "idempleado",nullable = false)
	private Empleado reeEmpleado;

	public Integer getIdEmpleadoRevision() {
		return idEmpleadoRevision;
	}

	public void setIdEmpleadoRevision(Integer idEmpleadoRevision) {
		this.idEmpleadoRevision = idEmpleadoRevision;
	}

	public Revision getReeRevision() {
		return reeRevision;
	}

	public void setReeRevision(Revision reeRevision) {
		this.reeRevision = reeRevision;
	}

	public Empleado getReeEmpleado() {
		return reeEmpleado;
	}

	public void setReeEmpleado(Empleado reeEmpleado) {
		this.reeEmpleado = reeEmpleado;
	}
	
	
}
