package com.coolbreeze.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coolbreeze.realestate.service.PropertyService;

@Controller
public class IndexController {

	@Autowired
	private PropertyService propertyService;
	
	@RequestMapping("/index")
	public String index(Model model){
		model.addAttribute("propertyList",propertyService.findAll());
		return ("home");
	}
	
}
