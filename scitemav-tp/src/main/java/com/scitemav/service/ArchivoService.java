package com.scitemav.service;

import javax.servlet.http.HttpSession;

import com.scitemav.bean.AttachmentBean;


public interface ArchivoService {

	boolean cargarFile(AttachmentBean fileBean, HttpSession session);
}
