package com.cakeshop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cakeshop.bean.Product;
import com.cakeshop.service.ProductService;

@Controller

public class ProductController {
	@Autowired
	//@Resource
	private ProductService productService;
	
	@RequestMapping("/list")
	public String list(Model model,HttpSession session){
		
		List<Product> list=this.productService.findAll();
		session.setAttribute("list", list);
		//model.addAttribute(list);
		return "redirect:prolist.jsp";
	}
	
	@RequestMapping("/content")
	public String findById(@RequestParam(value="proid")int id,Model model,HttpSession session){
		Product pro=this.productService.findById(id);
		session.setAttribute("pro", pro);
		return "redirect:product.jsp";
	}
	
	@RequestMapping("/newProduct")
	public String newProduct(HttpSession session) throws ParseException {
		
		List<Product> productList = productService.getAllProducts();
		ListSortN(productList);
		productList = productList.subList(0, 4);
		session.setAttribute("productList", productList);
		return "redirect:newhot.jsp";
	}
	
    private static void ListSortN(List<Product> list) {  
        Collections.sort(list, new Comparator<Product>() {  
            @Override  
            public int compare(Product o1, Product o2) {  
                SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );
                try {  
                    Date dt1 = format.parse(o1.getProductTime());  
                    Date dt2 = format.parse(o2.getProductTime());  
                    if (dt1.getTime() < dt2.getTime()) {  
                        return 1;  
                    } else if (dt1.getTime() > dt2.getTime()) {  
                        return -1;  
                    } else {  
                        return 0;  
                    }  
                } catch (Exception e) {  
                    e.printStackTrace();  
                }  
                return 0;  
            }  
        });  
    }
    
    @RequestMapping("/hotProduct")
	public String hotProduct(HttpSession session) throws ParseException {
		
		List<Product> productList = productService.getAllProducts();
		ListSortH(productList);
		productList = productList.subList(0, 4);
		session.setAttribute("productList", productList);
		return "redirect:newhot.jsp";
	}
	
    private static void ListSortH(List<Product> list) {  
        Collections.sort(list, new Comparator<Product>() {  
            @Override  
            public int compare(Product p1, Product p2) {  
                try {  
                    if (p1.getBoughtcount() < p2.getBoughtcount()) {  
                        return 1;  
                    } else if (p1.getBoughtcount() > p2.getBoughtcount()) {  
                        return -1;  
                    } else {  
                        return 0;  
                    }  
                } catch (Exception e) {  
                    e.printStackTrace();  
                }  
                return 0;  
            }  
        });  
    }
	
}
