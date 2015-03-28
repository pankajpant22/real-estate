package com.coolbreeze.realestate.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.joda.time.Seconds;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.service.PropertyService;

@Controller
public class IndexController {

	@Autowired
	private PropertyService propertyService;
	
	@RequestMapping("/index")
	public String index(Model model,@RequestParam(value = "page", defaultValue="0", required=false) int page){
		
		List<Property> propertyList = propertyService.findAll(page);
		Iterator<Property> iterator = propertyList.iterator();
		while (iterator.hasNext()) {
			Property prop = (Property) iterator.next();
			
			if(prop.getSold() == 1)
			{
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String current = dateFormat.format(cal.getTime());
				
				Date d1=null;
				Date d2=null;
				
				Date dateSold = prop.getDateSold();
				String date = dateFormat.format(dateSold);
				try {
					d1 = dateFormat.parse(current);
					d2=dateFormat.parse(date);
					DateTime dt1 = new DateTime(d1);
					DateTime dt2 = new DateTime(d2);
					int days = Days.daysBetween(dt1, dt2).getDays();
					//System.out.println(days+"days");
					
					if(days <= -3)
					{
						int id = prop.getId();
						propertyService.deactivate(id);
					}
					
//					System.out.println(Days.daysBetween(dt1, dt2).getDays()+"days");
//					System.out.println(Hours.hoursBetween(dt1, dt2).getHours() %24 +"hours");
//					System.out.println(Minutes.minutesBetween(dt1, dt2).getMinutes() %60 +"Minutes");
//					System.out.println(Seconds.secondsBetween(dt1, dt2).getSeconds() %60 +"Seconds");
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			//if (i.next().getIsbn() == isbn) {

		}
		
		
//		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
//		DateTime dt = new DateTime();
//		
//		System.out.println(dt);
		
		
		model.addAttribute("propertyList",propertyService.findAll(page));
		return ("home");
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String searchProperty(HttpServletRequest request,Model model,
			@RequestParam(value = "page", defaultValue="0", required=false) int page)
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
	    
		List<Property> propertyList = propertyService.searchPropertyMap(map);
		
		model.addAttribute("propertyList", propertyList);
	    
		return "search";
	}
	
}
