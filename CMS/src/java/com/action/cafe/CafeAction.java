/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.cafe;

import com.action.Emailer;
import com.action.customer.CustomerAction;
import com.model.DatabaseConnect;
import com.model.Transaction;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ABS
 */
public class CafeAction extends ActionSupport implements ModelDriven, SessionAware {

    User usr = new User();
    DatabaseConnect dbc = new DatabaseConnect();
    private Map<String, Object> session;

    public User getUsr() {
        return usr;
    }

    public void setUsr(User usr) {
        this.usr = usr;
    }

    public String getRfid() {
        return rfid;
    }

    public void setRfid(String rfid) {
        this.rfid = rfid;
    }

    public void setCafe() {
        cafeID = (String) session.get("ID");
    }

    public String getCafeID() {
        return cafeID;
    }

    public void setCafeID(String cafeID) {
        this.cafeID = cafeID;
    }
    String rfid;
    String cafeID;

    public String execute() {
        //setCafe();
        //System.out.println(""+(String)session.get("ID"));
        //cafeID=(String)session.get("ID");
        return "success";
    }

    public String getUserData() {
        System.out.println("RFID number received : " + rfid);
        String args[] = new String[1];
        args[0] = rfid;
        String query = "select cust_id,fname,lname from profiles where card_no like ? ";
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                //addActionMessage("Valid RFID card ");
                usr.setUserID(rs.getString(1));
                usr.setFname(rs.getString(2));
                usr.setLname(rs.getString(3));
            } else {
                addActionMessage("No such user found invalid RFID card");
                return "notFound";
            }
        } catch (SQLException ex) {
            Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error while fetching record for placing order");
            ex.printStackTrace();

        }
        return "success";
    }

    @Override
    public Object getModel() {
        return usr;
    }
    String total;

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    String cust_id;

    public String getCust_id() {
        return cust_id;
    }

    public void setCust_id(String cust_id) {
        this.cust_id = cust_id;
    }

    public String placeOrder() {
        setCafe();
        System.out.println("Cafe ID : " + usr.getUserID());
        System.out.println("Inside Place Order method");
        //String cust_id = usr.getUserID();
        System.out.println("Customer ID : " + cust_id);
        System.out.println("Total Amount of Order : " + total);
        String query = "select bal from balance where user_id like ?";
        String args[] = new String[1];
        args[0] = cust_id;
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                int bal = rs.getInt(1);
                System.out.println("User has balance : " + bal);
                bal = bal - Integer.parseInt(total);
                int bal11=0;
                if (bal >= 0) {
                    String args1[] = new String[2];
                    String query1 = "update balance set bal = ? where user_id like ?";
                    args1[0] = String.valueOf(bal);
                    args1[1] = cust_id;
                    int c = dbc.manipulateData(query1, args1);
                    if (c == 0) {
                        addActionMessage("Balance Deduction Failed");
                    } else {
                        String qr = "select bal from balance where user_id like ?";
                        String a11[] = new String[1];
                        a11[0] = session.get("ID").toString();
                        ResultSet r11 = dbc.getResult(qr, a11);
                        if (r11.next()) {
                            bal11 = r11.getInt(1);
                            System.out.println("cafe's Available Balance : " + bal11);
                        } else {
                            addActionMessage("cafe's Balance Not found");
                        }
                        String query2 = "update balance set bal = ? where user_id like ?";
                        //session.put("balance",);

                        String args2[] = new String[2];
                        args2[0] = String.valueOf(bal11 + Integer.parseInt(total));
                        args2[1] = session.get("ID").toString();
                    int c1 = dbc.manipulateData(query2, args2);
                        if (c1 == 0) {
                            addActionMessage("Error while updating Cafe balance");
                        } else {
                            //LoginAction l = new LoginAction();
                            //l.setBalance("admin");
                            session.put("balance", args2[0]);
                        }



                        String args5[] = new String[2];
                        args5[0] = cust_id;
                        args5[1] = session.get("ID").toString();
                        String in1 = "INSERT INTO `transactions`(`payer_id`, `payee_id`, `amt`, `type`,`is_rollbacked`) VALUES (?,?," + total + ",0,0)";
                        int ri1 = dbc.manipulateData(in1, args5);
                        if (ri1 == 0) {
                            System.out.println("Transaction insertion failed");
                            addActionMessage("Transaction Entry Failed");
                            return "error";
                        } else {
                            System.out.println("Transaction Entry made successfully");

                            String qu = "select email from profiles where cust_id like ?";
                            String ar1[] = new String[1];
                            ar1[0] = cust_id;
                            ResultSet rs1 = dbc.getResult(qu, ar1);
                            if (rs1.next()) {
                                String ead = rs1.getString(1);
                                String desc = "you spent Rs." + total + " on canteen  " + args5[1];
                                Emailer email = new Emailer();
                                try {
                                    email.reply("dumbassheep@gmail.com", "dumbasdonkey", ead, "Transaction Notification", desc);
                                } catch (Exception e) {
                                    addActionMessage("Notifying email sending failed");
                                }
                            }
                            System.out.println("Notification email sent successfully");
                            addActionMessage("Order Successfully Placed and email has been sent to your registered account");
                        }
                    }
                } else {
                    System.out.println("User does not have enough balance for this transaction");
                    addActionMessage("Insufficient balance for this order");
                }
            } else {
                addActionMessage("User's Available Balance Not Found");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }

        return "success";
    }

    public String ordHistory() {
        System.out.println("Hello");
        System.out.println("Hello " + session.get("ID").toString());
        String msg = null;
        String args[] = new String[2];
        args[0] = (String) session.get("ID");
        args[1] = args[0];
        String query = "SELECT t_id,payer_id,amt,time,type,is_rollbacked FROM transactions where payee_id like ? or payer_id like ? and type in(0,3,4)";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                if (rs.getString(2).equals(args[1])) {
                    t.setPayer_id("self");
                } else {
                    t.setPayer_id(rs.getString(2));
                }
                System.out.println(t.getPayer_id().toString());
                t.setTot_amt(rs.getInt(3));
                t.setTime(rs.getTimestamp(4));
                String type = rs.getString(5);
                t.setIs_rollbacked(rs.getString(6));
                if (type.equals("0")) {
                    t.setType("sold");
                }
                if (type.equals("3")) {
                    t.setType("Withdrawn");
                }
                if (type.equals("4")) {
                    t.setType("rollbacked");
                }
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
            //Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return "success";
    }

    public ArrayList<Transaction> getTran() {
        return tran;
    }

    public void setTran(ArrayList<Transaction> tran) {
        this.tran = tran;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String changePass() {
        execute();
        String args[] = new String[2];
        args[0] = usr.getUserID();
        System.out.println(getOldpass());
        args[1] = CustomerAction.getMD5(getOldpass());
        String query = "select * from users where ID like ? and pass like ?";

        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                String args2[] = new String[2];
                args2[0] = CustomerAction.getMD5(getNewpass());
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
            Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
    }
    String t_id;
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

    public String rollback() {
        System.out.println("Inside rollback method");
        System.out.println("Transaction to rollback : " + t_id);
        String query = "select * from transactions where t_id like ? and payee_id like ?";
        String args[] = new String[2];
        args[0] = t_id;
        args[1] = session.get("ID").toString();
        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                //addActionMessage("Transaction Found");
                String payer = rs.getString(2);
                String payee = rs.getString(3);
                Integer amt = rs.getInt(4);
                System.out.println("Payer : " + payer + "  Payee : " + payee + "  Amount : " + amt);

                //This code is for rollbacking the transaction


                System.out.println("Customer ID : " + payer);
                System.out.println("Rollback Amount of Order : " + amt);
                String query1 = "select bal from balance where user_id like ?";
                String args1[] = new String[1];
                args1[0] = payer;
                ResultSet rs1 = dbc.getResult(query1, args1);
                try {
                    if (rs1.next()) {
                        int bal = rs1.getInt(1);
                        System.out.println("User has balance : " + bal);
                        bal = bal + amt;
                        String args2[] = new String[2];
                        String query2 = "update balance set bal = ? where user_id like ?";
                        args2[0] = String.valueOf(bal);
                        args2[1] = payer;
                        int c = dbc.manipulateData(query2, args2);
                        if (c == 0) {
                            addActionMessage("Balance rollback Failed");
                        } else {
                            String args5[] = new String[1];
                            args5[0] = t_id;
                            String in1 = "update transactions set is_rollbacked = '1' where t_id like ?";
                            int ri1 = dbc.manipulateData(in1, args5);
                            if (ri1 == 0) {
                                System.out.println("Transaction insertion failed");
                                addActionMessage("Transaction Entry Failed");
                                return "error";
                            } else {
                                System.out.println("Transaction Entry made successfully");
                                addActionMessage("Transaction rollback Successful");
                            }
                        }

                    } else {
                        addActionMessage("User's Available Balance Not Found");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
                    ex.printStackTrace();
                }


            } else {
                System.out.println("URL is modified | Transaction not found");
                addActionMessage("Invalid Transaction ID, please try again");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return "success";
    }
    ArrayList<Transaction> tran = new ArrayList<Transaction>();

    public String rollbackedHistory() {
        System.out.println("Hello");
        System.out.println("Hello " + session.get("ID").toString());
        String msg = null;
        String args[] = new String[1];
        args[0] = (String) session.get("ID");
        String query = "SELECT t_id,payer_id,amt,time FROM transactions where payee_id like ? and is_rollbacked like '1'";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                t.setPayer_id(rs.getString(2));
                System.out.println(t.getPayer_id().toString());
                t.setTot_amt(rs.getInt(3));
                t.setTime(rs.getTimestamp(4));
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
            //Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return "success";
    }

    public String withdrawHistory() {
        System.out.println("Hello");
        System.out.println("Hello " + session.get("ID").toString());
        String msg = null;
        String args[] = new String[1];
        args[0] = (String) session.get("ID");
        String query = "SELECT t_id,payer_id,amt,time FROM transactions where payee_id like ? and type like '3'";
        ResultSet rs = dbc.getResult(query, args);
        try {
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setT_id(rs.getInt(1));
                t.setPayer_id("self");
                System.out.println(t.getPayer_id().toString());
                t.setTot_amt(rs.getInt(3));
                t.setTime(rs.getTimestamp(4));
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
            //Logger.getLogger(CafeAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        this.session = map;
    }
}
