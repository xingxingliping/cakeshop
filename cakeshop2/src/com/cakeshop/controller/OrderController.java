package com.cakeshop.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cakeshop.bean.OrderDetail;
import com.cakeshop.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/orderDetail")
	public String viewOrderDetail(@RequestParam("orderid") int orderid,HttpSession session) {
		Set<OrderDetail> orderDetailSet = orderService.viewOrderDetail(orderid);
		session.setAttribute("orderDetailSet", orderDetailSet);
		return "redirect:orderDetail.jsp";
	}
	
	@RequestMapping("/cancelOrder")
	public String cancelOrder(@RequestParam("orderid") int orderid,HttpSession session) {
		orderService.cancelOrder(orderid);
		return "redirect:viewOrder.action";
	}
	
	@RequestMapping("/deleteOrder")
	public String deleteOrder(@RequestParam("orderid") int orderid,HttpSession session) {
		orderService.deleteOrder(orderid);
		return "redirect:viewOrder.action";
	}
}
