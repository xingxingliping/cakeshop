package com.cakeshop.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cakeshop.bean.Product;
import com.cakeshop.service.ProductService;

@Controller
public class ProductContorller {
	    
	    @Autowired
	    @Qualifier("ProductService")   //这里使用@ualifier注解注入ProductService业务层
	    private ProductService productService;
	    
	    @RequestMapping("/list")  //处理main请求
	    public String list(Model model,HttpServletRequest request){
	        
	        List<Product> list = this.productService.getAll(); //调用业务层方法
	        request.setAttribute("list", list);
	        model.addAttribute(list);//把从数据库取到的数据放入到model中
	        
	        return "list";        
	    }
}
