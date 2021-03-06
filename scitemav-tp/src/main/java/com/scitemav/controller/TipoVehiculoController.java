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

import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.service.TipoVehiculoService;

@Controller
public class TipoVehiculoController {

	@Autowired
	TipoVehiculoService tipoVehiculoService;
	
	
	@RequestMapping("toRegistroTipoVehiculo")
	public String toRegistroCarroceria(){
		return "registrarTipoVehiculo";
	}	
	@RequestMapping("toConsultarTipoVehiculo")
	public String toConsultarCarroceria(){
		return "consultarTipoVehiculo";
	}
	
	@RequestMapping(value="registroTipoVehiculo", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroTipoVehiculo(@ModelAttribute("tipovehiculo") TipoVehiculoBean tipv, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(tipoVehiculoService.registro(tipv,req)){
			//model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value="eliminarTipoVehiculo", method = RequestMethod.POST)
	@ResponseBody
	public boolean eliminarTipoVehiculo(@ModelAttribute("tipovehiculo") TipoVehiculoBean tipv, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(tipoVehiculoService.eliminar(tipv,req)){
			//model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getTipoVehiculos", method = RequestMethod.POST)
	@ResponseBody
	public List<TipoVehiculoBean> getTipoVehiculos(){		
		return tipoVehiculoService.listarTipoVehiculos();
	}
}
