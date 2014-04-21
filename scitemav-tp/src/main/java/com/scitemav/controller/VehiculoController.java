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
import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.model.Vehiculo;
import com.scitemav.service.VehiculoService;

@Controller
public class VehiculoController {
	
	@Autowired
	VehiculoService vehiculoService;
	
	@RequestMapping("toRegistroVehiculo")
	public String toRegistroVehiculo(){
		return "registrarVehiculo";
	}
	
	@RequestMapping("toConsultarVehiculo")
	public String toConsultarVehiculo(){
		return "consultarVehiculo";
	}
	
	@RequestMapping("toVehiculoDetalle")
	public String toVehiculoDetalle(){
		return "vehiculoDetalle";
	}
	
	@RequestMapping("toRevisionDetalle")
	public String toRevisionDetalle(){
		return "revisionDetalle";
	}
	
	@RequestMapping(value="registroVehiculo", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroTipoVehiculo(@ModelAttribute("vehiculo") VehiculoBean vehiculo, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(vehiculoService.registro(vehiculo)){
			//model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getVehiculos", method = RequestMethod.POST)
	@ResponseBody
	public List<VehiculoBean> getVehiculos(){		
		return vehiculoService.listarVehiculos();
	}

}
