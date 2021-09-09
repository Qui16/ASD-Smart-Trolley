/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;
import java.io.Serializable;
/**
 *
 * @author quyda
 */
public class Customer implements Serializable {
    private int customerID;
    private String customerEmail, customerPassword,customerFName, customerPhoneNum, customerAddress,customerDOB;
    private boolean isStaff, isAdmin;

    public Customer(int customerID, String customerEmail, String customerPassword, String customerFName, String customerPhoneNum, String customerAddress, String customerDOB, boolean isStaff, boolean isAdmin) {
        this.customerID = customerID;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerFName = customerFName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
        this.isStaff = isStaff;
        this.isAdmin = isAdmin;
    }
   public Customer(String customerEmail, String customerPassword, String customerFName, String customerPhoneNum, String customerAddress, String customerDOB) {
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerFName = customerFName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
   }
    public int getCustomerID() {
        return customerID;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public String getCustomerFName() {
        return customerFName;
    }

    public String getCustomerPhoneNum() {
        return customerPhoneNum;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public String getCustomerDOB() {
        return customerDOB;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public void setCustomerFName(String customerFName) {
        this.customerFName = customerFName;
    }

    public void setCustomerPhoneNum(String customerPhoneNum) {
        this.customerPhoneNum = customerPhoneNum;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public void setCustomerDOB(String customerDOB) {
        this.customerDOB = customerDOB;
    }
    
    public boolean isStaff() {
        return isStaff;
    }

    public void setIsStaff(boolean isStaff) {
        this.isStaff = isStaff;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
