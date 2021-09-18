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
public class Staff implements Serializable{
    private int staffID;
    private String staffEmail,staffPassword,staffFirstName, stafLastName, staffPhoneNum, staffDOB, staffRole;

    public Staff(int staffID, String staffEmail, String staffPassword, String staffFirstName, String stafLastName, String staffPhoneNum, String staffDOB, String staffRole) {
        this.staffID = staffID;
        this.staffEmail = staffEmail;
        this.staffPassword = staffPassword;
        this.staffFirstName = staffFirstName;
        this.stafLastName = stafLastName;
        this.staffPhoneNum = staffPhoneNum;
        this.staffDOB = staffDOB;
        this.staffRole = staffRole;
    }
    
    
    public int getStaffID() {
        return staffID;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public String getStaffFirstName() {
        return staffFirstName;
    }

    public String getStafLastName() {
        return stafLastName;
    }

    public String getStaffPhoneNum() {
        return staffPhoneNum;
    }

    public String getStaffDOB() {
        return staffDOB;
    }

    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public void setStaffFirstName(String staffFirstName) {
        this.staffFirstName = staffFirstName;
    }

    public void setStafLastName(String stafLastName) {
        this.stafLastName = stafLastName;
    }

    public void setStaffPhoneNum(String staffPhoneNum) {
        this.staffPhoneNum = staffPhoneNum;
    }

    public void setStaffDOB(String staffDOB) {
        this.staffDOB = staffDOB;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }
    
}
