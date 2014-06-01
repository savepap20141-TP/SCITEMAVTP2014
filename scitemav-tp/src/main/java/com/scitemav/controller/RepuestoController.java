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
import com.scitemav.bean.RepuestoBean;

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
	public String registroRepuesto(@ModelAttribute("repuestobean") RepuestoBean rb, Model model, HttpServletRequest req){
		String path = "";
		if(repuestoService.registro(rb)){
			model.addAttribute("msg", "Se registro correctamente");
			path = "registrarRepuesto";
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarRepuesto";
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
		String[] idUsuList = request.getParameter("idRepuestoList").toString().split("_");
		String[] states = request.getParameter("isStateList").toString().split("_");
		
		if(idUsuList[0].length() > 0){
			enviados = repuestoService.administrarRepuestosRevision(idUsuList, idRevision);
		}
		return enviados;
	}
}
