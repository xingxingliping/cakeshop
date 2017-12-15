package com.cakeshop.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.OrderDetail;
import com.cakeshop.dao.OrderDao;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderDao orderDao;

	public Set<OrderDetail> viewOrderDetail(int orderid) {
		Order order= orderDao.selectOrderByOrderId(orderid);
		Set<OrderDetail> orderDetailSet = order.getOrderdetailSet();
		if(orderDetailSet.isEmpty()) {
			System.out.println(false);
		}else {
			System.out.println(true);
		}
		return orderDetailSet;
	}
	
	public void deleteOrder(int orderid) {
		orderDao.deleteOrder(orderid);
	}

	public void cancelOrder(int orderid) {
		Order order = orderDao.selectOrderById(orderid);
		order.setOrderstate("已取消");
	}

}
