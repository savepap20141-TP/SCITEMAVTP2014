package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.RevisionBean;


public interface RevisionService {

	public boolean registrarRevision(RevisionBean revision);
	public List<RevisionBean> listarRevisiones();
	
}
