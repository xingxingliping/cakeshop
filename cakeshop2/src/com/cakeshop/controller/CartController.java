package com.cakeshop.controller;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cakeshop.bean.ProductItem;
import com.cakeshop.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/piliangdelete")
	public String piliangDelete(@RequestParam("tempString") String  tempString,HttpSession session) {
		String  temp[] = tempString.split(",");
		Map<String,ProductItem> cart = (Map<String, ProductItem>)session.getAttribute("cart");
		Iterator entries = cart.entrySet().iterator();
		
		while(entries.hasNext()) {
			Map.Entry entry = (Map.Entry)entries.next();
			for(int i=0;i<temp.length;i++) {
				String key = (String) entry.getKey();
				if(key.equals(temp[i])) {
					entries.remove();
				}
			}
		}
		return "redirect:checkout.jsp";
	}
}
