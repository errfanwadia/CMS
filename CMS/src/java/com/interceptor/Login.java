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
    private String ID;
    @Override
    public void destroy() {
      
    }

    @Override
    public void init() {
      
    }

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
            System.out.println("Intercept method of login interceptor called");
           Map<String, Object> sessionAttributes = ai.getInvocationContext().getSession(); 
           if (sessionAttributes == null || sessionAttributes.get("ID") == null || sessionAttributes.get("role") == null) 
		{
                        System.out.println("Session is empty");
			return "login";
		} 
		else 
		{
                    System.out.println("Session is Not empty but how");
                    System.out.println("Role is " + sessionAttributes.get("role"));
			if (!((String) sessionAttributes.get("ID")).equals("")) 
			{
                                ai.invoke();
                              /*  ID=(String)sessionAttributes.get("ID");
                                System.out.println("Inside Intercept method with ID " + ID );
				//return ai.invoke();
                                if(((String) sessionAttributes.get("role")).equals("1"))
                                    return "adminHome";
                                if(((String) sessionAttributes.get("role")).equals("2"))
                                    return "cafeHome";
                                if(((String) sessionAttributes.get("role")).equals("3"))
                                    return "cmcHome";
                                //if(!((String) sessionAttributes.get("role")).equals("4"))
                                return "custHome";
                                 */
			} 
			//else 
			//{
			//	return "login";
			//}
		}
           return "login";
    }
    
}
