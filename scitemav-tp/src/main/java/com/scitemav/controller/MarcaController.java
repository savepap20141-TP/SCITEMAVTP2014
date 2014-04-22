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

import com.scitemav.bean.MarcaBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Marca;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.service.MarcaService;

@Controller
public class MarcaController {
	
	@Autowired
	MarcaService marcaService;
	
	@RequestMapping("toRegistroMarca")
	public String toRegistroMarca(){
		return "registrarMarca";
	}	
	
	@RequestMapping("toConsultarMarca")
	public String toConsultarMarca(){
		return "consultarMarca";
	}
	
	@RequestMapping(value="registroMarca", method = RequestMethod.POST)
	@ResponseBody
	public boolean registroMarca(@ModelAttribute("marca") Marca marca, Model model, HttpServletRequest req){
		//String path="registrarCarroceria";
		boolean result = false;
		if(marcaService.registro(marca)){
			model.addAttribute("msgOk", "Se ha registrado correctamente");
			result = true;
		}
		else{
			model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value = "getMarcas", method = RequestMethod.POST)
	@ResponseBody
	public List<MarcaBean> getMarcas(){		
		return marcaService.listarMarcas();
	}
	

}
