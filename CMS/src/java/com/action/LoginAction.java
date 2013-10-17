/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import com.model.DatabaseConnection;
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
public class LoginAction extends ActionSupport implements ModelDriven<Object>,SessionAware{
    private User usr = new User();
    private Map<String,Object> session;
       
    public Map<String, Object> getSession() {
	return session;
    }

    public void setSession(Map<String, Object> map) {
	this.session = map;
    }
    
    public String home()
    {
        return "success";
    }
       
    public String loginCheck()
    {                
        String args[]=new String[2];
        ResultSet rs = null;
        DatabaseConnection dbc = new DatabaseConnection();
        //Connection conn = dbc.connect();
        String query = " select * from users where ID = ? and pass = ?";
        args[0]=usr.getUserID();
        args[1]=usr.getPass();
        
        try {
             rs = dbc.getResult(query,args);        
        } catch (Exception ex) 
        {
            System.out.println("Some error during action method");
            //Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println(usr.getUserID() + usr.getPass());        
        try{                    
            if (rs.next())
            {
                session.put("ID",rs.getString(1));
                session.put("role",rs.getString(3));
                dbc.close();
                return "success";
            }
            else
            {
                addActionError("Id or Password Incorrect");
                return "login";
            }
        }
        catch(Exception e)
        {
            System.out.println("Error while setting sessions ");
            return "error";
        }       
        
    }
    
    public String logOut()
    {
        session.remove("ID");                        
        addActionMessage("You have Successfully logged out");
        return "success";
    }

    @Override
    public Object getModel() {
        return usr;
    }
}
