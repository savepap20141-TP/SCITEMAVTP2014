package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.EmpleadoBean;

public interface EmpleadoService {
	
	boolean registro(EmpleadoBean empb);
	public List<EmpleadoBean> listarEmpleados();
	public EmpleadoBean obtenerInfo(int idEmpleado);
	boolean editInformacionEmpleado(EmpleadoBean eb);
}
