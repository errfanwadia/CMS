/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.admin;

import com.action.CheckAction;
import com.action.LoginAction;
import com.action.customer.CustomerAction;
import com.model.Cafe;
import com.model.DatabaseConnect;
import com.model.Transaction;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ABS
 */
public class AdminAction extends ActionSupport implements SessionAware {

    private String fname;
    private String amt;
    private String pass;
    private Map<String, Object> session;

    public String getAmt() {
        return amt;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setAmt(String amt) {
        this.amt = amt;
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

    public String getCont_no() {
        return cont_no;
    }

    public void setCont_no(String cont_no) {
        this.cont_no = cont_no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    private String lname;
    private String cont_no;
    private String email;

    public ArrayList<User> getUsers() {
        return users;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    private String id;
    private String rfid;

    public String getRfid() {
        return rfid;
    }

    public void setRfid(String rfid) {
        this.rfid = rfid;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }
    ArrayList<User> users = new ArrayList();
    //Connection con=null;
    //Statement st=null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DatabaseConnect dbc = new DatabaseConnect();

    public String showUsers() {
        String msg = "success";
        String args[] = new String[0];
        String query = "SELECT ID,p.fname,p.lname,verified_date FROM users as u,profiles as p where p.cust_id=u.ID and status like '1' and is_deleted like '0'";
        rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                User usr = new User();
                usr.setUserID(rs.getString(1));
                usr.setFname(rs.getString(2));
                usr.setLname(rs.getString(3));
                usr.setVerified_date(rs.getDate(4));
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
                users.add(usr);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msg;
    }

    public String activate() {
        String msg = "success";
        System.out.println("Inside activation method");
        System.out.println("Activate ID : " + id);
        String query = "select fname,lname from profiles where cust_id like ?";
        String args[] = new String[1];
        args[0] = id;
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                fname = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //System.out.println("Activate ID : " + userID);        
        return msg;
    }

    public String assignRFID() {
        String msg = "success";
        System.out.println("ID to activate : " + id);
        System.out.println("RFID to assign : " + rfid);
        if (rfid.equals("") == true || rfid.length() != 32) {
            System.out.println("rfid is null or invalid");
            addActionMessage("Invalid RFID number please try again ");
            return "empty";
        }
        String query = "update profiles set card_no= ? where cust_id like ? ";
        String args[] = new String[2];
        args[0] = rfid;
        args[1] = id;
        int c = 0;
        c = dbc.manipulateData(query, args);
        System.out.println("Count returned : " + c);
        if (c == 0) {
            addActionMessage("RFID card Assignment failed due to some error please try again");
            msg = "error";
        } else if (c == -1) {
            addActionMessage("This RFID card is already assigned to some other user");
        } else {
            query = "update users set status=2 where ID like ? ";
            args = new String[1];
            args[0] = id;
            int d = 0;
            d = dbc.manipulateData(query, args);
            System.out.println("Value of D : " + d);
            if (d == 0) {
                addActionMessage("RFID card Assignment failed due to some error please try again");
                msg = "error";
            } else {
                addActionMessage("RFID card successfully assigned");
            }
        }
        return msg;
    }

    public String showRegUsers() {
        String msg = "success";
        String args[] = new String[0];
        String query = "SELECT ID,p.fname,p.lname,bal FROM balance as b, users as u,profiles as p where p.cust_id=u.ID and status like '2' and is_deleted like'0' and b.user_id=ID";
        rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                User usr = new User();
                usr.setUserID(rs.getString(1));
                usr.setFname(rs.getString(2));
                usr.setLname(rs.getString(3));
                usr.setBalance(Integer.parseInt(rs.getString(4)));
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
                users.add(usr);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msg;
    }

    public String viewDetails() {
        String msg = "success";
        System.out.println("ID received in view details is : " + id);
        String query = "select cust_id,fname,lname,cont_no,email from profiles where cust_id like ?";
        String args[] = new String[1];
        args[0] = id;
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                id = rs.getString(1);
                fname = rs.getString(2);
                lname = rs.getString(3);
                cont_no = rs.getString(4);
                email = rs.getString(5);
            }
        } catch (Exception e) {
            msg = "error";
            addActionError("User details not found please try after some time");
        }
        return msg;
    }

    public String deleteUser() {
        String msg = "success";
        System.out.println("Inside Delete User");
        System.out.println("ID to delete : " + id);
        addActionMessage("User deleted Successfully");
        String query = "update users set is_deleted = 1 where ID like ? ";
        String args[] = new String[1];
        args[0] = id;
        int c = 0;
        c = dbc.manipulateData(query, args);
        System.out.println("Rows affected : " + c);
        if (c == 0) {
            addActionError("Not able to delete user");
            msg = "error";
        }
        return msg;
    }

    public String updateCafe() {
        String msg = "success";
        System.out.println("Inside update cafe profile method");
        System.out.println("Cafe ID : " + cafe_id + "   cafe name : " + cafe_name + "   owner name : " + owner_name);
        String ar[] = new String[3];
        String query = "update cafe set cafe_name = ? , owner_name = ? where cafe_id like ? ";
        ar[0] = cafe_name;
        ar[1] = owner_name;
        ar[2] = cafe_id;
        int c = 0;
        c = dbc.manipulateData(query, ar);
        if (c == 0) {
            addActionMessage("Cafe Profile updation failed");
        } else {
            addActionMessage("Cafe Profile successfully updated");
        }
        return msg;
    }

    public String deleteRegUser() {
        String msg = "success";
        System.out.println("Inside Delete Registered User");
        System.out.println("Registered user ID to delete : " + id);
        addActionMessage("User deleted Successfully");
        String query = "update users set is_deleted = 1 where ID like ? ";
        String args[] = new String[1];
        args[0] = id;
        int c = 0;
        c = dbc.manipulateData(query, args);
        System.out.println("Rows affected : " + c);
        if (c == 0) {
            addActionError("Not able to delete user");
            msg = "error";
        }
        return msg;
    }

    public String creditBalance() {
        String msg = "success";
        System.out.println("Inside Credit Balance method");
        System.out.println("RFID received :  " + rfid);
        System.out.println("Amount is : " + amt);
        String query = "select cust_id from profiles where card_no like ?";
        String args[] = new String[1];
        String cust_id = null;
        args[0] = rfid;
        ResultSet rs = dbc.getResult(query, args);

        int bal1 = 0;
        int bal11 = 0;
        try {
            if (rs.next()) {
                String qr = "select bal from balance where user_id like ?";
                String a11[] = new String[1];
                a11[0] = "admin";
                ResultSet r11 = dbc.getResult(qr, a11);
                if (r11.next()) {
                    bal11 = r11.getInt(1);
                    System.out.println("Admin's Available Balance : " + bal11);
                } else {
                    addActionMessage("Admin's Balance Not found");
                }
                String query2 = "update balance set bal = ? where user_id like ?";
                //session.put("balance",);

                String args2[] = new String[2];
                args2[0] = String.valueOf(bal11 + Integer.parseInt(amt));
                args2[1] = "admin";
                int c1 = dbc.manipulateData(query2, args2);
                if (c1 == 0) {
                    addActionMessage("Error while updating Admin balance");
                } else {
                    //LoginAction l = new LoginAction();
                    //l.setBalance("admin");
                    session.put("balance", args2[0]);
                }

                cust_id = rs.getString(1);
                String q = "select bal from balance where user_id like ?";
                String a1[] = new String[1];
                a1[0] = cust_id;
                ResultSet r1 = dbc.getResult(q, a1);
                if (r1.next()) {
                    bal1 = r1.getInt(1);
                    System.out.println("Available Balance : " + bal1);
                } else {
                    addActionMessage("User's Balance Not found");
                }
                String query1 = "update balance set bal = ? where user_id like ?";
                String args1[] = new String[2];
                args1[0] = String.valueOf(bal1 + Integer.parseInt(amt));
                args1[1] = cust_id;
                int c = dbc.manipulateData(query1, args1);
                if (c == 0) {
                    addActionMessage("Error while updating balance");
                } else {
                    String args5[] = new String[1];
                    args5[0] = cust_id;
                    String in1 = "INSERT INTO `transactions`(`payer_id`, `payee_id`, `amt`, `type`,`is_rollbacked`) VALUES ('admin',?," + amt + ",1,0)";
                    int ri1 = dbc.manipulateData(in1, args5);
                    if (ri1 == 0) {
                        System.out.println("Transaction insertion failed");
                        addActionMessage("Transaction Entry Failed");
                        return "error";
                    } else {
                        System.out.println("Fund transfer successfull");
                        addActionMessage("Account Recharged successful");
                    }
                }
            } else {
                addActionMessage("No Such User/RFID card Found");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msg;
    }

    public String execute() {
        return "success";
    }

    public String setCafe() {
        String msg = "success";
        System.out.println("Cafe ID received : " + id);
        String query = "select * from cafe where cafe_id like ? ";
        String ar[] = new String[1];
        ar[0] = id;
        ResultSet rs = dbc.getResult(query, ar);
        try {
            if (rs.next()) {
                cafe_name = rs.getString(2);
                owner_name = rs.getString(3);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }

        return msg;
    }
    ArrayList<Cafe> cafes = new ArrayList<Cafe>();

    public ArrayList<Cafe> getCafes() {
        return cafes;
    }

    public void setCafes(ArrayList<Cafe> cafes) {
        this.cafes = cafes;
    }

    public String viewCanteens() {
        String msg = "success";

        System.out.println("Inside View Canteens method ");
        String query = "select cafe_id,cafe_name,owner_name,bal from cafe as c,balance as b where c.cafe_id=b.user_id";
        String args[] = new String[0];
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Cafe c = new Cafe();
                c.setCafe_id(rs.getString(1));
                c.setCafe_name(rs.getString(2));
                c.setOwner_name(rs.getString(3));
                c.setBalance(Integer.parseInt(rs.getString(4)));
                //c.setBalance(0);
                cafes.add(c);
            }

        } catch (SQLException ex) {
            System.out.println("error in setting cafes arraylist");
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            msg = "error";
        }
        return msg;
    }
    String cafe_id;
    String cafe_name;

    public String getCafe_id() {
        return cafe_id;
    }

    public void setCafe_id(String cafe_id) {
        this.cafe_id = cafe_id;
    }

    public String getCafe_name() {
        return cafe_name;
    }

    public void setCafe_name(String cafe_name) {
        this.cafe_name = cafe_name;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    String owner_name;
    String password;

    public String insertCanteen() {
        System.out.println("Inside Insert Canteen Method ");
        System.out.println("id= " + cafe_id + " cafe name= " + cafe_name + " owner name= " + owner_name + " pass = " + password);
        String q = "select * from cafe where cafe_id like ?";
        String a[] = new String[1];
        a[0] = cafe_id;
        ResultSet rs = dbc.getResult(q, a);
        try {
            if (!rs.next()) {
                String query = "insert into cafe values(?,?,?);";
                String args[] = new String[3];
                args[0] = cafe_id;
                args[1] = cafe_name;
                args[2] = owner_name;
                int ans = 0;
                try {
                    ans = dbc.manipulateData(query, args);

                } catch (Exception e) {
                    System.out.println("problem in insertquery cafe in getresult");
                    return "error";
                }
                int ans1 = 0;
                try {
                    if (ans != 0) {
                        System.out.println("ans ! = 0");
                        query = "insert into balance values(?,0);";
                        String ary[] = new String[1];
                        ary[0] = cafe_id;
                        ans1 = dbc.manipulateData(query, ary);
                    } else {
                        System.out.println("ans = = 0");
                        return "error";
                    }
                } catch (Exception e) {
                    System.out.println("problem in insertquery balance in getresult");
                    return "error";
                }
                int ans2 = 0;
                try {
                    if (ans1 != 0) {
                        System.out.println("Users ans1 ! = 0");
                        query = "insert into users (`ID`,`pass`,`status`,`verified_date`,`Is_disabled`,`Is_deleted`,`role`) values(?,?,2,?,0,0,2)";
                        String ary[] = new String[3];
                        ary[0] = cafe_id;
                        ary[1] = CustomerAction.getMD5(password);
                        ary[2] = CheckAction.getCurrentDate().toString();
                        ans2 = dbc.manipulateData(query, ary);
                        if (ans2 != 0) {
                            addActionMessage("Canteen Added Successfully");
                            return "success";
                        }
                    } else {
                        System.out.println("ans1 = = 0");
                        return "error";
                    }
                } catch (Exception e) {
                    System.out.println("problem in insertquery users in getresult");
                    return "error";
                }
                if (ans2 != 0) {
                    System.out.println("ans2 ! = 0");

                    return "success";
                } else {
                    System.out.println("ans = = 0");
                    return "error";
                }
            } else {
                addActionMessage("Canteen ID  " + cafe_id + "  is already Registered,try again with different Canteen ID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return "success";
    }

    public String debitValue() {
        String msg = "success";
        System.out.println("id= " + id + "  amount= " + amt + " pass= " + password);
        String query = "select ID, pass from users where ID like ? and pass like ? and role like '2' ";
        String args[] = new String[2];
        args[0] = id;
        args[1] = CustomerAction.getMD5(password);
        try {
            rs = dbc.getResult(query, args);
            if (rs.next()) {
                int w_amt = Integer.parseInt(amt);
                String passwd = rs.getString(2);
                //addActionMessage("Correct Canteen ID and Password");
                String q = "select bal from balance where user_id like ?";
                String a[] = new String[1];
                a[0] = id;
                ResultSet r = dbc.getResult(q, a);
                int bal = 0;
                if (r.next()) {
                    bal = r.getInt(1);
                    // addActionMessage("Balance  "+ bal + " Found ");
                    if (bal >= w_amt) {
                        //addActionMessage("Amount can be withdrawn");
                        bal = bal - w_amt;
                        Connection con = dbc.getConnection();
                        con.setAutoCommit(false);
                        String q1 = "update balance set bal = ? where user_id like ?";
                        String a1[] = new String[2];
                        a1[0] = String.valueOf(bal);
                        a1[1] = id;
                        int c = dbc.manipulateData(q1, a1);
                        if (c == 0) {
                            addActionMessage("Balace Dedcution failed");
                        } else {
                            addActionMessage("Balance Successfully Deducted");
                            String q2 = "INSERT INTO `transactions`(`payer_id`, `payee_id`, `amt`, `type`) VALUES ('admin',?,?,'3')";
                            String a2[] = new String[2];
                            a2[0] = id;
                            a2[1] = String.valueOf(w_amt);
                            int cnt = dbc.manipulateData(q2, a2);
                            if (cnt == 0) {
                                addActionMessage("Transaction Entry failed");
                                con.rollback();
                            } else {
                                addActionMessage("Transaction Entry Successful");

                                String query2 = "update balance set bal = ? where user_id like ?";
                                //session.put("balance",);
                                int bal11 =Integer.parseInt(session.get("balance").toString());
                                String args2[] = new String[2];
                                args2[0] = String.valueOf(bal11 - w_amt);
                                args2[1] = "admin";
                                int c1 = dbc.manipulateData(query2, args2);
                                if (c1 == 0) {
                                    addActionMessage("Error while updating Admin balance");
                                    con.rollback();
                                } else {
                                    session.put("balance",args2[0]);
                                    con.commit();
                                }

                            }
                        }

                    } else {
                        addActionMessage("Withdrawl amount is more than balance");
                    }
                } else {
                    addActionMessage("Balance Not Found ");
                }
            } else {
                addActionMessage("Canteen ID or Password Incorrect");
            }
        } catch (Exception ex) {
            System.out.println("Some error during action method");
            ex.printStackTrace();
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        /*
         try {
         if (rs.next()) {
         System.out.println("id and password matched >>>");
         query = "select bal from balance where user_id=?";
         String ary[] = new String[1];
         ary[0] = id;
         rs = dbc.getResult(query, ary);
         }
         } catch (Exception e) {
         System.out.println("error during get amount>>>");
         }
         try {
         if (rs.next()) {
         int bal = Integer.parseInt(rs.getString("bal"));
         int cbal = Integer.parseInt(amt);
         if (bal >= cbal) {
         System.out.print("bal=" + bal + "cbal=" + cbal);
         query = "update balance set bal=bal - ? where user_id=?";
         String ary[] = new String[2];
         ary[0] = amt;
         ary[1] = id;
         int ans = dbc.manipulateData(query, ary);
         if (ans == 0) {
         System.out.println("amount not subtracted>>>");
         return "error";
         } else {
         System.out.println("amount subtracted>>");
         return "success";
         }
         }
         } else {
         return "error";
         }
         } catch (Exception e) {
         System.out.println("error during subtract amount>>>");
         }
         */
        //addActionMessage("Balance Deducted Successfully");
        return msg;
    }

    public String reAssign() {
        String msg = "success";
        System.out.println("ID received in view details is : " + id);
        System.out.println("Card No. received is : " + rfid);
        if (rfid.equals("") == true || rfid.length() != 32) {
            System.out.println("rfid is null or invalid");
            addActionMessage("Invalid RFID number please try again ");
            return "empty";
        }
        String query = "update profiles set card_no= ? where cust_id like ? ";
        String args[] = new String[2];
        args[0] = rfid;
        args[1] = id;
        int c = 0;
        c = dbc.manipulateData(query, args);
        System.out.println("Count returned : " + c);
        if (c == 0) {
            addActionMessage("RFID card Assignment failed due to some error please try again");
            msg = "error";
        } else if (c == -1) {
            addActionMessage("This RFID card is already assigned to some other user");
        } else {
            addActionMessage("Re Assignment Successful");
        }
        return msg;
    }

    public String resetPass() {
        String msg = "success";
        System.out.println("Inside reset password method");
        System.out.println("ID : " + id + "pass : " + pass);
        if (pass == null || pass.equals("")) {
            addActionMessage("please Enter the new password");
            return "input";
        }
        String q = "update users set pass = ? where ID like ?";
        String a[] = new String[2];
        a[0] = CustomerAction.getMD5(pass);
        a[1] = id;
        int c = -1;
        c = dbc.manipulateData(q, a);
        if (c == 0) {
            addActionMessage("password Reset failed");
        } else if (c == 1) {
            addActionMessage("Password Successfully reset");
        } else {
            addActionMessage("Something went wrong");
        }
        return msg;
    }
    
    public String viewUserHistory()
    {
        String msg="success";
        System.out.println("ID Received : "+ id);          
        String args[] = new String[2];        
        args[0]=id;        
        args[1]=id;
        String query = "SELECT t_id,payer_id,payee_id,amt,type,time FROM transactions where payer_id like ? or payee_id like ?";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                t.setPayer_id(rs.getString(2));
                String payee=rs.getString(3);               
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
                else if(rs.getString(5).equals("4")){
                    type="Rollbacked";
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
                trans.add(t);
            }
        } catch (SQLException ex) {
            msg = "error";
            Logger.getLogger(CustomerAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return msg;
    }

    public ArrayList<Transaction> getTrans() {
        return trans;
    }

    public void setTrans(ArrayList<Transaction> trans) {
        this.trans = trans;
    }
    
    ArrayList<Transaction> trans = new ArrayList();

    @Override
    public void setSession(Map<String, Object> map) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        this.session = map;
    }
}
