package com.coolbreeze.realestate.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coolbreeze.realestate.entity.User;
import com.coolbreeze.realestate.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute("user")
	public User construct(){
		return new User();
	}
	
	
//	@RequestMapping("/users")
//	public String users(Model model){
//		model.addAttribute("userList", userService.findAll());
//		return "users";
//	}

	@RequestMapping("/users/{userId}")
	public String detail(Model model,@PathVariable int userId )
	{
		model.addAttribute("user", userService.findOneWithProperty(userId));
		return "users";
	}
	
	@RequestMapping("/register")
	public String showRegister(){
		return "register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String doRegister(@ModelAttribute("user") User user){
//		if(result.hasErrors())
//		{
//			return "redirect:/register.html?error=true";
//		}
		userService.save(user);
		return "redirect:/register.html?success=true";
	}
	
	@RequestMapping("/account")
	public String account(Model model, Principal principal ){
		String name = principal.getName();
		model.addAttribute("user", userService.findOneWithProperty(name));
		return "users";
	}
	
	@RequestMapping("/register/available")
	@ResponseBody
	public String available(@RequestParam String username){
		Boolean available = userService.findOne(username)== null;
		return available.toString();
	}
	
}
