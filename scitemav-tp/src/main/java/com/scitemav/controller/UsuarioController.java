package com.scitemav.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.service.UsuarioService;

@Controller
public class UsuarioController {

	@Autowired
	UsuarioService usuarioService;
	
	@RequestMapping(value = "enviarInvitaciones", method = RequestMethod.POST)
	@ResponseBody
	public List<String> toSentInvitatios(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idUsuList = request.getParameter("idUsuarioList").toString().split("_");
		String[] states = request.getParameter("isStateList").toString().split("_");
		String[] isadmin = request.getParameter("isAdminList").toString().split("_");
		String[] sueldo = request.getParameter("isSueldoList").toString().split("_");
		if(idUsuList[0].length() > 0){
			enviados = usuarioService.administrarLogin(idUsuList, states, isadmin, sueldo);
		}
		return enviados;
	}
	
	@RequestMapping(value = "enviarInvitacionesClientes", method = RequestMethod.POST)
	@ResponseBody
	public List<String> toSentInvitatiosCliente(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		List<String> enviados = new ArrayList<String>();
		String[] idUsuList = request.getParameter("idUsuarioList").toString().split("_");
		String[] states = request.getParameter("isStateList").toString().split("_");
		if(idUsuList[0].length() > 0){
			enviados = usuarioService.administrarLoginCliente(idUsuList, states);
		}
		return enviados;
	}
}
