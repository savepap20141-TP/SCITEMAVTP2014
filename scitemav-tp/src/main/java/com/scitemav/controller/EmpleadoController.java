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

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.service.EmpleadoService;

@Controller
public class EmpleadoController {

	@Autowired
	EmpleadoService empleadoService;
	
	@RequestMapping("toRegistroEmpleado")
	public String toRegistroEmpleado(){
		return "registrarEmpleado";
	}
	
	@RequestMapping(value="registroEmpleado", method = RequestMethod.POST)
	public String registroEmpleado(@ModelAttribute("empleadobean") EmpleadoBean empb, Model model, HttpServletRequest req){
		String path = "";
		if(empleadoService.registroEmpleado(empb)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarEmpleado";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarEmpleado";
		}
		return path;
	}
	
	@RequestMapping(value = "getEmpleados", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> getEmpleados(){		
		return empleadoService.listarEmpleados();
	}
}
