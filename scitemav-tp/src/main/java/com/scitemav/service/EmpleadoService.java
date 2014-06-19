package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoRevisionBean;
import com.scitemav.bean.VehiculoBean;

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
	public List<VehiculoBean> getVehiculos(Integer idEmpleado);
	public boolean editarEmpRev(EmpleadoRevisionBean empleadoRevisionB, HttpServletRequest req);
}
