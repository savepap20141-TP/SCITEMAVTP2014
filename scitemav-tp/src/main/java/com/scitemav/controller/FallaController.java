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
import com.scitemav.bean.FallaBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.bean.MarcaBean;
import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.Falla;
import com.scitemav.service.FallaService;

@Controller
public class FallaController {

	@Autowired
	FallaService fallaService;
	
	@RequestMapping("toRegistrarFalla")
	public String toRegistrarFalla(){
		return "registrarFalla";
	}
	
	@RequestMapping("toConsultarFalla")
	public String toConsultarFalla(){
		return "consultarFalla";
	}
	
	@RequestMapping(value="registroFalla", method = RequestMethod.POST)
	@ResponseBody
	public Boolean registroFalla(@ModelAttribute("fallaBean") FallaBean fal, Model model, HttpServletRequest req){
		Boolean path = false;		
		if(fallaService.registro(fal)){
			model.addAttribute("msg", "Se registro correctamente");
			path = true;
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = false;
		}
		return path;
	}
	
	@RequestMapping(value = "getFalla", method = RequestMethod.POST)
	@ResponseBody
	public List<FallaBean> getFalla(){		
		return fallaService.listarFallas();
	}
	
	@RequestMapping(value = "getFallaRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<FallaBean> getFallaRevision(@PathVariable("idrevision") Integer idRevision){		
		//return null;
		return fallaService.listarFallasRevision(idRevision);
	}
	
	@RequestMapping(value = "asignarFallasRevision-{idrevision}", method = RequestMethod.POST)
	@ResponseBody
	public List<String> toSentInvitatios(@PathVariable("idrevision") Integer idRevision, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idFallaList = request.getParameter("idFallaList").toString().split("_");
		
		if(idFallaList[0].length() > 0){
			enviados = fallaService.administrarFallasRevision(idFallaList, idRevision);
		}
		return enviados;
	}
	
	@RequestMapping(value="eliminarFallaRevision", method = RequestMethod.POST)
	@ResponseBody
	public boolean eliminarFallaRevision(@ModelAttribute("fallarevisionbean") FallaRevisionBean frbean, Model model, HttpServletRequest req){
		boolean result = false;
		if(fallaService.eliminarFallaRev(frbean)){
			result = true;
		}
		else{
			//model.addAttribute("msg", "Se ha producido un error al registrarse");
			result = false;
		}
		return result;
	}
	
	@RequestMapping(value="editarFallaRevision", method = RequestMethod.POST)
	@ResponseBody
	public boolean editarFallaRevision(@ModelAttribute("fallaRevisionBean") FallaRevisionBean fallaRevisionB, Model model, HttpServletRequest req){
		boolean result = false;
		if(fallaService.editarFallaRev(fallaRevisionB, req)){
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
