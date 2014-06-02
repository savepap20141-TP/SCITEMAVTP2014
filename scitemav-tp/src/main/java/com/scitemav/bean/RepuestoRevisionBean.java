package com.scitemav.bean;

public class RepuestoRevisionBean {
	
	private Integer idRepuestoRevision;
	private Integer idRepuesto;
	private Integer idRevision;
	private Double costoUnitario;
	private String comentario;
	
	public Integer getIdRepuestoRevision() {
		return idRepuestoRevision;
	}
	public void setIdRepuestoRevision(Integer idRepuestoRevision) {
		this.idRepuestoRevision = idRepuestoRevision;
	}
	public Integer getIdRepuesto() {
		return idRepuesto;
	}
	public void setIdRepuesto(Integer idRepuesto) {
		this.idRepuesto = idRepuesto;
	}
	public Integer getIdRevision() {
		return idRevision;
	}
	public void setIdRevision(Integer idRevision) {
		this.idRevision = idRevision;
	}
	public Double getCostoUnitario() {
		return costoUnitario;
	}
	public void setCostoUnitario(Double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	

}
