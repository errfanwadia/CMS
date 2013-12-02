/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.File;
import java.sql.Date;

/**
 *
 * @author ABS
 */
public class User {
    
    private String userID;
    private String pass;   
    private String fname;
    private String lname;
    private String type;
    private String card_no;
    private Date verified_date;

    public String getCard_no() {
        return card_no;
    }

    public void setCard_no(String card_no) {
        this.card_no = card_no;
    }

    public Date getVerified_date() {
        return verified_date;
    }

    public void setVerified_date(Date verified_date) {
        this.verified_date = verified_date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    private String email;
    
    public File getPro_pic() {
        return pro_pic;
    }

    public void setPro_pic(File pro_pic) {
        this.pro_pic = pro_pic;
    }

    public String getImgFileName() {
        return imgFileName;
    }

    public void setImgFileName(String imgFileName) {
        this.imgFileName = imgFileName;
    }

    public String getImgContentType() {
        return imgContentType;
    }

    public void setImgContentType(String imgContentType) {
        this.imgContentType = imgContentType;
    }
    private int balance;
    private String cont_no;

    public String getEmail() {
        return email;
    }
    
    private String is_disabled;

    public String getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(String is_disabled) {
        this.is_disabled = is_disabled;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    private File pro_pic;
    private String imgFileName; 
    private String imgContentType;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getCont_no() {
        return cont_no;
    }

    public void setCont_no(String cont_no) {
        this.cont_no = cont_no;
    }
    private String role;
}
