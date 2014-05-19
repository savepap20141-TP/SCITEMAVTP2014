package com.scitemav.bean;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AttachmentBean {
	private List<CommonsMultipartFile> files;

	public List<CommonsMultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	
	private List<ArchivosBean> filesbean;

	public List<ArchivosBean> getFilesbean() {
		return filesbean;
	}

	public void setFilesbean(List<ArchivosBean> filesbean) {
		this.filesbean = filesbean;
	}
}
