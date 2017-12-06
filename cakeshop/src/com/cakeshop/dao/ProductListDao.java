package com.cakeshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cakeshop.bean.ProductList;

public class ProductListDao {
	public List<ProductList> findAll(){
		try{
			List<ProductList> list=new ArrayList<ProductList>();
			Connection con=BaseDao.getCon();
			PreparedStatement pstm=con.prepareStatement("select * from producttype");
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				ProductList pl=new ProductList();
				pl.setId(rs.getInt(1));
				pl.setName(rs.getString(2));
				pl.setPrice(rs.getInt(3));
				pl.setSaleprice(rs.getInt(4));
				pl.setListimg(rs.getString(5));
				list.add(pl);
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
