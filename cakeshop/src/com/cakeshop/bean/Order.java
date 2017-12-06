package com.cakeshop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order {
	@Id
	private int orderid;
	private String orderstate;
	private String orderaddress;
	private String ordertime;
	private User user;
	private Set<OrderDetail> orderdetailSet = new HashSet<OrderDetail>();
	
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public String getOrderaddress() {
		return orderaddress;
	}
	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	@ManyToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="USERID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@OneToMany(mappedBy="order", targetEntity=OrderDetail.class, cascade=CascadeType.ALL)
	public Set<OrderDetail> getOrderdetailSet() {
		return orderdetailSet;
	}
	public void setOrderdetailSet(Set<OrderDetail> orderdetailSet) {
		this.orderdetailSet = orderdetailSet;
	}

	
}
