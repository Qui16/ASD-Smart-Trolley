/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.asd.model;

/**
 *
 * @author clint
 */
public class Product {
	private int id;
	private String name;
	private Double price;
        private int quantity;
        private String receivedDate;
        private String region;
        private String description;	
	
	public Product() {
	}
	
	public Product(int id, String name, Double price, int quantity, String receivedDate, String region, String description) {
            super();
            this.id = id;
            this.name = name;
            this.price = price;
            this.quantity = quantity;
            this.receivedDate = receivedDate;
            this.region = region;
            this.description = description;
	}

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

	public double getPrice() {
            return price;
	}

	public void setPrice(Double price) {
            this.price = price;
	}

//        public int getQuantity() {
//            return quantity;	
//	}
//
//        public void setQuantity(int quantity) {
//            this.quantity = quantity;
//        }
//
//        public String date() {
//            return receivedDate;
//        }
//
//        public void setDate(String receivedDate) {
//            this.receivedDate = receivedDate;
//        }
//
//        public String region() {
//            return region;
//        }
//
//        public void setRegion(String region) {
//            this region = region;
//        }
//
//        public String description() {
//            return description;
//        }
//
//        public void setDesc(String description) {
//            this description = description;
//        }

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", received date=" + receivedDate + ", region=" + region + ", description=" + description;
	}
	
	
}
