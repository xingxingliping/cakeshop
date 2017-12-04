package com.cakeshop.entitybean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	  @Id
	  private String username;
	  private String email;
	  private String password;
	  
	  public String getName() {
		return username;
	  }
	  public void setName(String username) {
		this.username = username;
	  }
	  public String getEmail()
	  {
	    return this.email;
	  }	  
	  public void setEmail(String email)
	  {
	    this.email = email;
	  }	  
	  public String getPassword()
	  {
	    return this.password;
	  }	  
	  public void setPassword(String password)
	  {
	    this.password = password;
	  }
}
