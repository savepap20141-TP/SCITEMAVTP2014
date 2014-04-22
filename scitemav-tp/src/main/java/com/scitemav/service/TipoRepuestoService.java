package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.TipoRepuestoBean;
import com.scitemav.model.TipoRepuesto;


public interface TipoRepuestoService {

	boolean registro(TipoRepuesto tr);
	public List<TipoRepuestoBean> listarTipoRepuestos();	
}
