package com.cakeshop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.bean.Product;
import com.cakeshop.dao.ProductDao;

@Service
@Transactional
public class ProductService {
	@Autowired
	//@Resource
	private ProductDao productDao;
	
	public Product findById(int id){
		return (Product) productDao.findById(id);
	}
	
	public List<Product> findAll(){		
		return this.productDao.findAll();
	}
	
	public List<Product> getAllProducts() {
		return productDao.selectAllProducts();
	}
}
