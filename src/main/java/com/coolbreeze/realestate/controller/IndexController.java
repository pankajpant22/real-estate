package com.coolbreeze.realestate.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coolbreeze.realestate.entity.Property;
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
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String searchProperty(HttpServletRequest request,Model model)
	{
		String city = request.getParameter("city");
		String bedno = request.getParameter("bedno");
		String bathno =request.getParameter("bathno");
		String facility =request.getParameter("facility");
		String priceFrom =request.getParameter("priceFrom");
		String priceTo =request.getParameter("priceTo");
		String type =request.getParameter("type");
		
		//String[] splitStr = city.split("\\s+");
		String[] splitStr = city.split(",");
//		int bed = Integer.valueOf(bedno);
//		int bath = Integer.valueOf(bathno);
		
//		String cityString = "'"+splitStr[0]+"'";
//		String typeString = "'"+type+"'";
//		String facilityString = "'"+facility+"'";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("city", splitStr[0]);
		map.put("bedroom", bedno);
		map.put("bathroom", bathno);
		map.put("facility", facility);
		map.put("priceFrom", priceFrom);
		map.put("priceTo", priceTo);
		map.put("type", type);
		
//		StringBuilder builder = new StringBuilder("Select * from Property WHERE ");
//	    Iterator it = map.entrySet().iterator();
//	    while (it.hasNext()) {
//	        Map.Entry pair = (Map.Entry)it.next();
//	        
//	        
//	        if((pair.getValue()).equals(""))
//	        	continue;
//	        if((pair.getValue()).equals("on"))
//	        	continue;
//	        
//	        String q =pair.getKey() + " = " + pair.getValue()+ " AND ";
//	        builder.append(q);
//	    }
//	    
//	    String query = builder.toString();
//	    String queryFinal = query.substring(0,query.length()-4);
//	    
//	    System.out.println(builder.toString());
//	    System.out.println(queryFinal);
	    
	    
		model.addAttribute("propertyList", propertyService.searchPropertyMap(map));
		
		//model.addAttribute("propertyList",propertyService.searchProperty(city,bed,bath,type));
		
		return "search";
	}
	
}
