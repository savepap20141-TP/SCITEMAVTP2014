package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.RevisionBean;
import com.scitemav.bean.VehiculoBean;


public interface RevisionService {

	public boolean registrarRevision(RevisionBean revision);
	public List<RevisionBean> listarRevisiones();
	public RevisionBean obtenerInfo(int idRevision);
	boolean editInformacionRevision(RevisionBean rb);	
	public List<RevisionBean> listarRevisionesVehiculo(Integer idVehiculo);
	public List<String> notificarRevisionesClientes(String[] ids);
}
