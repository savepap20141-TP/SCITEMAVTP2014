package com.scitemav.service;
import java.util.List;

import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.TipoFalla;

public interface TipoFallaService {
	boolean registro(TipoFalla tr);
	public List<TipoFallaBean> listarTipoFallas();
}
