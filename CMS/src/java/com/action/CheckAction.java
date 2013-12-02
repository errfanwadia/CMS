/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.google.gson.Gson;
import com.model.DatabaseConnect;
import com.model.Feedback;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.model.User;
import java.sql.SQLException;
import java.util.Random;
/**
 *
 * @author ABS
 */
import java.util.Random;
public class CheckAction implements ModelDriven {

    private Feedback f = new Feedback();
    public static java.sql.Date  getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    public static String genActivateLink() throws SQLException {
        System.out.println("Inside Activation link method");
        ResultSet rs = null;
        boolean flag = false;
        String md5 = null;
        //Random rand = new Random(100000);
        do {
            String code = String.valueOf(Math.random());
            System.out.println("Random no is :   " + code);
            try {
                MessageDigest digest = MessageDigest.getInstance("MD5");
                digest.update(code.getBytes(), 0, code.length());
                md5 = new BigInteger(1, digest.digest()).toString(16);
                System.out.println("MD5 :- " + md5);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
            }
            String args[] = new String[1];
            //String args[]=new String[0];
            //ResultSet rs = null;
            DatabaseConnect dc = new DatabaseConnect();
            args[0] = md5;
            String query = " select * from dummy where a like ?";
            //String query = " insert into dummy values('kamal')" ;
            //args[1]="123";

            try {
                rs = dc.getResult(query, args);
                // System.out.println("Records Inserted  : " + c );
                flag = rs.next();
            } catch (Exception ex) {
                System.out.println("Some error during action method");
                //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
            }
        } while (flag);
        return md5;
    }

    public String insert() {
        String md5 = null;
        String name = "123";
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(name.getBytes(), 0, name.length());
            md5 = new BigInteger(1, digest.digest()).toString(16);
            System.out.println("MD5 :- " + md5);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        String args[] = new String[1];
        //String args[]=new String[0];
        //ResultSet rs = null;
        DatabaseConnect dc = new DatabaseConnect();
        args[0] = md5;
        String query = " insert into dummy values(?)";
        //String query = " insert into dummy values('kamal')" ;
        //args[1]="123";

        try {
            int c = dc.manipulateData(query, args);
            System.out.println("Records Inserted  : " + c);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println(usr.getUserID() + usr.getPass());        

        //dc.close();                    
        return "success";
    }

    public String execute() {
        String args[] = new String[0];
        ResultSet rs = null;
        DatabaseConnect dc = new DatabaseConnect();
        //args[0]="201212065";      
        String query = " select ID,role from users";
        //args[1]="123";

        try {
            rs = dc.getResult(query, args);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println(usr.getUserID() + usr.getPass());        
        try {
            while (rs.next()) {
                String role = rs.getString(1);
                System.out.println("Inside Check :  " + role);
            }
            dc.close();
        } catch (Exception e) {
            System.out.println("some error in getting result");
        }
        dc.close();
        return "success";
    }
    

    public String blank()throws Exception
    {
        return "success";
    }
    public String checkJSON() {
        System.out.println("Inside checkJSON method");
        //Feedback f = new Feedback();
        f.setF_id(1);
        f.setC_id("201212065");
        f.setDesc("i like tea");
        Gson gson = new Gson();
        String json = gson.toJson(f);
        return json;
    }

    public String check() throws SQLException {
        String md5 = genActivateLink();
        System.out.println("Generated MD5 String : " + md5);
        return "success";
    }

    @Override
    public Object getModel() {
        return f;
    }
}
