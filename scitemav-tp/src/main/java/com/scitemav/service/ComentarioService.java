package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.ComentarioBean;

public interface ComentarioService {

	boolean registro(HttpSession session, ComentarioBean comentarioB, String tipoEntidad, String idEntidad);
	public List<ComentarioBean> listarComentarios(HttpSession session, String tipoEntidad, String idEntidad);
	public boolean editComentario(ComentarioBean cb, HttpServletRequest req);
}
