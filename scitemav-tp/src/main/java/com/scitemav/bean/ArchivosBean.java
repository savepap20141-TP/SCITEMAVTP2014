package com.scitemav.bean;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ArchivosBean {
	private CommonsMultipartFile file;
	private List<CommonsMultipartFile> filesb;
	private Integer idAttachment;
	private String nombre;
	private String path;
	private Long size;
	private String fileType;
	
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
	public Integer getIdAttachment() {
		return idAttachment;
	}
	public void setIdAttachment(Integer idAttachment) {
		this.idAttachment = idAttachment;
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
}
