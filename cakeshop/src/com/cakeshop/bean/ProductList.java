package com.cakeshop.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="producttype")
public class ProductList {
		@Id
		private int id;
		private String name;
		private int price;
		private int saleprice;
		private String listimg;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getSaleprice() {
			return saleprice;
		}
		public void setSaleprice(int saleprice) {
			this.saleprice = saleprice;
		}
		public String getListimg() {
			return listimg;
		}
		public void setListimg(String listimg) {
			this.listimg = listimg;
		}
}
