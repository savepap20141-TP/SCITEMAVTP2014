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
import com.scitemav.bean.ModeloBean;
import com.scitemav.service.ModeloService;

@Controller
public class ModeloController {
	
	@Autowired
	ModeloService modeloService;
	
	@RequestMapping("toRegistroModelo")
	public String toRegistroModelo(){
		return "registrarModelo";
	}	
	
	@RequestMapping("toConsultarModelos")
	public String toConsultarModelos(){
		return "consultarModelos";
	}
	
	@RequestMapping(value="registroModelo", method = RequestMethod.POST)
	public String registroModelo(@ModelAttribute("modelobean") ModeloBean mb, Model model, HttpServletRequest req){
		String path = "";
		if(modeloService.registro(mb)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarModelo";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarModelo";
		}
		return path;
	}
	
	@RequestMapping(value = "getModelos", method = RequestMethod.POST)
	@ResponseBody
	public List<ModeloBean> getModelos(){		
		return modeloService.listarModelos();
	}

}
