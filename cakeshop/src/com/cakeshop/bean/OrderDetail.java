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
	@Id
	private int orderdetailid;
	private int productitemcount;
	private Order order;
	private int productid;
	private String productname;
	private String producttype;
	private String productprice;
	private String productimgurl;
	
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
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProducttype() {
		return producttype;
	}
	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
	public String getProductimgurl() {
		return productimgurl;
	}
	public void setProductimgurl(String productimgurl) {
		this.productimgurl = productimgurl;
	}
	
	
}
