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

import com.scitemav.bean.TipoRepuestoBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoRepuesto;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.service.TipoRepuestoService;
import com.scitemav.service.TipoVehiculoService;

@Controller
public class TipoRepuestoController {
	
	@Autowired
	TipoRepuestoService tipoRepuestoService;
	
	@RequestMapping("toRegistroTipoRepuesto")
	public String toRegistroTipoRepuesto(){
		return "registrarTipoRepuesto";
	}
	
	@RequestMapping("toConsultarTipoRepuesto")
	public String toConsultarTipoRepuesto(){
		return "consultarTipoRepuesto";
	}
	
	@RequestMapping(value="registroTipoRepuesto", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroTipoRepuesto(@ModelAttribute("tiporepuesto") TipoRepuesto tr, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(tipoRepuestoService.registro(tr)){
			model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getTipoRepuestos", method = RequestMethod.POST)
	@ResponseBody
	public List<TipoRepuestoBean> getTipoRepuestos(){		
		return tipoRepuestoService.listarTipoRepuestos();
	}

}
