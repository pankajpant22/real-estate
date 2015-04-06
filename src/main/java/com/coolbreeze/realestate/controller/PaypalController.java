package com.coolbreeze.realestate.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coolbreeze.realestate.paypal.*;

@Controller
@RequestMapping(value = "/paypal")
public class PaypalController {
	
	@RequestMapping(value = "/success", method= RequestMethod.GET)
	public String success(Model model, HttpServletRequest request){
		PayPalSuccess paypalSuccess = new PayPalSuccess();
		model.addAttribute("result", paypalSuccess.getPayPal(request));
		return "success";
	}

}
