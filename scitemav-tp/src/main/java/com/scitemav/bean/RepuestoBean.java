package com.scitemav.bean;

public class RepuestoBean {
	
	//repuesto
	private Integer idRepuesto;	
	private String nombre;	
	//tipo repuesto
	private Integer idTipoRepuesto;
	private String nombreTipoRepuesto;
	//repuesto revision
	private Integer idRepuestoRevision;
	private String comentario;
	private Double costoUnitario;
	//revision
	private Double costoTotal;
	private Integer idRevision;

	public Integer getIdRepuesto() {
		return idRepuesto;
	}


	public void setIdRepuesto(Integer idRepuesto) {
		this.idRepuesto = idRepuesto;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public Integer getIdTipoRepuesto() {
		return idTipoRepuesto;
	}


	public void setIdTipoRepuesto(Integer idTipoRepuesto) {
		this.idTipoRepuesto = idTipoRepuesto;
	}


	public String getNombreTipoRepuesto() {
		return nombreTipoRepuesto;
	}


	public void setNombreTipoRepuesto(String nombreTipoRepuesto) {
		this.nombreTipoRepuesto = nombreTipoRepuesto;
	}


	public String getComentario() {
		return comentario;
	}


	public void setComentario(String comentario) {
		this.comentario = comentario;
	}


	public Double getCostoUnitario() {
		return costoUnitario;
	}


	public void setCostoUnitario(Double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}


	public Integer getIdRevision() {
		return idRevision;
	}


	public void setIdRevision(Integer idRevision) {
		this.idRevision = idRevision;
	}


	public Integer getIdRepuestoRevision() {
		return idRepuestoRevision;
	}


	public void setIdRepuestoRevision(Integer idRepuestoRevision) {
		this.idRepuestoRevision = idRepuestoRevision;
	}

	public Double getCostoTotal() {
		return costoTotal;
	}


	public void setCostoTotal(Double costoTotal) {
		this.costoTotal = costoTotal;
	}



	
}
