package com.cakeshop.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="orderdetail")
public class OrderDetail {
	private int orderdetailid;
	private int productitemcount;
	private Order order;
	private int proid;
	private String proname;
	private String price;
	private String listimg;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getOrderdetailid() {
		return orderdetailid;
	}
	public void setOrderdetailid(int orderdetailid) {
		this.orderdetailid = orderdetailid;
	}
	public int getProductitemcount() {
		return productitemcount;
	}
	public void setProductitemcount(int productitemcount) {
		this.productitemcount = productitemcount;
	}
	
	@ManyToOne
	@JoinColumn(name="ORDERID")
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getListimg() {
		return listimg;
	}
	public void setListimg(String listimg) {
		this.listimg = listimg;
	}
	
	
	
	
	
}
