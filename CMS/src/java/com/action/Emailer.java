/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

/**
 *
 * @author ABS
 */
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionSupport;
import java.net.URL;

public class Emailer extends ActionSupport {

   private String from;
   private String password;
   private String to;
   private String subject;
   private String body;

   static Properties properties = new Properties();
   static
   {
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.socketFactory.port", "465");
      properties.put("mail.smtp.socketFactory.class",
                     "javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "465");
   }

   public String execute(final String senderAcc,final String senderPass,String sendTo,String sub,String desc,URL url) 
   {
      String ret = SUCCESS;
      try
      {
         /*Session session = Session.getInstance(properties,  
            new javax.mail.Authenticator() {
            protected PasswordAuthentication 
            getPasswordAuthentication() {
            return new 
            PasswordAuthentication("dumbassheep@gmail.com", "dumbasdonkey");
            }});*/
            
          Session session = Session.getInstance(properties,  
            new javax.mail.Authenticator() {
            protected PasswordAuthentication 
            getPasswordAuthentication() {
            return new 
            PasswordAuthentication(senderAcc,senderPass);
            }});
         Message message = new MimeMessage(session);
         /*message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO, 
            InternetAddress.parse(to));
         message.setSubject(subject);
         message.setText(body);
         
            */
         /*message.setFrom(new InternetAddress("dumbassheep@gmail.com"));
         message.setRecipients(Message.RecipientType.TO, 
            InternetAddress.parse("201212065@daiict.ac.in"));
         message.setSubject("Testing mail");
         message.setText("This mail is just for testing purpose");*/
         message.setFrom(new InternetAddress(senderAcc));
         message.setRecipients(Message.RecipientType.TO, 
            InternetAddress.parse(sendTo));
         message.setSubject(sub);
         message.setText(desc + url.toURI());
         
         Transport.send(message);
      }
      catch(Exception e)
      {
         ret = ERROR;
         e.printStackTrace();
      }
      return ret;
   }

   public String getFrom() {
      return from;
   }

   public void setFrom(String from) {
      this.from = from;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getTo() {
      return to;
   }

   public void setTo(String to) {
      this.to = to;
   }

   public String getSubject() {
      return subject;
   }

   public void setSubject(String subject) {
      this.subject = subject;
   }

   public String getBody() {
      return body;
   }

   public void setBody(String body) {
      this.body = body;
   }

   public static Properties getProperties() {
      return properties;
   }

   public static void setProperties(Properties properties) {
      Emailer.properties = properties;
   }
   public String reply(final String senderAcc,final String senderPass,String sendTo,String sub,String desc)
   {
       String msg="success";
        try
      {                     
          Session session = Session.getInstance(properties,  
            new javax.mail.Authenticator() {
            protected PasswordAuthentication 
            getPasswordAuthentication() {
            return new 
            PasswordAuthentication(senderAcc,senderPass);
            }});
         Message message = new MimeMessage(session);        
         message.setFrom(new InternetAddress(senderAcc));
         message.setRecipients(Message.RecipientType.TO, 
            InternetAddress.parse(sendTo));
         message.setSubject(sub);
         message.setText(desc);         
         Transport.send(message);
      }
      catch(Exception e)
      {
         msg = ERROR;
         e.printStackTrace();
      }
       
       
       return msg;
   }
}
