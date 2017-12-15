package com.cakeshop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	  private int userid;
	  private int userState;
	  private String username;
	  private String useremail;
	  private String userpwd;
	  private String userAddress;
	  private String userTime;
	  private Set<Order> orderSet = new HashSet<Order>();
	  
	  @Id
	  @GeneratedValue(strategy=GenerationType.IDENTITY)  
	  
	  public int getUserid() {
		  return userid;
	  }
	  public void setUserid(int userid) {
		  this.userid = userid;
	  }
	  public String getUsername() {
		  return username;
	  }
	  public void setUsername(String username) {
		  this.username = username;
	  }
	  public String getUseremail() {
		  return useremail;
	  }
	  public void setUseremail(String useremail) {
		  this.useremail = useremail;
	  }
	  public String getUserpwd() {
		  return userpwd;
	  }
	  public void setUserpwd(String userpwd) {
		  this.userpwd = userpwd;
	  }
	
	  @OneToMany(mappedBy="user",targetEntity=Order.class)
	  public Set<Order> getOrderSet() {
		  return orderSet;
	  }
	  public void setOrderSet(Set<Order> orderSet) {
		  this.orderSet = orderSet;
	  }
	  public int getUserState() {
		  return userState;
	  }
	  public void setUserState(int userState) {
		  this.userState = userState;
	  }
	  public String getUserAddress() {
		  return userAddress;
	  }
	  public void setUserAddress(String userAddress) {
		  this.userAddress = userAddress;
	  }
	  public String getUserTime() {
		  return userTime;
	  }
	  public void setUserTime(String userTime) {
		  this.userTime = userTime;
	  }
	 
}
