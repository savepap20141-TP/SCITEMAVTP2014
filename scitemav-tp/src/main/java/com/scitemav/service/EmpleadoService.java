package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.EmpleadoBean;

public interface EmpleadoService {
	boolean registroEmpleado(EmpleadoBean empb);
	public List<EmpleadoBean> listarEmpleados();
}
