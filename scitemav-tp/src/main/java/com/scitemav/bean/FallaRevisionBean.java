package com.scitemav.bean;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FallaRevisionBean {

	private Integer idFallaRevision;
	private Integer idFalla;
	private Integer idRevision;
	private Double costoUnitario;
	private String comentario;
	private String urlImagen;
	private CommonsMultipartFile file;
	
	private String descripcion;
	private Integer idTipoFalla;
	private String nombreTipoFalla;
	
	public Integer getIdFallaRevision() {
		return idFallaRevision;
	}
	public void setIdFallaRevision(Integer idFallaRevision) {
		this.idFallaRevision = idFallaRevision;
	}
	public Integer getIdFalla() {
		return idFalla;
	}
	public void setIdFalla(Integer idFalla) {
		this.idFalla = idFalla;
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
	public String getUrlImagen() {
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getIdTipoFalla() {
		return idTipoFalla;
	}
	public void setIdTipoFalla(Integer idTipoFalla) {
		this.idTipoFalla = idTipoFalla;
	}
	public String getNombreTipoFalla() {
		return nombreTipoFalla;
	}
	public void setNombreTipoFalla(String nombreTipoFalla) {
		this.nombreTipoFalla = nombreTipoFalla;
	}
	
}
