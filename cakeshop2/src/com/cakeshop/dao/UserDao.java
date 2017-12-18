package com.cakeshop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory sessionFactory;

	public boolean insert(User user) {
		Session session = sessionFactory.getCurrentSession();
		if(session.createQuery("from User u where u.username = ?").setParameter(0,user.getUsername()).uniqueResult() == null) {
			session.save(user);
			return true;
		}else {
			return false;
		}
	}
	
	public User selectByUserName(String userName) {
		User u = (User)sessionFactory.getCurrentSession().createQuery("from User u where u.username = ?").setParameter(0,userName).uniqueResult();
		return u;
	}
	
	public User selectByUserId(int userId) {
		User u = (User)sessionFactory.getCurrentSession().createQuery("from User u where u.userid = ?").setParameter(0,userId).uniqueResult();
		return u;
	}
	
	public Product selectById(int proid) {
		return (Product)sessionFactory.getCurrentSession().createQuery("from Product p where p.proid = ?").setParameter(0,proid).uniqueResult();	
	}
	
	public void createOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
	}
	
	public User selectByUserByUserEmail(String userEmail) {
		User u = (User)sessionFactory.getCurrentSession().createQuery("from User u where u.useremail = ?").setParameter(0,userEmail).uniqueResult();
		return u;
	}

	public void updateUserEmail(String email,int id) {
		User u = selectByUserId(id);
		u.setUseremail(email);
		this.sessionFactory.getCurrentSession().update(u);
	}
	
}
