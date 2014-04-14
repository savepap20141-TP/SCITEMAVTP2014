package com.scitemav.service;

import javax.servlet.http.HttpSession;

import com.scitemav.bean.PersonaBean;
import com.scitemav.model.Persona;

public interface PersonaService {
	public PersonaBean getInformationPerfil(HttpSession request);
	public boolean editInformacionPerfil(PersonaBean perbean,HttpSession session);
}
