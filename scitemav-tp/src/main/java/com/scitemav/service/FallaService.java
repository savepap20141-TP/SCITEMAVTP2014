package com.scitemav.service;

import java.util.List;
import com.scitemav.bean.FallaBean;
import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.Falla;
import com.scitemav.model.TipoFalla;

public interface FallaService {
	boolean registro (FallaBean fal) ;
	public List<FallaBean> listarFallas();
}
