package com.scitemav.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.PersonaBean;
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
	
	@RequestMapping(value="toVehiculoDetalle-{idvehiculo}", method = RequestMethod.GET)
	public String toVehiculoDetalle(@PathVariable("idvehiculo") Integer idVehiculo, Model model){
		model.addAttribute("idvehiculo", idVehiculo);
		return "vehiculoDetalle";
	}
	
	
	
	@RequestMapping(value="registroVehiculo", method = RequestMethod.POST)
	public String registroTipoVehiculo(@ModelAttribute("vehiculobean") VehiculoBean vehiculoBean, Model model, HttpServletRequest req){
		String path = "";
		if(vehiculoService.registro(vehiculoBean)){
			//model.addAttribute("msg", "Se registro correctamente");
			//model.addAttribute("idvehiculo", vehiculoBean.getIdVehiculo());
			path = "redirect:toVehiculoDetalle-"+vehiculoBean.getIdVehiculo();
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

	@RequestMapping(value = "getInformacionVehiculo-{idvehiculo}", method = RequestMethod.POST)
	@ResponseBody
	public VehiculoBean getVehiculosPorId(@PathVariable("idvehiculo") Integer idVehiculo){		
		return vehiculoService.obtenerInfo(idVehiculo);
	}
	
	@RequestMapping(value = "ajaxEditInformacionVehiculo", method = RequestMethod.POST)
	@ResponseBody
	public VehiculoBean getEditInformationPerfil(@ModelAttribute VehiculoBean vehiculoBean, HttpServletRequest request){
		
		VehiculoBean vehiculoB = new VehiculoBean();
		
		if(vehiculoService.editInformacionVehiculo(vehiculoBean)){
			vehiculoB = vehiculoService.obtenerInfo(vehiculoBean.getIdVehiculo());
		}else{
			vehiculoB = null;
		}
		
		return vehiculoB;
	}
	
	@RequestMapping(value = "getVehiculosCliente-{idcliente}", method = RequestMethod.POST)
	@ResponseBody
	public List<VehiculoBean> getVehiculos(@PathVariable("idcliente") Integer idCliente){		
		return vehiculoService.listarVehiculosCliente(idCliente);
	}
	
}
