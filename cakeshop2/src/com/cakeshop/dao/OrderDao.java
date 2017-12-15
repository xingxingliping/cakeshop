package com.cakeshop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cakeshop.bean.Order;


@Repository
public class OrderDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Order selectOrderByOrderId(int orderid) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Order o where o.orderid="+orderid);
		Order order = (Order) query.uniqueResult();
		return order;
	}
	
	public void deleteOrder(int orderid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Order o where o.orderid=?").setParameter(0, orderid).executeUpdate();
	}

	public Order selectOrderById(int orderid) {
		return (Order) this.sessionFactory.getCurrentSession().createQuery("from Order o where o.orderid=?").setParameter(0, orderid).uniqueResult();
	}
}
