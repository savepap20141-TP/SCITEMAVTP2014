package com.scitemav.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Cliente {
	
	@Id @GeneratedValue @Column(name = "idcliente")
	private Integer idCliente;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idpersona", nullable = false)
	private Persona cliPersona;
	
	@Column(name = "ruc", length = 11, nullable = true)
	private Integer ruc;
	
	@Column(name = "razonsocial", length = 90, nullable = true)
	private String razonSocial;

	@OneToMany(mappedBy ="vehCliente")
	private Collection<Vehiculo> cliVehiculos;
	
	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public Persona getCliPersona() {
		return cliPersona;
	}

	public void setCliPersona(Persona cliPersona) {
		this.cliPersona = cliPersona;
	}

	public Integer getRuc() {
		return ruc;
	}

	public void setRuc(Integer ruc) {
		this.ruc = ruc;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public Collection<Vehiculo> getCliVehiculos() {
		return cliVehiculos;
	}

	public void setCliVehiculos(Collection<Vehiculo> cliVehiculos) {
		this.cliVehiculos = cliVehiculos;
	}
	
}
