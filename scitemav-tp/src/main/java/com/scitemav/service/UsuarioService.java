package com.scitemav.service;

import javax.servlet.http.HttpSession;

import com.scitemav.bean.PersonaBean;
import com.scitemav.model.Usuario;

public interface UsuarioService {

	boolean login(Usuario usu, HttpSession session);
	boolean registro(PersonaBean repb);
}
