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
    
    public String check()
    {
        return "success";
    }
    
    public String loginCheck()
    {        
        System.out.println(usr.getUserID() + usr.getPass());
        if (usr.getUserID().equals("201212065") && usr.getPass().equals("123"))
        {
            session.put("ID","201212065");
            session.put("role","4");
            return "success";
        }
        else
        {
            addActionError("Id or Password Incorrect");
            return "login";
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
