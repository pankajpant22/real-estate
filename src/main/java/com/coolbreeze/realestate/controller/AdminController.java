package com.coolbreeze.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coolbreeze.realestate.service.PropertyService;
import com.coolbreeze.realestate.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PropertyService propertyService;
	
	@RequestMapping("/admin")
	public String users(Model model){
		model.addAttribute("propertyList",propertyService.findAll());
		model.addAttribute("userList", userService.findAll());
		return "admin";
	}

	@RequestMapping("/admin/user/delete/{userId}")
	public String deleteUser(Model model,@PathVariable int userId )
	{	
		userService.delete(userId);
		return "redirect:/admin.html";
	}
	
	@RequestMapping("/admin/property/delete/{id}")
	public String deleteProperty(Model model,@PathVariable int id )
	{	
		propertyService.delete(id);
		return "redirect:/admin.html";
	}
	
}
