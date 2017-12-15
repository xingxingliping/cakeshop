package com.cakeshop.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.bean.Product;

@Repository
public class ProductDao {
	@Autowired
	//@Resource
	private SessionFactory sessionFactory;
	
	 public Product findById(int id) {
	    Product p=(Product)this.sessionFactory.getCurrentSession().createQuery("from Product p where p.proid= ?").setParameter(0,id).uniqueResult();
 		return p;
 	 }

	@SuppressWarnings("rawtypes")
	public List<Product> findAll(){
		//@SuppressWarnings("rawtypes")
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Product");
		List<Product> list=query.list();	
		return list;
	}
	
	public List<Product> selectAllProducts() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Product");
		List<Product> productList = query.list();
		return productList;
	}
}
