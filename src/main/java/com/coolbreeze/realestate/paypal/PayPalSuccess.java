package com.coolbreeze.realestate.paypal;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

public class PayPalSuccess {
	
	public PayPalResult getPayPal(HttpServletRequest request)
	{
		PayPalResult ppr = new PayPalResult();
		PayPalConfig pc = new PayPalConfig();
		pc = pc.getConfig(request);
		String[] temp = null;
		String res = "";
		try{
			String transId = request.getParameter("tx");
			String authToken = pc.getAuthToken();
			String query = "cmd=_notify-synch&tx=" + transId + "&at="
					+ authToken;
			String url =pc.getPosturl();
			URL u = new URL(url);
			HttpURLConnection req = (HttpURLConnection) u.openConnection();
			req.setRequestMethod("POST");
			req.setDoOutput(true);
			req.setDoInput(true);
			req.setRequestProperty("Content-Type", 
					"application/x-www-form-urlencoded");
			req.setFixedLengthStreamingMode(query.length());
			OutputStream outputStream = req.getOutputStream();
			outputStream.write(query.getBytes());
			outputStream.close();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(
					req.getInputStream()));
			res = in.readLine();
			if(res.equals("SUCCESS")){
				while((res = in.readLine()) != null){
					temp = res.split("=");
					if(temp.length == 1)
						continue;
					temp[1] = URLDecoder.decode(temp[1], "UTF-8");
					if(temp[0].equals("mc_gross")){
						ppr.setMc_gross(temp[1]);
					}
					if(temp[0].equals("protection_eligibility")){
						ppr.setProtection_eligibility(temp[1]);
					}
					if(temp[0].equals("address_status")){
						ppr.setAddress_status(temp[1]);
					}
					if(temp[0].equals("tax")){
						ppr.setTax(temp[1]);
					}
					if(temp[0].equals("payer_id")){
						ppr.setPayer_id(temp[1]);
					}
					if(temp[0].equals("address_street")){
						ppr.setAddress_street(temp[1]);
					}
					if(temp[0].equals("payment_date")){
						ppr.setPayment_date(temp[1]);
					}
					if(temp[0].equals("payment_status")){
						ppr.setPayment_status(temp[1]);
					}
					if(temp[0].equals("charset")){
						ppr.setCharset(temp[1]);
					}
					if(temp[0].equals("address_zip")){
						ppr.setAddress_city(temp[1]);
					}
					if(temp[0].equals("mc_shipping")){
						ppr.setMc_shipping(temp[1]);
					}
					if(temp[0].equals("mc_handling")){
						ppr.setMc_handling(temp[1]);
					}
					if(temp[0].equals("first_name")){
						ppr.setFirst_name(temp[1]);
					}
					if(temp[0].equals("mc_fee")){
						ppr.setMc_fee(temp[1]);
					}
					if(temp[0].equals("address_country_code")){
						ppr.setAddress_country_code(temp[1]);
					}
				}
			}
				in.close();
			}catch (Exception ex){
				System.out.println(ex.getMessage());
				ppr = null;
			}
			return ppr;
		}
		
	}


