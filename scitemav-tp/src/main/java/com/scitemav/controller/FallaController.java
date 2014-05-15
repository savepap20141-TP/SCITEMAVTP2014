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

import com.scitemav.bean.FallaBean;
import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.Falla;
import com.scitemav.service.FallaService;

@Controller
public class FallaController {

	@Autowired
	FallaService fallaService;
	
	@RequestMapping("toRegistrarFalla")
	public String toRegistrarFalla(){
		return "registrarFalla";
	}
	
	@RequestMapping("toConsultarFalla")
	public String toConsultarFalla(){
		return "consultarFalla";
	}
	
	@RequestMapping(value="registroFalla", method = RequestMethod.POST)
	@ResponseBody
	public String registroFalla(@ModelAttribute("fallaBean") FallaBean fal, Model model, HttpServletRequest req){
		String path = "";
		
		if(fallaService.registro(fal)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarFalla";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarFalla";
		}
		return path;
	}
	
	@RequestMapping(value = "getFalla", method = RequestMethod.POST)
	@ResponseBody
	public List<FallaBean> getFalla(){		
		return fallaService.listarFallas();
	}
	
}
