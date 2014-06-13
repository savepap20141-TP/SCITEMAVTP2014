package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.Vehiculo;


public interface VehiculoService {
	
	boolean registro(VehiculoBean vb);
	public List<VehiculoBean> listarVehiculos(HttpSession session);
	public VehiculoBean obtenerInfo(int idVehiculo);
	boolean editInformacionVehiculo(VehiculoBean vb, HttpServletRequest req);
	public List<VehiculoBean> listarVehiculosCliente(Integer idCliente);
	public Boolean getDuplicatePlaca(String numPlaca);
}
