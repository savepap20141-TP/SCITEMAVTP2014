package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.MarcaBean;
import com.scitemav.model.Marca;

public interface MarcaService {
	
	boolean registro(Marca marca);
	public List<MarcaBean> listarMarcas();

}
