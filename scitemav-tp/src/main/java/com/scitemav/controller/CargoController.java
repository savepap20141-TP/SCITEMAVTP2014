package com.scitemav.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.bean.CargoBean;
import com.scitemav.service.CargoService;

@Controller
public class CargoController {

	@Autowired
	CargoService cargoservice;
	
	
	@RequestMapping(value = "getCargos", method = RequestMethod.POST)
	@ResponseBody
	public List<CargoBean> getCargos(){
		List<CargoBean> cb = cargoservice.listarCargos();
		return cb;
	}
	
}
