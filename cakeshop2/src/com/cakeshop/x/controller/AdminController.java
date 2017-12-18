package com.cakeshop.x.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.OrderDetail;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.User;
import com.cakeshop.x.bean.Admin;
import com.cakeshop.x.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	//管理员登录
		@RequestMapping("/admin/login")
		public String adminLogin(@RequestParam("adminname") String adminname,@RequestParam("adminpwd") String adminpwd,HttpSession session) {
	/*		Admin admin = adminService.login(adminname,adminpwd);*/
		/*	session.setAttribute("loginAdmin", admin);*/
			if(adminname.equals("qiqi")&& adminpwd.equals("qiqi")) {
				Admin admin = new Admin();
				admin.setAdminname(adminname);
				admin.setAdminpwd(adminpwd);
				session.setAttribute("loginAdmin", admin);
				return "admin/index";
			}else {
				return "admin/login";
			}
			
		}
		//显示所有用户
		@RequestMapping("/admin/showAllUsers")
		public String showAllUsers(HttpSession session) {
			List<User> userList = adminService.showAllUsers();
			session.removeAttribute("searchuser");
			session.setAttribute("userList", userList);
			return "admin/userlist";
		}
		//删除指定用户
		@RequestMapping("/admin/deleteUser")
		public String deleteUser(@RequestParam("userid") int userid) {
			adminService.deleteUser(userid);
			return "redirect:showAllUsers.action";
		}
		//查看指定用户订单
		@RequestMapping("/admin/showUserOrders")
		public String showUserOrders(@RequestParam("userid") int userid,HttpSession session) {
			Set<Order> userOrders = adminService.getUserOrderList(userid);
			session.setAttribute("showedUserId", userid);
			session.setAttribute("userOrders", userOrders);
			return "admin/userorder";
		}
		//查看指定订单细节
		@RequestMapping("/admin/showUserOrderDetail")
		public String showUserOrderDetail(@RequestParam("orderid") int orderid,HttpSession session) {
			Set<OrderDetail> userOrderDetail = adminService.getUserOrderDetail(orderid); 
			session.setAttribute("userOrderDetail",userOrderDetail);
			return "admin/userorderdetail";
		}
		//查看指定订单细节
		@RequestMapping("/admin/showUserOrderDetail2")
		public String showUserOrderDetail2(@RequestParam("orderid") int orderid,HttpSession session) {
			Set<OrderDetail> userOrderDetail = adminService.getUserOrderDetail(orderid); 
			session.setAttribute("userOrderDetail",userOrderDetail);
			return "admin/userorderdetail2";
		}
		//展示所有用户订单
		@RequestMapping("/admin/showAllOrders")
		public String showAllOrders(HttpSession session) {
			List<Order> orderList = adminService.getAllOrders();
			session.removeAttribute("searchorder");
			session.setAttribute("orderList", orderList);
			return "admin/orders";
		}
		
		//通过id搜索订单
		@RequestMapping("/admin/searchOrder")
		public String searchOrder(@RequestParam("searchorder") int searchorder,HttpSession session) {
			session.setAttribute("searchorder", searchorder);
			return "admin/orders";
		}
		//通过id搜索用户
		@RequestMapping("/admin/searchUser")
		public String searchUser(@RequestParam("searchuser") int searchuser,HttpSession session) {
			session.setAttribute("searchuser", searchuser);
			return "admin/userlist";
		}
		//展示所有商品
		@RequestMapping("/admin/showAllProducts")
		public String showAllProducts(HttpSession session) {
			List<Product> productList = adminService.getAllProducts();
			session.removeAttribute("searchProduct");
			session.setAttribute("productList", productList);
			return "admin/products";
		}
		//通过id搜索商品
		@RequestMapping("/admin/searchProduct")
		public String searchProduct(@RequestParam("searchProduct") int searchProduct,HttpSession session) {
			session.setAttribute("searchProduct",searchProduct);
			return "admin/products";
		}
		//删除指定商品
		@RequestMapping("/admin/deleteProduct")
		public String deleteProduct(@RequestParam("proid") int productid) {
			adminService.deleteProduct(productid);
			return "redirect:showAllProducts.action";
		}
		//添加商品信息
		@RequestMapping("/admin/addProduct")
		public void addproduct(Product product,HttpServletRequest request,@RequestParam("listimg") MultipartFile img) throws IOException {
			String realpath = request.getServletContext().getContextPath();
			String path = request.getServletContext().getRealPath("/addproduct/");
			String imgpath=path+img.getOriginalFilename();
			File img2 = new File(imgpath);
			img.transferTo(img2);
			product.setListimg(realpath+"/addproduct/"+img.getOriginalFilename());
			adminService.addProduct(product);
		}
		//展示被修改商品的信息
		@RequestMapping("/admin/showRevisedProduct")
		public String showRevisedProduct(@RequestParam("proid") int productid,HttpServletRequest request) {
			Product p = adminService.getProduct(productid);
			request.getSession().setAttribute("revisedProductId", productid);
			request.setAttribute("revisedProduct", p);
			return "forward:revisedproduct.jsp";
		}
		//修改指定商品信息
		@RequestMapping("/admin/reviseProduct")
		public String reviseProduct(Product product,HttpServletRequest request,@RequestParam("listimg") MultipartFile img)throws IOException  {
			if(!img.isEmpty()) {
				String realpath = request.getServletContext().getContextPath();
				String path = request.getServletContext().getRealPath("/addproduct/");
				String imgpath=path+img.getOriginalFilename();
				File img2 = new File(imgpath);
				img.transferTo(img2);
				product.setListimg(realpath+"/addproduct/"+img.getOriginalFilename());
			}
			int pid = (int) request.getSession().getAttribute("revisedProductId");
			System.out.println(product.getProname());
			Product p = adminService.update(product,pid);
			request.setAttribute("revisedProduct", p);
			return "forward:revisedproduct.jsp";
		}
}
