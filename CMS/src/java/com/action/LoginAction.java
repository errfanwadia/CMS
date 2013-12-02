/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.action.customer.CustomerAction;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import com.model.DatabaseConnect;
import com.model.PasswordGenerator;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ABS
 */
public class LoginAction extends ActionSupport implements ModelDriven<Object>, SessionAware {

    private User usr = new User();
    private Map<String, Object> session;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    String id;
    public String execute()
    {
        System.out.println("Inside Execute while signup process");
        return "success";
    }
    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
    private static DatabaseConnect dbc = new DatabaseConnect();

    public String home() {
        System.out.println("Inside Home method");
        if(session.get("ID")==null)
        {
            System.out.println("Session are found null");
            return "login";
        }
        else
            System.out.println("Sessions are not null");
        String role = (String) session.get("role");
        usr.setUserID((String) session.get("ID"));        
        usr.setRole(role);
        System.out.println("Role of home : " + role);
        if (role.equals("1")) {
            setBalance(usr.getUserID());
            System.out.println("Found Admin Home in home method");
            //String query ="select bal from balance where user_id like ? ";
            return "adminHome";

        }
        if (role.equals("2")) {
            setBalance(usr.getUserID());
            return "cafeHome";
        }

        if (role.equals("3")) {
            System.out.println("Found CMC Home in home method");
            return "cmcHome";
        }

        if (role.equals("4")) {
            setBalance(usr.getUserID());
            setProfile(usr.getUserID());
            //setProfile(usr.getUserID());
            return "custHome";
        }
        return "login";
    }

    public void setBalance(String ID) {

        System.out.println("Inside set balance method");
        String args[] = new String[1];
        ResultSet rs = null;
        String query = " select bal from balance where user_id like ?";
        args[0] = ID;
        try {
            rs = dbc.getResult(query, args);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (rs.next()) {
                usr.setBalance(rs.getInt(1));
                session.put("balance", rs.getString(1));
                System.out.println("User  : " + ID + " has balance : " + usr.getBalance());
            }
        } catch (Exception e) {
            System.out.println("Error while setting balance");
        }


    }

    public static int getBalance(String ID) {
        int bal=0;
        System.out.println("Inside set balance method");
        String args[] = new String[1];
        ResultSet rs = null;
        String query = " select bal from balance where user_id like ?";
        args[0] = ID;
        try {
            rs = dbc.getResult(query, args);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (rs.next()) {
                bal=rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Erro while setting balance");
        }
        return bal;
    }

    public void setProfile(String ID) {
        System.out.println("Inside set Profile method");
        String args[] = new String[1];
        ResultSet rs = null;
        String query = " select fname,lname,cont_no from profiles where cust_id like ?";
        args[0] = ID;
        try {
            rs = dbc.getResult(query, args);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (rs.next()) {
                usr.setFname(rs.getString(1));
                usr.setLname(rs.getString(2));
                usr.setCont_no(rs.getString(3));
                //session.put("balance",rs.getString(1));
                System.out.println("User's Full name : " + usr.getFname() + usr.getLname());
            }
        } catch (Exception e) {
            System.out.println("Erro while setting balance");
        }
    }

    public String loginCheck() {
        String msg = "success";
        String args[] = new String[2];
        ResultSet rs = null;
        //DatabaseConnection dbc = new DatabaseConnection();
        //Connection conn = dbc.connect();
        String query = "select ID,role,pass from users where ID = ? and pass = ? and status like '2' and is_deleted like '0'";
        args[0] = usr.getUserID();
        args[1] = CustomerAction.getMD5(usr.getPass());
        System.out.println("pass in MD5 : " + args[1]);
        try {
            rs = dbc.getResult(query, args);
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println(usr.getUserID() + usr.getPass());        
        try {
            if (rs.next()) {
                session.put("ID", rs.getString(1));
                session.put("role", rs.getString(2));
                session.put("pass", rs.getString(3));
               // msg = home();
                /*String role = rs.getString(2);
                 usr.setRole(Integer.parseInt(role));
                 dbc.close();
                 System.out.println("Inside Login Check : " + usr.getUserID() + "role   " + role);                
                 if(role.equals("1"))
                 return "adminHome";
                 if(role.equals("2"))
                 return "cafeHome";
                 if(role.equals("3"))
                 return "cmcHome";
                 //if(!((String) sessionAttributes.get("role")).equals("4"))
                 return "custHome";   
                 //return "success";*/
            } else {
                System.out.println("No such record found");
                addActionError("Id or Password Incorrect");
                return "login";
            }
        } catch (Exception e) {
            System.out.println("Error while setting sessions ");
            return "error";
        }
        return msg;
    }

    public String logOut() {
        session.remove("ID");
        addActionMessage("You have Successfully logged out");
        return "success";
    }
    
    Emailer email=new Emailer();
    
    public void setCustomerDetails() {
    }

    public String forgotPass(){
        String args[]=new String[1];
        try {
            args[0]=usr.getUserID();
            String query="select email from profiles where cust_id like ?";
            ResultSet rs=dbc.getResult(query, args);
            if(rs.next()){    
                String e=rs.getString(1);
                
               /* long timeSeed = System.nanoTime();
                double randSeed = Math.random() * 1000;
                long midSeed = (long) (timeSeed * randSeed);
                String s = midSeed + "";
                String subStr = s.substring(0, 6);
                int finalSeed = Integer.parseInt(subStr);
                System.out.println(finalSeed);*/
                PasswordGenerator pg = new PasswordGenerator(8);
                String finalSeed = pg.nextString();
                String args1[]=new String[2];
                args1[0]=CustomerAction.getMD5(String.valueOf(finalSeed));
                args1[1]=args[0];
                query="update users set pass=? where ID like ?";
                int i=dbc.manipulateData(query, args1);
                email.reply("dumbassheep@gmail.com","dumbasdonkey",e,"Forget Password","New Password: "+finalSeed);
             System.out.println("Email sent successfully");
             addActionMessage("Password has been reset and sent to your webmail Account");
             return "success";
            }
            else{
                System.out.println("User Id not found");
                addActionMessage("Invalid User ID");
                return "error";
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
    }
    
    @Override
    public Object getModel() {
        return usr;
    }
}
