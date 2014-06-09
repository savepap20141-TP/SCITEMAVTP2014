package com.scitemav.bean;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ArchivosBean {
	private CommonsMultipartFile file;
	private List<CommonsMultipartFile> filesb;
	private Integer idArchivo;
	private String nombre;
	private String path;
	private Long size;
	private String fileType;
	private Integer idEntidad;
	private String tipoEntidad;
	private String descripcion;
	private Timestamp fechaCreacion;
	private String url;
	private String creado;
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public List<CommonsMultipartFile> getFilesb() {
		return filesb;
	}
	public void setFilesb(List<CommonsMultipartFile> filesb) {
		this.filesb = filesb;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Integer getIdArchivo() {
		return idArchivo;
	}
	public void setIdArchivo(Integer idArchivo) {
		this.idArchivo = idArchivo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCreado() {
		return creado;
	}
	public void setCreado(String creado) {
		this.creado = creado;
	}
	public Integer getIdEntidad() {
		return idEntidad;
	}
	public void setIdEntidad(Integer idEntidad) {
		this.idEntidad = idEntidad;
	}
	public String getTipoEntidad() {
		return tipoEntidad;
	}
	public void setTipoEntidad(String tipoEntidad) {
		this.tipoEntidad = tipoEntidad;
	}
}
