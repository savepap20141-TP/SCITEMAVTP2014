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

import com.scitemav.bean.VehiculoBean;
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
		return "consultarVehiculos";
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
	public String registroTipoVehiculo(@ModelAttribute("vehiculobean") VehiculoBean vehiculoBean, Model model, HttpServletRequest req){
		String path = "";
		if(vehiculoService.registro(vehiculoBean)){
			//model.addAttribute("msg", "Se registro correctamente");
			model.addAttribute("idvehiculo", vehiculoBean.getIdVehiculo());
			path = "vehiculoDetalle";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarVehiculo";
		}
		return path;
	}
	
	
	@RequestMapping(value = "getVehiculos", method = RequestMethod.POST)
	@ResponseBody
	public List<VehiculoBean> getVehiculos(){		
		return vehiculoService.listarVehiculos();
	}

}
