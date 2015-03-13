package com.coolbreeze.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coolbreeze.realestate.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/admin")
	public String users(Model model){
		model.addAttribute("userList", userService.findAll());
		return "admin";
	}

}
