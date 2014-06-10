package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.scitemav.bean.AttachmentBean;
import com.scitemav.bean.ArchivosBean;


public interface ArchivoService {

	boolean cargarFile(AttachmentBean fileBean, HttpServletRequest req);
	public List<ArchivosBean> listarArchivos(HttpSession session, String tipoEntidad, String idEntidad);
}
