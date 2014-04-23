package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.RepuestoBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Repuesto;
import com.scitemav.model.TipoVehiculo;

public interface RepuestoService {

	boolean registro(RepuestoBean tipv);
	public List<RepuestoBean> listarRepuestos();	
}