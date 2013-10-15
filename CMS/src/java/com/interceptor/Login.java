/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interceptor;

/**
 *
 * @author ABS
 */
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
        
import java.util.Map;
public class Login implements Interceptor {

    @Override
    public void destroy() {
      
    }

    @Override
    public void init() {
      
    }

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
           Map<String, Object> sessionAttributes = ai.getInvocationContext().getSession(); 
           if (sessionAttributes == null || sessionAttributes.get("ID") == null || sessionAttributes.get("role") == null) 
		{
                        System.out.println("Session is empty");
			return "login";
		} 
		else 
		{
                    System.out.println("Session is Not empty but how");
			if (!((String) sessionAttributes.get("ID")).equals("")) 
			{
				return ai.invoke();
			} 
			else 
			{
				return "login";
			}
		}
    }
    
}
