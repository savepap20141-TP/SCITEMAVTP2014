package com.scitemav.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.DistritoBean;
import com.scitemav.service.DistritoService;

@Controller
public class DistritoController {

	@Autowired
	DistritoService distritoservice;
	
	@RequestMapping(value = "getDistritos", method = RequestMethod.POST)
	@ResponseBody
	public List<DistritoBean> getDistritos(){		
		return distritoservice.listarDistritos();
	}
	
}
