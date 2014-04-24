package com.scitemav.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.EspecialidadBean;
import com.scitemav.service.EspecialidadService;

public class EspecialidadController {
	@Autowired
	EspecialidadService especialidadservice;
	
	
	@RequestMapping(value = "getEspecialidades", method = RequestMethod.POST)
	@ResponseBody
	public List<EspecialidadBean> getEspecialidades(){
		List<EspecialidadBean> cb = especialidadservice.listarEspecialidades();
		return cb;
	}
}
