package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoVehiculo;

public interface TipoVehiculoService {

	boolean registro(TipoVehiculo tipv);
	public List<TipoVehiculoBean> listarTipoVehiculos();	
}
