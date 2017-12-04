package com.cakeshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.entitybean.User;

@Repository
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<User> select(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User");
		List<User> list = query.list();
		return list;
	}
	public boolean insert(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		return true;
	}
}
