package com.scitemav.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.bean.RepuestoBean;
import com.scitemav.bean.RepuestoRevisionBean;

import com.scitemav.service.RepuestoService;

@Controller
public class RepuestoController {
	
	@Autowired
	RepuestoService repuestoService;
	
	@RequestMapping("toRegistroRepuesto")
	public String toRegistroRepuesto(){
		return "registrarRepuesto";
	}
	
	@RequestMapping("toConsultarRepuesto")
	public String toConsultarRepuesto(){
		return "consultarRepuesto";
	}
	
	@RequestMapping(value="registroRepuesto", method = RequestMethod.POST)
	@ResponseBody
	public Boolean registroRepuesto(@ModelAttribute("repuestobean") RepuestoBean rb, Model model, HttpServletRequest req){
		Boolean path = false;
		if(repuestoService.registro(rb)){
			model.addAttribute("msg", "Se registro correctamente");
			path = true;
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = false;
		}
		return path;
	}
	
	@RequestMapping(value = "getRepuesto", method = RequestMethod.POST)
	@ResponseBody
	public List<RepuestoBean> getRepuesto(){		
		return repuestoService.listarRepuestos();
	}

	@RequestMapping(value = "getRepuestoRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<RepuestoBean> getRepuestoRevision(@PathVariable("idrevision") Integer idRevision){		
		//return null;
		return repuestoService.listarRepuestosRevision(idRevision);
	}
	
	@RequestMapping(value = "asignarRepuestoRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<String> toSentInvitatios(@PathVariable("idrevision") Integer idRevision, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idRepList = request.getParameter("idRepuestoList").toString().split("_");
		String[] cantidadRepList = request.getParameter("cantidadRepuestoList").toString().split("_");
		String[] costoURepList = request.getParameter("costoRepuestoList").toString().split("_");
		if(idRepList[0].length() > 0){
			enviados = repuestoService.administrarRepuestosRevision(idRepList,cantidadRepList,costoURepList, idRevision);
		}
		return enviados;
	}
	
	@RequestMapping(value="eliminarRepuestoRevision", method = RequestMethod.POST)
	@ResponseBody
	public boolean eliminarRepuestoRevision(@ModelAttribute("repuestorevisionbean") RepuestoRevisionBean rrbean, Model model, HttpServletRequest req){
		boolean result = false;
		if(repuestoService.eliminarRepuestoRev(rrbean)){
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value="editarRepuestoRevision", method = RequestMethod.POST)
	@ResponseBody
	public boolean editarRepuestoRevision(@ModelAttribute("repuestorevisionbean") RepuestoRevisionBean rrbean, Model model, HttpServletRequest req){
		boolean result = false;
		if(repuestoService.editarRepuestoRev(rrbean, req)){
			//model.addAttribute("msg", "Se registro correctamente");
			//path = "registrarMarca";
			result = true;
		}else{
			//model.addAttribute("msg", "Fallo al registrarse");
			//path = "registrarMarca";
			result = false;
		}
		return result;
	}
	
	
}
