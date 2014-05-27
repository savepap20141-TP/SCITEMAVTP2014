package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tipovehiculo")
public class TipoVehiculo {

	@Id @GeneratedValue @Column(name = "idtipovehiculo")
	private Integer idTipoVehiculo;
	
	@Column(length = 60, nullable = false)
	private String nombre;
	
	@Column(name = "urlimagen",length = 300, nullable = true)
	private String urlImagen;
	
	@OneToMany(mappedBy ="vehTipoVehiculo")
	private Collection<Vehiculo> tipVehiculos;

	public Integer getIdTipoVehiculo() {
		return idTipoVehiculo;
	}

	public void setIdTipoVehiculo(Integer idTipoVehiculo) {
		this.idTipoVehiculo = idTipoVehiculo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Collection<Vehiculo> getTipVehiculos() {
		return tipVehiculos;
	}

	public void setTipVehiculos(Collection<Vehiculo> tipVehiculos) {
		this.tipVehiculos = tipVehiculos;
	}

	public String getUrlImagen() {
		return urlImagen;
	}

	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
}
