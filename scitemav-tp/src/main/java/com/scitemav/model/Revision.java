package com.scitemav.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Revision {
	@Id @GeneratedValue @Column(name = "idrevision")
	private Integer idRevision;
	
	@ManyToOne
	@JoinColumn(name = "idvehiculo",nullable = false)
	private Vehiculo revVehiculo;
	
	@Column(name = "costototal", nullable = true)
	private Double costoTotal;
	
	@Column(name = "fechainicio", nullable = true)
	private Timestamp fechaInicio;
	
	@Column(name = "fechafin", nullable = true)
	private Timestamp fechaFin;
	
	@Column(name = "fechaproxima", nullable = true)
	private Date fechaProxima;
	
	@Column(name = "kilometrajeactual", nullable = false)
	private Integer kilometrajeActual;
	
	@Column(name = "kilometrajeproximo", nullable = false)
	private Integer kilometrajeProximo;

	
	@OneToMany(mappedBy ="farRevision")
	private Collection<FallaRevision> revFallaRevisiones;
	
	@OneToMany(mappedBy ="rerRepuesto")
	private Collection<RepuestoRevision> revRepuestoRevisiones;
	
	public Integer getIdRevision() {
		return idRevision;
	}

	public void setIdRevision(Integer idRevision) {
		this.idRevision = idRevision;
	}

	public Vehiculo getRevVehiculo() {
		return revVehiculo;
	}

	public void setRevVehiculo(Vehiculo revVehiculo) {
		this.revVehiculo = revVehiculo;
	}

	public Double getCostoTotal() {
		return costoTotal;
	}

	public void setCostoTotal(Double costoTotal) {
		this.costoTotal = costoTotal;
	}

	public Timestamp getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Timestamp fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Timestamp getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Timestamp fechaFin) {
		this.fechaFin = fechaFin;
	}

	public Date getFechaProxima() {
		return fechaProxima;
	}

	public void setFechaProxima(Date fechaProxima) {
		this.fechaProxima = fechaProxima;
	}

	public Integer getKilometrajeActual() {
		return kilometrajeActual;
	}

	public void setKilometrajeActual(Integer kilometrajeActual) {
		this.kilometrajeActual = kilometrajeActual;
	}

	public Integer getKilometrajeProximo() {
		return kilometrajeProximo;
	}

	public void setKilometrajeProximo(Integer kilometrajeProximo) {
		this.kilometrajeProximo = kilometrajeProximo;
	}

	public Collection<FallaRevision> getRevFallaRevisiones() {
		return revFallaRevisiones;
	}

	public void setRevFallaRevisiones(Collection<FallaRevision> revFallaRevisiones) {
		this.revFallaRevisiones = revFallaRevisiones;
	}

	public Collection<RepuestoRevision> getRevRepuestoRevisiones() {
		return revRepuestoRevisiones;
	}

	public void setRevRepuestoRevisiones(Collection<RepuestoRevision> revRepuestoRevisiones) {
		this.revRepuestoRevisiones = revRepuestoRevisiones;
	}
	
}
