package com.cakeshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.ProductItem;
import com.cakeshop.bean.User;
import com.cakeshop.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="username",required=false) String userName,
			@RequestParam(value="userpwd",required=false) String userPwd,
			Model model,HttpSession session) {
		User u= this.userService.login(userName);
		if( u != null) {
			if(u.getUserpwd().equals(userPwd)) {
				session.setAttribute("loginUser", u);
				return "redirect:index.jsp";
			}else {
				session.setAttribute("loginMsg", "用户密码错误，请重新登录！");
				return "redirect:login.jsp";
			}
		}else {
			session.setAttribute("loginMsg", "您的账号密码不正确请重新登录！");
			return "redirect:login.jsp";
		}
	}

	
	@RequestMapping("/register")
	public String register(User user,HttpServletRequest request) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		user.setUserTime(form.format(date));
		boolean result = userService.register(user);
		if(result) {
			request.setAttribute("registerMsg","用户注册成功，前去登录！");
			return "forward:register.jsp";
		}else {
			request.setAttribute("registerMsg", "用户名已存在！");
			return "forward:register.jsp";
		}
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public void checkUserName(@RequestParam("username") String userName,HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(userService.checkUserName(userName) == null) {
			out.println("用户名可以使用");
		}else {
			out.println("用户名已经使用");
		}
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/addProductToCart")
	public String addProductToCart(@RequestParam("proid") int proid,HttpSession session) {
		String id = String.valueOf(proid);
		Product product = userService.addProductToCart(proid);
		Map<String,ProductItem> cart = (Map<String, ProductItem>) session.getAttribute("cart");
		
		if(cart == null) {
			cart = new HashMap<String,ProductItem>();
		}
		if(cart.containsKey(id)) {
			ProductItem productItem = cart.get(id);
			int count = productItem.getProductItemCount();
			productItem.setProductItemCount(count+1);
		}else {
			ProductItem productItem = new ProductItem();
			productItem.setProduct(product);
			productItem.setProductItemCount(1);
			cart.put(id, productItem);
		}
		session.setAttribute("cart", cart);
		return "redirect:checkout.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/addProduct")
	public String addProduct(@RequestParam("proid") int proid,HttpSession session) {
		String id = String.valueOf(proid);
		Map<String,ProductItem> cart = (Map<String, ProductItem>) session.getAttribute("cart");
		ProductItem productItem = cart.get(id);
		int count = productItem.getProductItemCount();
		productItem.setProductItemCount(count+1);
		return "redirect:checkout.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/removeProduct")
	public String removeProduct(@RequestParam("proid") int proid,HttpSession session) {
		String id = String.valueOf(proid);
		Map<String,ProductItem> cart = (Map<String, ProductItem>) session.getAttribute("cart");
		ProductItem productItem = cart.get(id);
		int count = productItem.getProductItemCount();
		productItem.setProductItemCount(count-1);
		int count2 = productItem.getProductItemCount();
		if(count2 < 1) {
			cart.remove(id);
		}
		return "redirect:checkout.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/emptyCart")
	public String emptyCart(HttpSession session) {
		Map<String,ProductItem> cart = (Map<String, ProductItem>) session.getAttribute("cart");
		cart.clear();
		return "redirect:checkout.jsp";
	}
	
	@RequestMapping("/personal")
	public String viewProsonal(User user,HttpSession session) {
		User u = (User) session.getAttribute("loginUser");		
			session.setAttribute("loginUser", userService.getUserById(u.getUserid()));
			return "redirect:pcenter.jsp";
	}
	
	@RequestMapping("/personalUpdate")
	public String updateProsonal(User user,HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		userService.updateUser(user,loginUser);
		return "redirect:personal.action";
	}
	
	@RequestMapping("/createOrder")
	public String updateUserOrder(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser == null) {
			session.setAttribute("loginMsg", "请您先登录！再去下单！");
			return "redirect:login.jsp";
		}
		if(loginUser.getUserAddress() == null || loginUser.getUserAddress().trim().isEmpty()) {
			session.setAttribute("orderMsg", "请您先设置收货地址！再去下单！");
			return "redirect:personal.action";
		}
		Map<String,ProductItem> cart = (Map<String, ProductItem>) session.getAttribute("cart");
		userService.updateUserOrder(loginUser.getUserid(),cart);
		session.removeAttribute("cart");
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/viewOrder")
	public String viewOrder(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser == null) {
			session.setAttribute("loginMsg", "请您先登录！再去查看订单！");
			return "redirect:login.jsp";
		}
		Set<Order> userOrder = userService.getUserOrder(loginUser.getUserid());
		session.setAttribute("loginUserOrder", userOrder);
		return "redirect:order.jsp";
	}
}
