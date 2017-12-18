package com.cakeshop.x.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.User;
import com.cakeshop.x.bean.Admin;


@Repository
public class AdminDao {
	@Autowired
	private SessionFactory sessionFactory;
	
/*	public Admin selectByAdminName(String adminname) {
		System.out.println(adminname);
		return (Admin) this.sessionFactory.getCurrentSession().createQuery("from Admin a where a.adminname=?").setParameter(0, adminname).uniqueResult();
	}*/

	public List<User> selectAllUsers() {
		return  this.sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	public void deleteUserById(int userid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from User where userid=?").setParameter(0,userid).executeUpdate();
	}

	public User selectUserById(int userid) {
		return (User) this.sessionFactory.getCurrentSession().createQuery("from User where userid=?").setParameter(0, userid).uniqueResult();
		
	}

	public Order selectOrderById(int orderid) {
		return (Order) this.sessionFactory.getCurrentSession().createQuery("from Order where orderid=?").setParameter(0, orderid).uniqueResult();
	}

	public List<Order> showAllOrders() {
		return  this.sessionFactory.getCurrentSession().createQuery("from Order").list();
	}

	public List<Product> showAllProducts() {
		return  this.sessionFactory.getCurrentSession().createQuery("from Product").list();
	}

	public void deleteProductById(int productid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Product where proid=?").setParameter(0,productid).executeUpdate();
	
	}

	public void addProduct(Product product) {
		this.sessionFactory.getCurrentSession().save(product);
	}

	public Product selectProductById(int productid) {
		return (Product) this.sessionFactory.getCurrentSession().createQuery("from Product where proid=?").setParameter(0, productid).uniqueResult();
	
	}

}
