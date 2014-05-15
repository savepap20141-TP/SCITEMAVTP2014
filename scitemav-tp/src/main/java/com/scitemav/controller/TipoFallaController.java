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

import com.scitemav.bean.TipoFallaBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoFalla;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.service.TipoFallaService;
import com.scitemav.service.TipoVehiculoService;

@Controller

public class TipoFallaController {
	@Autowired
	TipoFallaService tipoFallaService;
	
	@RequestMapping("toRegistroTipoFalla")
	public String toRegistroTipoFalla(){
		return "registrarTipoFalla";
	}
	
	@RequestMapping("toConsultarTipoFalla")
	public String toConsultarTipoFalla(){
		return "consultarTipoFalla";
	}
	
	@RequestMapping(value="registroTipoFalla", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroTipoFalla(@ModelAttribute("tipofalla") TipoFalla tr, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(tipoFallaService.registro(tr)){
			model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getTipoFallas", method = RequestMethod.POST)
	@ResponseBody
	public List<TipoFallaBean> getTipoFallas(){		
		return tipoFallaService.listarTipoFallas();
	}
}
