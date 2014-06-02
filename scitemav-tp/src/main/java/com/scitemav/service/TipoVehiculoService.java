package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoVehiculo;

public interface TipoVehiculoService {

	boolean registro(TipoVehiculoBean tipv, HttpServletRequest req);
	public List<TipoVehiculoBean> listarTipoVehiculos();	
	boolean eliminar(TipoVehiculoBean tipv, HttpServletRequest req);
}
