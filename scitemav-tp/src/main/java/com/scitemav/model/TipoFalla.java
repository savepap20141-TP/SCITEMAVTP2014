package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tipofalla")
public class TipoFalla {

	@Id @GeneratedValue @Column(name = "idtipofalla")
	private Integer idTipoFalla;
	
	@Column(name = "nombresistema",length = 200, nullable = false)
	private String nombreSistema;
	
	@OneToMany(mappedBy ="falTipoFalla")
	private Collection<Falla> tipFallas;

	public Integer getIdTipoFalla() {
		return idTipoFalla;
	}

	public void setIdTipoFalla(Integer idTipoFalla) {
		this.idTipoFalla = idTipoFalla;
	}

	public String getNombreSistema() {
		return nombreSistema;
	}

	public void setNombreSistema(String nombreSistema) {
		this.nombreSistema = nombreSistema;
	}

	public Collection<Falla> getTipFallas() {
		return tipFallas;
	}

	public void setTipFallas(Collection<Falla> tipFallas) {
		this.tipFallas = tipFallas;
	}
}
