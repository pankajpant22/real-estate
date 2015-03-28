package com.coolbreeze.realestate.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;
import com.coolbreeze.realestate.service.PropertyService;
import com.coolbreeze.realestate.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PropertyService propertyService;
	
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
	public String doRegister(HttpServletRequest request,@ModelAttribute("user") User user){
//		if(result.hasErrors())
//		{
//			return "redirect:/register.html?error=true";
//		}
		String role = request.getParameter("role");
		String name = request.getParameter("userName");
		userService.save(user);
		User u = userService.findOne(name);
		int id = u.getUserId();
		System.out.println("Inserting into Role Table Mapping, id: " +id );
		userService.insertIntoRole(id,role);
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
	
	
	@RequestMapping(value = "/account/updateProperty",method=RequestMethod.POST)
	public String updateProperty(HttpServletRequest request ,Model model, Principal principal ){
		String name = principal.getName();
		String idString=request.getParameter("id");
		String sold = request.getParameter("sold");
		int id = Integer.valueOf(idString);
		int s = Integer.valueOf(sold);
		propertyService.updateProperty(id,s);
		return "redirect:/account.html";
	}
	
	@RequestMapping(value="/account",method=RequestMethod.POST)
	public String saveProperty(Model model,
			Principal principal, HttpServletRequest request,final RedirectAttributes redirectAttributes ){
		String username= principal.getName();
		User user = userService.findOne(username);
		int userid = user.getUserId();
		String userId=String.valueOf(userid);
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String description = request.getParameter("description");
		String city = request.getParameter("city");
		String zip = request.getParameter("zip");
		String bed = request.getParameter("bed");
		String bath= request.getParameter("bath");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String type = request.getParameter("type");
		String facility = request.getParameter("facility");
		String price = request.getParameter("price");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("address", address);
		map.put("description", description);
		map.put("city", city);
		map.put("zip", zip);
		map.put("bedroom", bed);
		map.put("bathroom", bath);
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("type", type);
		map.put("facility", facility);
		map.put("price", price);
		map.put("userid", userId);
		
		propertyService.insertProperty(map);
		redirectAttributes.addFlashAttribute("message", "Property Added!!!");
		return "redirect:/account.html";
	}
}
