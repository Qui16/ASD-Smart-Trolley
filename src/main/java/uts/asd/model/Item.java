/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;

/**
 *
 * @author 61451
 */
public class Item {
    private String id;
    private String name;
    private String price;
    private String quantity;
    private String receiveDate;
    private String region;
    private String category;
    private String description;
    
    public Item(String id, String name, String price, String quantity, String receiveDate, String region, String category, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.receiveDate = receiveDate;
        this.region = region;
        this.category = category;
        this.description = description;
    }
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPrice() {
        return price;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }
    
    public String getQuantity() {
        return quantity;
    }
    
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    public String getReceiveDate() {
        return receiveDate;
    }
    
    public void setReceiveDate(String receiveDate) {
        this.receiveDate = receiveDate;
    }
    
    public String getRegion() {
        return region;
    }
    
    public void setRegion(String region) {
        this.region = region;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String descrtiption) {
        this.description = description;
    }
}