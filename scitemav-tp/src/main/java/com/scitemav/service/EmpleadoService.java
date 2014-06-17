package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoRevisionBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.bean.RevisionBean;

public interface EmpleadoService {
	
	boolean registro(EmpleadoBean empb);
	public List<EmpleadoBean> listarEmpleados();
	public EmpleadoBean obtenerInfo(int idEmpleado);
	boolean editInformacionEmpleado(EmpleadoBean eb);
	public List<EmpleadoBean> listarEmpleadosRevision(Integer idRevision);
	public List<String> administrarEmpleadosRevision(String[] ids, Integer IdRevision, String[]nroHoras);
	boolean eliminarEmpRev(EmpleadoRevisionBean EmpleadoRevisionB);
	public Boolean getDuplicateEmail2(String email);
	public Boolean getDuplicateDNI2(String dni);
	public void sumarCostoTotal(Integer idRevision);
}
