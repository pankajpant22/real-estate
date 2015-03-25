package com.coolbreeze.realestate.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coolbreeze.realestate.service.MailService;
import com.coolbreeze.realestate.service.UserService;


@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/forgotPassword")
	public String showForgotPassword(){
		return "forgot-password";
	}
	
	@RequestMapping(value="/forgotPassword", method=RequestMethod.POST)
	public String showForgotPassword(HttpServletRequest request,Model model, 
			final RedirectAttributes redirectAttributes){
		String email = request.getParameter("email");
		Random rand = new Random();
		Long number = rand.nextLong();
	    String randomNum = number.toString();
	    boolean result= userService.updateUser(email,randomNum);
	    if(result == false)
	    {
	    	redirectAttributes.addFlashAttribute("message", "No Such Email !!!");
			return "redirect:/forgotPassword.html";
	    }
	    
	    String message = "Your Password is: "+randomNum;
	    
	    mailService.sendMail(email, "Your Login Password", message);
	    
		redirectAttributes.addFlashAttribute("message", "Send Email with Password !!!");
		return "redirect:/forgotPassword.html";
	}
	
}
