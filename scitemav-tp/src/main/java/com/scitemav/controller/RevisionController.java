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

import com.scitemav.bean.RevisionBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.service.RevisionService;

@Controller
public class RevisionController {
	
	@Autowired
	RevisionService revisionService;
	
	@RequestMapping("toRegistroRevision")
	public String toRegistroRevision(){
		return "registrarRevision";
	}
	
	@RequestMapping("toConsultarRevision")
	public String toConsultarRevision(){
		return "consultarRevisiones";
	}

	//
	@RequestMapping(value="toConsultarRevision-{estado}", method = RequestMethod.GET)
	public String toConsultarRevision(@PathVariable("estado") String estado, Model model){
		model.addAttribute("estadoR", estado);
		return "consultarRevisiones";
	}
	//
	
	@RequestMapping(value="toRevisionDetalle-{idrevision}" , method = RequestMethod.GET)
	public String toRevisionDetalle(@PathVariable("idrevision") Integer idRevision, Model model){
		model.addAttribute("idrevision", idRevision);
		return "revisionDetalle";
	}
		
	@RequestMapping(value="registroRevision", method = RequestMethod.POST)
	public String registroRevision(@ModelAttribute("revisionbean") RevisionBean rbean, Model model, HttpServletRequest req){
		String path = "";
		if(revisionService.registrarRevision(rbean)){
			//model.addAttribute("msg", "Se registro correctamente");
			path = "redirect:toRevisionDetalle-"+rbean.getIdRevision();
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarRevision";
		}
		return path;
	}
	
	@RequestMapping(value = "getRevisiones-{estado}", method = RequestMethod.POST)
	@ResponseBody
	public List<RevisionBean> getRevisiones(@PathVariable("estado") String estado){
		return revisionService.listarRevisiones(estado);
	}
	
	@RequestMapping(value = "getInformacionRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public RevisionBean getRevisionesPorId(@PathVariable("idrevision") Integer idRevision){		
		return revisionService.obtenerInfo(idRevision);
	}
	
	@RequestMapping(value = "ajaxEditInformacionRevision", method = RequestMethod.POST)
	@ResponseBody
	public RevisionBean getEditInformationPerfil(@ModelAttribute RevisionBean revisionBean, HttpServletRequest request){
		
		RevisionBean revisionB = new RevisionBean();
		
		if(revisionService.editInformacionRevision(revisionBean)){
			revisionB = revisionService.obtenerInfo(revisionBean.getIdRevision());
		}else{
			revisionB = null;
		}
		
		return revisionB;
	}

	@RequestMapping(value = "getRevisionesVehiculos-{idVehiculo}", method = RequestMethod.POST)
	@ResponseBody
	public List<RevisionBean> getRevisiones(@PathVariable("idVehiculo") Integer idVehiculo){
		return revisionService.listarRevisionesVehiculo(idVehiculo);
	}
	
	@RequestMapping(value = "notificarClientes", method = RequestMethod.POST)
	@ResponseBody
	public List<String> notificarClientes(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idRevList = request.getParameter("idRevisionList").toString().split("_");
		
		if(idRevList[0].length() > 0){
			enviados = revisionService.notificarRevisionesClientes(idRevList);
		}
		return enviados;
	}
	
	@RequestMapping(value = "ajaxEditRevisionEstado-{idRevision}-{estado}", method = RequestMethod.POST)
	@ResponseBody
	public Boolean ajaxEditRevision(@PathVariable("idRevision") Integer idRevision,@PathVariable("estado") String estado, HttpServletRequest request){		
		return revisionService.cambiarEstadoRevision(idRevision, estado);
	}
	
	@RequestMapping(value = "ajaxEditProximaRevisionEstado-{idRevision}", method = RequestMethod.POST)
	@ResponseBody
	public Boolean ajaxEditProximaRevisionEstado(@PathVariable("idRevision") Integer idRevision, HttpServletRequest request){		
		return revisionService.cambiarEstadoSiguienteRevision(idRevision);
	}
	
	@RequestMapping(value = "cargarContadorRevisiones", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> cargarContadorRevisiones(HttpServletRequest request, HttpSession session) {		
		return revisionService.cargarContadorRevisiones();
	}
}
