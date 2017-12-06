package com.cakeshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.bean.Product;
import com.cakeshop.dao.ProductDao;

@Service("productService")
public class ProductService {

	@Autowired
    private ProductDao productDao; //用AutoWired注入DB层

    @Transactional(readOnly=true) //数据库的读取方式为：只读
    public List<Product> getAll() {
        return(List<Product>)this.productDao.findAll();
    }
}
