package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.Vehiculo;


public interface VehiculoService {
	
	boolean registro(Vehiculo vehiculo);
	public List<VehiculoBean> listarVehiculos();

}
