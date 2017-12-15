package com.cakeshop.x.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admins")
public class Admins {
	private int adminid;
	private String adminname;
	private String adminpwd;
	private String adminrealname;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	public String getAdminrealname() {
		return adminrealname;
	}
	public void setAdminrealname(String adminrealname) {
		this.adminrealname = adminrealname;
	}
	
}