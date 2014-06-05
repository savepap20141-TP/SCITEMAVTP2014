package com.scitemav.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scitemav.bean.FallaBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.Falla;
import com.scitemav.model.TipoFalla;

public interface FallaService {
	boolean registro (FallaBean fal) ;
	public List<FallaBean> listarFallas();
	public List<FallaRevisionBean> listarFallasRevision(Integer idRevision);
	public List<String> administrarFallasRevision(String[] ids, Integer IdRevision);
	boolean eliminarFallaRev(FallaRevisionBean fallaRevisionB);
	boolean editarFallaRev(FallaRevisionBean fallaRevisionB, HttpServletRequest req);
	
	
}
