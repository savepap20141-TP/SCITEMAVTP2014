package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scitemav.bean.MarcaBean;
import com.scitemav.model.Marca;

public interface MarcaService {
	
	boolean registro(MarcaBean marcab, HttpServletRequest req);
	public List<MarcaBean> listarMarcas();

}
