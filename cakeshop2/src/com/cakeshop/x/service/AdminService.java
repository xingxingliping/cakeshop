package com.cakeshop.x.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.cakeshop.bean.Order;
import com.cakeshop.bean.OrderDetail;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.User;
import com.cakeshop.x.bean.Admins;
import com.cakeshop.x.dao.AdminDao;

@Service
@Transactional
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	
	public Admins login(String adminname,String adminpwd) {
		return adminDao.selectByAdminName(adminname);
	}

	public List<User> showAllUsers() {
		return adminDao.selectAllUsers();
	}

	public void deleteUser(int userid) {
		adminDao.deleteUserById(userid);
	}

	public Set<Order> getUserOrderList(int userid) {
		Set<Order> orderSet = adminDao.selectUserById(userid).getOrderSet();
		if(orderSet.isEmpty()) {
			System.out.println(false);
		}else {
			System.out.println(true);
		}
		return orderSet;
	}

	public Set<OrderDetail> getUserOrderDetail(int orderid) {
		Set<OrderDetail> orderDetailSet = adminDao.selectOrderById(orderid).getOrderdetailSet();
		if(orderDetailSet.isEmpty()) {
			System.out.println(false);
		}else {
			System.out.println(true);
		}
		return orderDetailSet;
	}

	public List<Order> getAllOrders() {
		return adminDao.showAllOrders();
	}

	public List<Product> getAllProducts() {
		return adminDao.showAllProducts();
	}

	public void deleteProduct(int productid) {
		adminDao.deleteProductById(productid);
	}

	public void addProduct(Product product) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		product.setProductTime(form.format(date));
		adminDao.addProduct(product);
	}

	public Product getProduct(int productid) {
		return adminDao.selectProductById(productid);
	}

	public Product update(Product product,int pid) {
		Product p = adminDao.selectProductById(pid);
		p.setProname(product.getProname());
		p.setPrice(product.getPrice());
		p.setListimg(product.getListimg());
		return p;
	}
}
