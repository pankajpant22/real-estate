package com.coolbreeze.realestate.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;
import com.coolbreeze.realestate.service.PropertyService;
import com.coolbreeze.realestate.service.MailService;
import com.coolbreeze.realestate.service.UserService;

@Controller
public class PropertyController {

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/property/{id}")
	public String detailProperty(Model model,@PathVariable int id )
	{
		Property property = propertyService.find(id);
		User user= property.getUser();
		String name = user.getUserName();
		String sellerName = name.substring(0, 1).toUpperCase() + name.substring(1);
		model.addAttribute("sellerName", sellerName);
		model.addAttribute("property", propertyService.find(id));
		return "property-detail";
	}
	
	
	@RequestMapping("/property/contactAgent/{id}")
	public String contactProperty(Model model,@PathVariable int id, Principal principal )
	{
		String name = principal.getName();
		Property property = propertyService.find(id);
		model.addAttribute("property", propertyService.find(id));
		model.addAttribute("user", userService.findOne(property.getUser()));
		model.addAttribute("name", name);
		return "contact-agent";
	}
	
	@RequestMapping(value="/property/contactAgent/{id}", method=RequestMethod.POST)
	public String contactAgent(HttpServletRequest request, 
			Model model,@PathVariable int id, Principal principal, 
			final RedirectAttributes redirectAttributes){
		String name = principal.getName();
		Property property = propertyService.find(id);
		model.addAttribute("property", propertyService.find(id));
		model.addAttribute("user", userService.findOne(property.getUser()));
		model.addAttribute("name", name);
		String email = request.getParameter("email");
		String seller_email = request.getParameter("seller_email");
		String msg = request.getParameter("msg");
		String username = request.getParameter("username");
		String message="Contact: "+email+" ,Message: "+msg+". User Name: "+username;
		propertyService.addMessage(id,message);
		
		mailService.sendMail(seller_email, "Regarding Your Property", "You received a new"
				+ "Message: "+message+ " , Please Check Your Account");
        
		redirectAttributes.addFlashAttribute("message", "Send Message to Seller !!!");
		return "redirect:/property/contactAgent/{id}.html";
	}
	
	@RequestMapping("/property/update/{id}")
	public String updateProperty(Model model,
			@PathVariable int id, Principal principal )
	{
		String name = principal.getName();
		model.addAttribute("name", name);
		model.addAttribute("property", propertyService.find(id));
		return "property-update";
	}
	
	
	@RequestMapping(value = "/property/update/{id}",method= RequestMethod.POST)
	public String updatePropertySold(HttpServletRequest request,Model model,
			@PathVariable int id, Principal principal,final RedirectAttributes redirectAttributes )
	{
		String name = principal.getName();
		model.addAttribute("name", name);
		String sold = request.getParameter("sold");
		int s = Integer.valueOf(sold);
		String userSold=request.getParameter("userSold");
		
		User user=userService.findOne(userSold);
		int userSoldId = user.getUserId();
		
		String dateSold = request.getParameter("dateSold");
		Date date;
		try {
			date = new SimpleDateFormat("dd-MM-yyyy hh:mm").parse(dateSold);
			String dateString2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			String dateFinal = dateString2.replaceAll("[:\\s-]+", "");
			propertyService.updateProperty(id, s,dateFinal,userSoldId);	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("property", propertyService.find(id));
		redirectAttributes.addFlashAttribute("message", "Property Updated!!!");
		return "redirect:/property/update/{id}.html";
	}
}
