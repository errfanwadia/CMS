/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ABS
 */
public class DatabaseConnect {
    private static  Connection conn=null;
    private ResultSet rs=null;
    private PreparedStatement ps=null;
    
    static {
        String URL = "jdbc:mysql://localhost/CMS";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, "root", "");
        } catch (Exception ex) {
            System.out.println("Can not connect to database some problem");
            ex.printStackTrace();
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }    
        System.out.println("Successfully connection established"); 
    }
    
    public Connection getConnection()
    {
        return conn;
    }
    /*
    public ResultSet getResult(String query,String args[]) // 1st parameter is for query , 2nd is for all the parameters that is to be inserted in the query
    {
        System.out.println("GetResult Method Reached")    ;
        try {            
            ps = conn.prepareStatement(query);
        } catch (SQLException ex) {
        //    Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Can not Fetch records some problem in the query");
        }
        for(int i=0;i<args.length;i++)
        {
            try {
                ps.setString(i+1, args[i]);
            } catch (SQLException ex) {
               // Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Some problem during setting parameter in the query");
            }
        }
        try {
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error when executing the query ");
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }                
        return rs;
    }
    
    
    
    */
    
    
    public ResultSet getResult(String query,String args[]) // 1st parameter is for query , 2nd is for all the parameters that is to be inserted in the query
    {
        System.out.println("GetResult Method Reached");        
        System.out.println("Query is : " + query);
        System.out.println("Number of Arguments is : " + args.length);
        try {            
            ps = conn.prepareStatement(query);
        } catch (SQLException ex) {
        //    Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
            
                System.out.println("Can not Fetch records some problem in the query");
                ex.printStackTrace();
        }
        /*try{
            
        
            ps.setString(1,"201212065"); 
            ps.setString(2,"123"); 
            rs=ps.executeQuery();
        }
        catch(Exception e)
        {
            System.out.println("Some problem while setting parameter");
        }
        
      */       
        for(int i=0;i<args.length;i++)
        {
            
            System.out.println("Inside For loop");
            try {
                ps.setString(i+1, args[i]);
                System.out.println("Parameter " + (i+1) + " is : " + args[i] );
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
                System.out.println("Some problem during setting parameter in the query");
            }
        }
        try {
            rs = ps.executeQuery();
        } catch (SQLException ex) {                                    
            System.out.println("Error when executing the query ");
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }            
        System.out.println("Query executed successfully");
        /*try {
            if(rs.next())
                System.out.println("result set has rows");
        
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnect.class.getName()).log(Level.SEVERE, null, ex);
        }*/        
        return rs;
    }
    
    
    public int manipulateData(String query,String args[])
    {
        int cnt=0;
        System.out.println("Manipulate Data Method Reached")    ;
        try {            
            ps = conn.prepareStatement(query);
        } catch (SQLException ex) {
        //    Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Can not Fetch records some problem in the query");
                ex.printStackTrace();
        }
        /*try{
            
        
            ps.setString(1,"201212065"); 
            ps.setString(2,"123"); 
            rs=ps.executeQuery();
        }
        catch(Exception e)
        {
            System.out.println("Some problem while setting parameter");
        }
        
      */       
        for(int i=0;i<args.length;i++)
        {
            System.out.println("Inside For loop");
            try {
                ps.setString(i+1, args[i]);
            } catch (SQLException ex) {
               // Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Some problem during setting parameter in the query");
                ex.printStackTrace();
            }
        }
        try {
             cnt= ps.executeUpdate();
                System.out.println("Rows affected inside manipulate Data : " + cnt);
        } catch (SQLException ex) {
            cnt=-1;
            System.out.println("Error when executing the query in insert query");
            ex.printStackTrace();
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }            
       // System.out.println("Query executed successfully");
       
        return cnt;
    }            
    public void close()
    {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Some error while closing the connection");
        }
    }
}
