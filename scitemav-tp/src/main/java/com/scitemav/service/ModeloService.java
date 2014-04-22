package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.ModeloBean;


public interface ModeloService {
	
	boolean registro(ModeloBean modeloBean);
	public List<ModeloBean> listarModelos();

}
