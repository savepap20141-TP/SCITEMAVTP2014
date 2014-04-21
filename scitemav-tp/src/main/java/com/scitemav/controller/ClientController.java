package com.scitemav.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scitemav.bean.ClienteBean;
import com.scitemav.service.ClienteService;

@Controller
public class ClientController {

	@Autowired
	ClienteService clienteService;
	
	@RequestMapping(value="registroCliente", method = RequestMethod.POST)
	public String registroCliente(@ModelAttribute("clientebean") ClienteBean clib, Model model, HttpServletRequest req){
		String path = "";
		if(clienteService.registroCliente(clib)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarCliente";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarCliente";
		}
		return path;
	}
}
