/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.cmc;

import com.action.Emailer;
import com.action.customer.CustomerAction;
import org.apache.struts2.dispatcher.FilterDispatcher;
import com.model.DatabaseConnect;
import com.model.Feedback;
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
public class CMCAction extends ActionSupport implements SessionAware,ModelDriven<Object> {
    
    private Map<String, Object> session;
    private ArrayList<Feedback> feedbacks = new ArrayList();
    Feedback feed = new Feedback();
    DatabaseConnect dbc = new DatabaseConnect();

    public String showFeedbacks() {
        String msg = "success";
        String args[] = new String[0];
        ResultSet rs = null;
        String query = "select * from feedback ";
        try {
            rs = dbc.getResult(query, args);
        } catch (Exception e) {
            System.out.println("Some error while getting result");
        }
        try {
            while (rs.next()) {
                System.out.println("Some records found");
                Feedback f = new Feedback();
                f.setF_id(rs.getInt(1));
                f.setC_id(rs.getString(3));
                f.setSub(rs.getString(4));
                f.setDesc(rs.getString(2));
                feedbacks.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Some error during setting feedback into arraylist");
            Logger.getLogger(CMCAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msg;
    }
    
    

    public String viewFeedback() {
        String msg = "success";
        System.out.println("Feedback ID : " + feed.getF_id());
        String query = "select * from feedback where f_id like ?";
        String args[] = new String[1];
        args[0] = String.valueOf(feed.getF_id());

        try {
            ResultSet rs = dbc.getResult(query, args);
            rs.next();
            feed.setC_id(rs.getString(3));
            feed.setSub(rs.getString(4));
            feed.setDesc(rs.getString(2));
            System.out.println("Feedback found ");
        } catch (SQLException ex) {
            Logger.getLogger(CMCAction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return msg;
    }

    public ArrayList<Feedback> getFeedbacks() {
        return feedbacks;
    }

    public void setFeedbacks(ArrayList<Feedback> feedbacks) {
        this.feedbacks = feedbacks;
    }

    public String execute() {
        String msg = "success";
        return msg;
    }  

    public String reply() {
        String msg="success";
        System.out.println("Inside Reply method");
        System.out.println("ID to reply : " + feed.getC_id());
        System.out.println("Subject : " + feed.getSub());
        System.out.println("Message : " + feed.getDesc());
        Emailer email = new Emailer();
        email.reply("dumbassheep@gmail.com", "dumbasdonkey", feed.getC_id() + "@daiict.ac.in", "Reply : "+feed.getSub(), feed.getDesc());
        return msg;
    }
 
  
    
    public String deleteFeedback() {
        System.out.println("Delete Feedback ID : " + feed.getF_id());
        String query = "delete from feedback where f_id=?";
        String args[] = new String[1];
        args[0] = String.valueOf(feed.getF_id());
        int no = 0;
        try {
            no = dbc.manipulateData(query, args);

        } catch (Exception e) {
            System.out.println("NOT execute delete query");
        }
        System.out.println("nooo==" + no);
        if (no == 1) {
            addActionMessage("Feedback Deleted Successfully");
            return "success";
        } else {
            addActionError("Feedback not found");
            return "error";
        }
    }
    
    
    public String changePass() {
        execute();
        String args[] = new String[2];
        args[0] = session.get("ID").toString();
        System.out.println(getOldpass());
        args[1] = CustomerAction.getMD5(getOldpass());
        String query = "select * from users where ID like ? and pass like ?";

        ResultSet rs = dbc.getResult(query, args);
        try {
            if (rs.next()) {
                String args2[] = new String[2];
                args2[0] = CustomerAction.getMD5(getNewpass());
                args2[1] = session.get("ID").toString();
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
            Logger.getLogger(CMCAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "success";
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


    @Override
    public Object getModel() {
        return feed;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        this.session = map;
    }
}
