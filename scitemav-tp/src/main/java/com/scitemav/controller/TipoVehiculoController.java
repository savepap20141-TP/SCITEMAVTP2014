package com.scitemav.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.model.TipoVehiculo;
import com.scitemav.service.TipoVehiculoService;

@Controller
public class TipoVehiculoController {

	@Autowired
	TipoVehiculoService tipoVehiculoService;
	
	@RequestMapping(value="registroTipoVehiculo", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroTipoVehiculo(@ModelAttribute("tipovehiculo") TipoVehiculo tipv, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(tipoVehiculoService.registro(tipv)){
			//model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
}
