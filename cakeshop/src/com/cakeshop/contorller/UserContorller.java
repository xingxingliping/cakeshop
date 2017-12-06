package com.cakeshop.contorller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cakeshop.bean.User;
import com.cakeshop.service.UserService;

@Controller
public class UserContorller {    
	    @Autowired
	    @Qualifier("userService")
	    private UserService userService; //注意业务层
	    
	    @RequestMapping("/login")  //处理login请求
	    public  ModelAndView login(String username,String password,ModelAndView mv,HttpSession session){
	        
	        User user = userService.login(username, password); //调用业务层方法返回一个实例对象
	        
	        if (user!=null) {  //判断查到的数据是否为空
	            //如果用户不为空，设在Session域中
	            session.setAttribute("user", user);
	            
	            mv.setView(new RedirectView("/BookApp/main")); //重定向到main页面中
	           
	        }else {
	            
	            mv.addObject("message","登录名或者密码错误，请重新输入");
	            
	            mv.setViewName("loginForm"); //重新设置view视图页面
	            	            
	        }
	        
	        return mv; //返回视图
	    }
	    
}
