/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.customer;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.rmi.RemoteException;
import java.util.Map;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.action.CheckAction;
import com.action.Emailer;
import com.model.DatabaseConnect;
import com.model.Transaction;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ABS
 */
public class CustomerAction extends ActionSupport implements ModelDriven, SessionAware {

    User usr = new User();
    String userIDTo;
    String id;
    private int amt;

    public int getAmt() {
        return amt;
    }

    public void setAmt(int amt) {
        this.amt = amt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    DatabaseConnect dbc = new DatabaseConnect();

    public String getUserIDTo() {
        return userIDTo;
    }

    public void setUserIDTo(String userIDTo) {
        this.userIDTo = userIDTo;
    }
    String act = null;

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    String oldpass;
    String newpass;

    public String getOldpass() {
        return oldpass;
    }

    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }
    String sub;
    String desc;
    int amount;
    String pass;

    public String getAct() {
        return act;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setAct(String act) {
        this.act = act;
    }

    @Override
    public Object getModel() {
        return usr;
    }

    public String uploadImage() {
        Connection con = null;
        Statement st = null;
        PreparedStatement ps = null;

        int cnt = 0;
        String msg = "success";
        String query = "update profiles set pro_pic=? where cust_id like '201212065'";
        String URL = "jdbc:mysql://localhost/CMS";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "");
        } catch (Exception ex) {
            System.out.println("Can not connect to database some problem");
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            FileInputStream fis = new FileInputStream(usr.getPro_pic());
            ps = con.prepareStatement(query);
            ps.setBinaryStream(1, fis, (int) usr.getPro_pic().length());
            cnt = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Some error while updating image into database");
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }

        return msg;
    }

    public String registration() {
        System.out.println("Inside Registration method");
        if(usr.getUserID().equals("") || usr.getCont_no().equals("") || usr.getFname().equals("") || usr.getLname().equals("") || usr.getEmail().equals(""))
        {
            addActionMessage("Please provide all the required information");
            return "input";
        }
        Connection con = null;
        Statement st = null;
        PreparedStatement ps = null;
        int cnt = 0;
        String actLink = "";
        String msg = "success";
        String q = "select cust_id from profiles where cust_id like ?";
        String a1[]= new String [1];
        a1[0]=usr.getUserID();
        ResultSet r = dbc.getResult(q, a1);
        try {
            if(r.next())
            {
                System.out.println("User Id already used");
                addActionMessage("User ID already Registered");
                return "error";         
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        String query = "insert into profiles values(?,?,?,?,?,?,?)";
        String URL = "jdbc:mysql://localhost/CMS";
        try {
            actLink = CustomerAction.genActivateLink();
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "");
        } catch (Exception ex) {
            System.out.println("Can not connect to database some problem");
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            FileInputStream fis = new FileInputStream(usr.getPro_pic());
            ps = con.prepareStatement(query);
            ps.setString(1, usr.getUserID());
            ps.setString(2, usr.getFname());
            ps.setString(3, usr.getLname());
            ps.setString(4, actLink);
            ps.setString(5, usr.getCont_no());
            ps.setString(6, usr.getEmail());
            ps.setBinaryStream(7, fis, (int) usr.getPro_pic().length());
            cnt = ps.executeUpdate();
            System.out.println("Record Inserted Successfully into Profile table");

            //Code for inserting into users table
            query = "insert into users value(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, usr.getUserID());
            ps.setString(2, CustomerAction.getMD5(usr.getPass()));
            ps.setString(3, "0");
            ps.setDate(4, new Date(00000000));
            ps.setString(5, actLink);
            ps.setString(6, "1");
            ps.setString(7, "0");
            ps.setString(8, "4");
            cnt = ps.executeUpdate();
            System.out.println("Record also inserted into users table");

            //code for inserting users initial balance as 0 into balance table
            query = "insert into balance values(?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, usr.getUserID());
            ps.setString(2, "0");
            int c = ps.executeUpdate();
            System.out.println("Row successfully inserted into balance table");
            Emailer email = new Emailer();
            //URL url = "http://CMS/activate?act=" + actLink;
            //URL url = new URL("http://CMS/activate?act=" + actLink+");
            URL url = new URL("http://localhost:8080/CMS/verify?act=" + actLink);
            System.out.println(url.toURI());
            String link = "<a href=\"http://CMS/verify?act=";
            link += actLink;
            link += "\" target=\"_blank\">Click Here to activate</a>";
            email.execute("dumbassheep@gmail.com", "dumbasdonkey", usr.getUserID() + "@daiict.ac.in", "Cafeteria Management System", "Your ActivationLink is ", url);
            System.out.println("Email was sent to your registered account");
            addActionMessage("Email has been sent to registered email account for verification");
        } catch (Exception ex) {
            System.out.println("Some error while Registering the user into system");
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            msg = "error";
        }
        return msg;
    }

    public String verify() {
        String msg = "verified";
        System.out.println("Verify method reached");
        System.out.println("Activation Link is  : " + act);
        Connection con = null;
        Statement st = null;
        PreparedStatement ps = null;
        int cnt = 0;
        String query = "update users set status =1,verified_date = ? where act_code like ?";
        String URL = "jdbc:mysql://localhost/CMS";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "");
        } catch (Exception ex) {
            msg = "error";
            System.out.println("Can not connect to database some problem");
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            ps = con.prepareStatement(query);
            ps.setDate(1, CheckAction.getCurrentDate());
            ps.setString(2, act);
            int c = ps.executeUpdate();
            System.out.println("Status updated to registered and email verified");
        } catch (SQLException ex) {
            System.out.println("some error during updation of status using activation code");
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            msg = "error";
        }
        return msg;
    }

    public static String getMD5(String pass) {
        String md5 = null;
        MessageDigest digest = null;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(pass.getBytes(), 0, pass.length());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        md5 = new BigInteger(1, digest.digest()).toString(16);
        return md5;
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

    public String giveFeedback() {
        String msg = "success";
        System.out.println("Inside givefeedback method");
        setUserID();
        id = usr.getUserID();
        System.out.println("By ID " + id);
        System.out.println("Subject : " + sub);
        System.out.println("Description : " + desc);
        String args[] = new String[3];
        args[0] = id;
        args[1] = sub;
        args[2] = desc;
        String query = "insert into feedback (cust_id,sub,descr) values(?,?,?)";

        int c = dbc.manipulateData(query, args);
        System.out.println("Feedback successfully inserted");
        return msg;
    }

    public void setUserID() {
        usr.setUserID((String) session.get("ID"));
    }
    private Map<String, Object> session;

    public String execute() {
        setUserID();
        profile();
        System.out.println("User ID  inside execute : " + usr.getUserID());
        //System.out.println("User ID is : " + (String)session.get("ID"));
        String msg = "success";
        return msg;
    }

    public String checkUser() {
        String args[] = new String[1];
        args[0] = userIDTo;
        String query = "select * from users where ID like ?";
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (!rs.next()) {
                addActionMessage("No Such User Found");
                return "notFound";
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        setUserID();
        profile();
        //System.out.println("User ID is : " + (String)session.get("ID"));
        String msg = "success";
        return msg;
    }
    private static byte[] image = null;
    private InputStream profile_pic = null;

    public static byte[] getImage() {
        return image;
    }

    public static void setImage(byte[] image) {
        CustomerAction.image = image;
    }

    public String findUser() {
        System.out.println("Inside Find User method");
        String args[] = new String[1];
        //args[0]=userIDTo;
        System.out.println("Id received is : " + id);
        //args[0] = "201212065";
        args[0] = id;
        String query = "select fname,lname,pro_pic from profiles where cust_id like ?";
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                usr.setUserID(userIDTo);
                usr.setFname(rs.getString(1));
                usr.setLname(rs.getString(2));
                //usr.setPro_pic((File)rs.getBlob(3));                 
                Blob img = rs.getBlob(3);
                int length = (int) img.length();
                image = img.getBytes(1, length);
                profile_pic = new ByteArrayInputStream(image);
                img.free();
                return "success";
            }
            if (rs.wasNull()) {
                return "notFound";
            }
        } catch (SQLException ex) {
            System.out.println("Some error occured during setting result into user object inside findUser method");
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
    }

    public InputStream getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(InputStream profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String changePass() {
        execute();
        String args[] = new String[2];
        args[0] = usr.getUserID();
        System.out.println(getOldpass());
        args[1] = this.getMD5(getOldpass());
        String query = "select * from users where ID like ? and pass like ?";

        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                String args2[] = new String[2];
                args2[0] = this.getMD5(getNewpass());
                args2[1] = usr.getUserID();
                String q2 = "update users set pass=? where ID like ?";
                int i = dbc.manipulateData(q2, args2);
                if (i == 0) {
                    System.out.println("Update Pass failed");
                    addActionMessage("Update Pass Failed");
                    return "error";
                } else {
                    addActionMessage("Password Changed Successfully !!");
                    return "success";
                }
            } else {
                System.out.println("Wrong OLD password");
                addActionMessage("Invalid OLD Password try again");
                return "error";
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
    }

    public String profile() {
        try {
            this.setUserID();
            String args[] = new String[1];
            args[0] = usr.getUserID();
            System.out.println("Hello" + usr.getUserID());
            String query = "SELECT cust_id, fname, lname, cont_no, email FROM profiles where cust_id like ?";
            ResultSet rs = dbc.getResult(query, args);
            if (rs.next()) {
                usr.setUserID(rs.getString(1));
                usr.setFname(rs.getString(2));
                usr.setLname(rs.getString(3));
                usr.setCont_no(rs.getString(4));
                usr.setEmail(rs.getString(5));
                System.out.println(rs.getString(5));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
    }

    public String updateProfile() {
        String args[] = new String[3];
        //args[0]=usr.getUserID();
        this.setUserID();
        args[0] = usr.getCont_no();
        args[1] = usr.getEmail();
        args[2] = usr.getUserID();
        String query = "update profiles set cont_no=?, email=? where cust_id like ?";

        int r = dbc.manipulateData(query, args);
        if (r == 0) {
            System.out.println("No update2");
            addActionMessage("Update failed");
            return "error";
        } else {
            addActionMessage("Update Successful");
            return "success";
        }
    }

    public String fundTransfer() {
        //findUser();
        //execute();
        System.out.println("Inside fund Transfer");
        this.setUserID();
        System.out.println("USer id From  : " + usr.getUserID());
        System.out.println("Payee's Balance : " + usr.getBalance());
        System.out.println("USer id to  : " + this.getUserIDTo());
        System.out.println("Amount to transfer : " + amt);
        String from = usr.getUserID();
        String to = getUserIDTo();
        int t_amt = amt;
        System.out.println("Transfer Rs. " + t_amt + "  from " + from + "   to " + to);
        //System.out.println("Password received" + usr.getPass());
        String query = "select * from users where ID like ? and pass like ?";
        String args[] = new String[2];
        args[0] = from;
        int bal1 = 0, bal2 = 0;
        try {
            args[1] = getMD5(usr.getPass());
        } catch (Exception e) {;
        }
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {

                // addActionMessage("Correct Password"); 
                String args1[] = new String[0];
                String query1 = "select bal from balance where user_id like " + from;
                ResultSet rs1 = dbc.getResult(query1, args1);
                if (rs1.next()) {
                    bal1 = Integer.parseInt(rs1.getString(1));
                }
                String query2 = "select bal from balance where user_id like " + to;
                ResultSet rs2 = dbc.getResult(query2, args1);
                if (rs2.next()) {
                    bal2 = Integer.parseInt(rs2.getString(1));
                }
                System.out.println("From Balance : " + bal1 + "   To Balance : " + bal2);

                int remaining = bal1 - t_amt;
                //System.out.println("Remaining Balance : " + remaining);
                if (remaining >= 0) {
                    //addActionMessage("Sufficient Balance");    
                    int newBal1 = bal2 + t_amt;
                    System.out.println("Payee's new Balance : " + newBal1);
                    String args3[] = new String[2];
                    args3[1] = to;
                    args3[0] = String.valueOf(newBal1);
                    String query3 = "update balance set bal = ? where user_id like ?";
                    int cnt = dbc.manipulateData(query3, args3);
                    if (cnt == 0) {
                        addActionMessage("Balance Not added to payee");
                    } else {
                        addActionMessage("Balance received to payee");
                    }
                    int newBal2 = bal1 - t_amt;
                    System.out.println("Payee's new Balance : " + newBal2);
                    String args4[] = new String[2];
                    args4[1] = from;
                    args4[0] = String.valueOf(newBal2);
                    String query4 = "update balance set bal = ? where user_id like ?";
                    int cnt1 = dbc.manipulateData(query4, args4);
                    if (cnt1 == 0) {
                        addActionMessage("Balance Not deducted from payer");
                    } else {
                        addActionMessage("Balance deducted from payer");
                    }


                    String args5[] = new String[2];
                    args5[0] = from;
                    args5[1] = to;
                    //args4[2]=CheckAction.getCurrentDate().toString();
                    System.out.println("Transaction Amount : " + t_amt);
                    //        Connection con=dbc.getConnection();

                    String in1 = "INSERT INTO `transactions`(`payer_id`, `payee_id`, `amt`, `type`) VALUES (?,?," + t_amt + ",2)";
                    //      Statement st=con.createStatement();
                    //    int ri1=st.executeUpdate(in1);
                    int ri1 = dbc.manipulateData(in1, args5);
                    if (ri1 == 0) {
                        System.out.println("Transaction insert failed");
                        addActionMessage("Transaction Failed");
                        return "error";
                    } else {
                        System.out.println("Fund transfer successfull");
                        addActionMessage("Transfer Success");
                        return "success";
                    }

                } else {
                    addActionMessage("InSufficient Balance to transfer this much amount");
                }
            } else {
                addActionMessage("Wrong Password");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        /*
         String args0[]=new String[1]; 
         args0[0]=usr.getUserID();
         int bal1=usr.getBalance();
         String q="select * from users where ID like ?";
         ResultSet r=dbc.getResult(q, args0);
         try {
         if(r.next()){
                 
         String args[]=new String[1];
             
         args[0]=usr.getUserID();
         System.out.println(args[0]);
         int bal2 = 0;
             
             
             
         int a1=amt;
             
         System.out.println("yahoo");
         ;
         System.out.println("Balance of Transferring user : " + bal1);             
         String args1[]=new String[1];
         args1[0]=userIDTo;
         if(a1<=bal1){
         String sel2="select bal from balance where user_id like ?";
         ResultSet rs2 = dbc.getResult(sel2,args1);
         if(rs2.next()){
         bal2=rs2.getInt(1);
         System.out.println("Balance of receiving user : " + bal2);
         bal2+=a1;
         System.out.println("Updated Balance of receiving user : " + bal2);
         String args2[]=new String[2];
         args2[0]=String.valueOf(bal2);
         args2[1]=userIDTo;
                              
         String up2="update balance set bal=? where user_id like ?";
         int r2=dbc.manipulateData(up2, args2);
         if(r2==0){
         System.out.println("Receivers Balance not updated");
         addActionMessage("Receivers Balance not updated");
         return "error";
         }
         else{
         System.out.println("Balance of the transfering user : " + bal1);
         bal1-=a1;
         String args3[]=new String[2];
         args3[0] = String.valueOf(bal1);
         args3[1] = usr.getUserID();
         System.out.println("Payee's ID is : " + args3[1]);
         String up1="update balance set bal=? where user_id like ?";
         int r1=dbc.manipulateData(up1, args3);
         if(r1==0){
         System.out.println("Unable to deduct balance from payee");
         addActionMessage("Unable to deduct balance from payee");
         return "error";
         }
         else{
         String args4[]=new String[3];
         args4[0]=usr.getUserID();
         args4[1]=userIDTo;
         //args4[2]=CheckAction.getCurrentDate().toString();
         System.out.println(amt);
         //        Connection con=dbc.getConnection();
                                     
         String in1="INSERT INTO `transactions`(`payer_id`, `payee_id`, `amt`, `type`) VALUES (?,?,"+amt+",2)";
         //      Statement st=con.createStatement();
         //    int ri1=st.executeUpdate(in1);
         int ri1=dbc.manipulateData(in1, args4);
         if(ri1==0){
         System.out.println("Transaction insert failed");
         addActionMessage("Transaction Failed");
         return "error";
         }
         else{
         System.out.println("Fund transfer successfull");
         addActionMessage("Transfer Success");
         return "success";
         }
         }
         }
         }
         else{
         System.out.println("No record found");
         return "error";
         }
                          
                          
         }
         else{
         System.out.println("Insufficient balance");
         return "error";
         }                                    
         }
         else{
         addActionMessage("Password wrong");
         System.out.println("Wrong Password");
         return "error";
         }
         } catch (SQLException ex) {
         System.out.println("SQL Exception");
         Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
         }*/
        return "success";
    }
    
    public String history() {
        String msg="success";
        String args[] = new String[1];
        this.setUserID();
        args[0]=usr.getUserID();        
        String query = "SELECT t_id,payer_id,payee_id,amt,type,is_rollbacked,time FROM transactions where payer_id like ? and type in (0,4)";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                String payee=rs.getString(3);
                if(payee.equals(usr.getUserID())==true)
                    payee="self";
                t.setPayee_id(payee);
                System.out.println(t.getPayee_id().toString());
                t.setTot_amt(rs.getInt(4));
                String type = null;
                String payer = rs.getString(2);   
                String is_roll = rs.getString(6);
                if(is_roll.equals("1"))
                {
                    type="Rollbacked Purchase";
                }                
                else
                {
                    type="Purchase";
                }
                t.setType(type);
                t.setTime(rs.getTimestamp(7));
               
                
                /*String r = rs.getString(4);
                 System.out.println("user ID : "+ usr.getUserID() +"  Role is : " +r);
                 String role="";
                 if(r.equals("2"));
                 role="Cafe";
                 if(r.equals("CMC"))
                 role=r;
                 if(r.equals("4"))
                 role="Customer";
                 usr.setRole(role);*/
                System.out.println(t.toString());
                tran.add(t);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return msg;
    }

    
        public String rechargeHistory() {
        String msg="success";
        String args[] = new String[1];
        this.setUserID();
        args[0]=usr.getUserID();        
        String query = "SELECT t_id,payer_id,payee_id,amt,type,time FROM transactions where payee_id like ? and type like '1'";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                String payee=rs.getString(3);
                if(payee.equals(usr.getUserID())==true)
                    payee="self";
                t.setPayee_id(payee);
                System.out.println(t.getPayee_id().toString());
                t.setTot_amt(rs.getInt(4));
                String type = null;
                String payer = rs.getString(2);                
                if(rs.getString(5).equals("0")){
                    type="Purchase";
                }
                else if(rs.getString(5).equals("1")){
                    type="Recharge";
                }
                else if(rs.getString(5).equals("2")){
                    type="Transfered";
                }
                else if(rs.getString(5).equals("3")){
                    type="Amount Withdrawal";
                }
                t.setType(type);
                t.setTime(rs.getTimestamp(6));
               
                
                /*String r = rs.getString(4);
                 System.out.println("user ID : "+ usr.getUserID() +"  Role is : " +r);
                 String role="";
                 if(r.equals("2"));
                 role="Cafe";
                 if(r.equals("CMC"))
                 role=r;
                 if(r.equals("4"))
                 role="Customer";
                 usr.setRole(role);*/
                System.out.println(t.toString());
                tran.add(t);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return msg;
    }
        
        
     public String transferHistory() {
        String msg="success";
        String args[] = new String[1];
        this.setUserID();
        args[0]=usr.getUserID();        
        String query = "SELECT t_id,payer_id,payee_id,amt,type,time FROM transactions where payer_id like ? and type like '2'";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                String payee=rs.getString(3);
                if(payee.equals(usr.getUserID())==true)
                    payee="self";
                t.setPayee_id(payee);
                System.out.println(t.getPayee_id().toString());
                t.setTot_amt(rs.getInt(4));
                String type = null;
                String payer = rs.getString(2);                
                if(rs.getString(5).equals("0")){
                    type="Purchase";
                }
                else if(rs.getString(5).equals("1")){
                    type="Recharge";
                }
                else if(rs.getString(5).equals("2")){
                    type="Transfered";
                }
                else if(rs.getString(5).equals("3")){
                    type="Amount Withdrawal";
                }
                t.setType(type);
                t.setTime(rs.getTimestamp(6));
               
                
                /*String r = rs.getString(4);
                 System.out.println("user ID : "+ usr.getUserID() +"  Role is : " +r);
                 String role="";
                 if(r.equals("2"));
                 role="Cafe";
                 if(r.equals("CMC"))
                 role=r;
                 if(r.equals("4"))
                 role="Customer";
                 usr.setRole(role);*/
                System.out.println(t.toString());
                tran.add(t);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return msg;
    }    

    
    ArrayList<Transaction> tran=new ArrayList();
    
    public ArrayList<Transaction> getTran() {
        return tran;
    }

    public void setTran(ArrayList<Transaction> tran) {
        this.tran = tran;
    }
    
    public String getAcc(){
         try {
             execute();
             String args[]=new String[1];
             args[0]=usr.getUserID();
             String query="select bal from balance where user_id like ?";
             ResultSet rs=dbc.getResult(query, args);
             if(rs.next()){
                 usr.setBalance(rs.getInt(1));
                 query="select Is_disabled from users where ID like ?";
                 rs=dbc.getResult(query, args);
                 if(rs.next()){
                     usr.setIs_disabled(rs.getString(1));
                     System.out.println(usr.getIs_disabled());
                 }
                 else{
                     System.out.println("Fetch Problem 2");
                 }
             }
             else{
                 System.out.println("Fetch Problem");
             }
            
         } catch (SQLException ex) {
             Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
         }
         return "success";
    }
    
    
    public String toggleRFID(){
         try {
             execute();
             
             String args[]=new String[1];
             //args[0]=usr.getUserID();
             
             args[0]=usr.getUserID();
             
             String query="select Is_disabled from users where ID like ?";
             ResultSet rs=dbc.getResult(query, args);
             if(rs.next()){
                 int r=rs.getInt(1);
                 if(r==0){
                     query="update users set Is_disabled=1 where ID like ?";
                 }
                 else{
                      query="update users set Is_disabled=0 where ID like ?";
                 }
                 int i=dbc.manipulateData(query, args);
                 if(i==0){
                     System.out.println("Update Failed");
                 }
                 else{
                     System.out.println("Success");
                     getAcc();
                     return "success";
                 }
             }
             
             
         } catch (SQLException ex) {
             Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
         }
         return null;
    }
    
    
    public String success()
    {
        return "success";
    }
    @Override
    public void setSession(Map<String, Object> map) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        this.session = map;

    }
}
