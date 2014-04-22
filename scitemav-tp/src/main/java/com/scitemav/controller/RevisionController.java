package com.scitemav.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.RevisionBean;
import com.scitemav.service.ClienteService;
import com.scitemav.service.RevisionService;

@Controller
public class RevisionController {
	
	@Autowired
	RevisionService revisionService;

	@RequestMapping(value="registroRevision", method = RequestMethod.POST)
	public String registroRevision(@ModelAttribute("revisionbean") RevisionBean rbean, Model model, HttpServletRequest req){
		String path = "";
		if(revisionService.registrarRevision(rbean)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarRevision";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarRevision";
		}
		return path;
	}
	
}
