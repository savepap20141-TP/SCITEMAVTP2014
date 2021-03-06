package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.bean.RepuestoBean;
import com.scitemav.bean.RepuestoRevisionBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Repuesto;
import com.scitemav.model.TipoVehiculo;

public interface RepuestoService {

	boolean registro(RepuestoBean tipv);
	public List<RepuestoBean> listarRepuestos();
	public List<RepuestoBean> listarRepuestosRevision(Integer idRevision);
	public List<String> administrarRepuestosRevision(String[] ids,String[] cantidadR,String[] costoUR, Integer IdRevision);
	boolean eliminarRepuestoRev(RepuestoRevisionBean RepuestoRevisionB);
	boolean editarRepuestoRev(RepuestoRevisionBean repuestoRevisionB, HttpServletRequest req);
}
