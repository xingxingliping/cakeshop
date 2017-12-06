package com.cakeshop.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;

public abstract class BaseDao<T,PK extends Serializable> {
	
	private Class<T> entityClass;

	@Resource
	private SessionFactory sessionFactory;
	
	public BaseDao(){
		this.entityClass = null;
		Class c = getClass();
		Type t = c.getGenericSuperclass();
		if (t instanceof ParameterizedType) {
			Type[] p = ((ParameterizedType) t).getActualTypeArguments();
			this.entityClass = (Class<T>) p[0];
		}
	}
	public static Connection getCon(){
		try{
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/my_db?useUnicode=true&characterEncoding=UTF-8","root","");
			return con;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
//**************基本增删改查*********************
	
    public void save(T entity) throws Exception {
		this.sessionFactory.getCurrentSession().save(entity);
	}
	
    public void update(T entity) throws Exception {
		this.sessionFactory.getCurrentSession().update(entity);
	}

	
    public void delete(Object entity) throws Exception {
		this.sessionFactory.getCurrentSession().delete(entity);
	}

    public void delete(Serializable id) throws Exception {
		this.delete(this.sessionFactory.getCurrentSession().load(entityClass,id));
	}
	
    public T get(Serializable id) throws Exception {
		return (T)this.sessionFactory.getCurrentSession().get(entityClass, id);
	}

	
    public T load(Serializable id) throws Exception {
		return (T)this.sessionFactory.getCurrentSession().load(entityClass, id);
	}

}
