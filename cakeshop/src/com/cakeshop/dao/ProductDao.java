package com.cakeshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.bean.Product;

@Repository
public class ProductDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List findAll() {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Product");
		return (List<Product>)query.list();
	}
}
