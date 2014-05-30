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
import com.scitemav.bean.RevisionBean;
import com.scitemav.service.EmpleadoService;

@Controller
public class EmpleadoController {

	@Autowired
	EmpleadoService empleadoService;
	
	@RequestMapping("toRegistroEmpleado")
	public String toRegistroEmpleado(){
		return "registrarEmpleado";
	}
	
	@RequestMapping("toConsultarEmpleados")
	public String toConsultarEmpleados(){
		return "consultarEmpleados";
	}
	
	@RequestMapping(value="toEmpleadoDetalle-{idempleado}", method = RequestMethod.GET)
	public String toEmpleadoDetalle(@PathVariable("idempleado") Integer idEmpleado, Model model){
		model.addAttribute("idempleado", idEmpleado);
		return "empleadoDetalle";
	}
	
	
	
	@RequestMapping(value="registroEmpleado", method = RequestMethod.POST)
	public String registroEmpleado(@ModelAttribute("empleadobean") EmpleadoBean empb, Model model, HttpServletRequest req){
		String path = "";
		if(empleadoService.registro(empb)){
			//model.addAttribute("msg", "Se registro correctamente");
			path = "redirect:toEmpleadoDetalle-"+empb.getIdEmpleado();
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarEmpleado";
		}
		return path;
	}
	
	@RequestMapping(value = "getEmpleados", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> getEmpleados(){		
		return empleadoService.listarEmpleados();
	}
	
	@RequestMapping(value = "getInformacionEmpleado-{idempleado}", method = RequestMethod.POST)
	@ResponseBody
	public EmpleadoBean getEmpleadosPorId(@PathVariable("idempleado") Integer idEmpleado){		
		return empleadoService.obtenerInfo(idEmpleado);
	}
	
	@RequestMapping(value = "ajaxEditInformacionEmpleado", method = RequestMethod.POST)
	@ResponseBody
	public EmpleadoBean getEditInformationPerfil(@ModelAttribute EmpleadoBean empleadoBean, HttpServletRequest request){
		
		EmpleadoBean empleadoB = new EmpleadoBean();
		
		if(empleadoService.editInformacionEmpleado(empleadoBean)){
			empleadoB = empleadoService.obtenerInfo(empleadoBean.getIdEmpleado());
		}else{
			empleadoB = null;
		}
		
		return empleadoB;
	}
	
	
	@RequestMapping(value = "getEmpleadoRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> getEmpleadoRevision(@PathVariable("idrevision") Integer idRevision){		
		//return null;
		return empleadoService.listarEmpleadosRevision(idRevision);
	} 		
	
	@RequestMapping(value = "asignarEmpleadosRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<String> toSentInvitatios(@PathVariable("idrevision") Integer idRevision, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idUsuList = request.getParameter("idEmpleadoList").toString().split("_");
		String[] states = request.getParameter("isStateList").toString().split("_");
		
		if(idUsuList[0].length() > 0){
			enviados = empleadoService.administrarEmpleadosRevision(idUsuList, idRevision);
		}
		return enviados;
	}
}
