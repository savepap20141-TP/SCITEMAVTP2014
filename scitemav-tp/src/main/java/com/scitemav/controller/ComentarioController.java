package com.scitemav.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.ComentarioBean;
import com.scitemav.service.ComentarioService;

@Controller
public class ComentarioController {
	
	@Autowired
	ComentarioService comentarioService;

	@RequestMapping(value="registrarComentario", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroCliente(@ModelAttribute("comentariobean") ComentarioBean comB, HttpServletRequest req){
		boolean result;
		String tipoE, idE;
		tipoE = req.getParameter("tipoEntidadC");
		idE = req.getParameter("idEntidadC");
		if(comentarioService.registro(req.getSession(), comB, tipoE, idE)){			
			result = true;
		}else{
			//model.addAttribute("msg", "Fallo al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getComentarios", method = RequestMethod.POST)
	@ResponseBody
	public List<ComentarioBean> getComentarios(HttpServletRequest req){		
		String tipoE, idE;
		tipoE = req.getParameter("tipoEntidadC");
		idE = req.getParameter("idEntidadC");
		return comentarioService.listarComentarios(req.getSession(), tipoE, idE);
	}
}
