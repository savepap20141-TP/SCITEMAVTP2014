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
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.RevisionBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.service.ClienteService;

@Controller
public class ClientController {

	@Autowired
	ClienteService clienteService;
	
	@RequestMapping("toRegistroCliente")
	public String toRegistroCliente(){
		return "registrarCliente";
	}

	@RequestMapping("toConsultarClientes")
	public String toConsultarClientes(){
		return "consultarClientes";
	}
	
	@RequestMapping(value="toClienteDetalle-{idcliente}" , method = RequestMethod.GET)
	public String toClienteDetalle(@PathVariable("idcliente") Integer idCliente, Model model){
		model.addAttribute("idcliente", idCliente);
		return "clienteDetalle";
	}
	
	@RequestMapping(value="registroCliente", method = RequestMethod.POST)
	public String registroCliente(@ModelAttribute("clientebean") ClienteBean clib, Model model, HttpServletRequest req){
		String path = "";
		if(clienteService.registroCliente(clib)){
			
			path = "redirect:toClienteDetalle-"+clib.getIdCliente();
			
		}else{
			model.addAttribute("msg", "Fallo al registrarse");
			path = "registrarCliente";
		}
		return path;
	}
	
	@RequestMapping(value = "getClientes", method = RequestMethod.POST)
	@ResponseBody
	public List<ClienteBean> getClientes(){		
		return clienteService.listarClientes();
	}
	@RequestMapping(value = "getInformacionCliente-{idcliente}", method = RequestMethod.POST)
	@ResponseBody
	public ClienteBean getClientesPorId(@PathVariable("idcliente") Integer idCliente){		
		return clienteService.obtenerInfo(idCliente);
	}
	
	@RequestMapping(value = "ajaxEditInformacionCliente", method = RequestMethod.POST)
	@ResponseBody
	public ClienteBean getEditInformationPerfil(@ModelAttribute ClienteBean clienteBean, HttpServletRequest request){
		
		ClienteBean clienteB = new ClienteBean();
		
		if(clienteService.editInformacionCliente(clienteBean)){
			clienteB = clienteService.obtenerInfo(clienteBean.getIdCliente());
		}else{
			clienteB = null;
		}
		
		return clienteB;
	}
	
}
