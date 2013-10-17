/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author ABS
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {
    
    private Connection conn=null;
    private ResultSet rs=null;
    private PreparedStatement ps=null;

    public DatabaseConnection() {
        String URL = "jdbc:mysql://localhost/CMS";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, "root", "");
        } catch (Exception ex) {
            System.out.println("Can not connect to database some problem");
            //Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }    
        System.out.println("Successfully connection established");        
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
    public Connection connect()
    {
        
         return conn;        
    }
    
    public ResultSet getResult(String query,String args[]) // 1st parameter is for query , 2nd is for all the parameters that is to be inserted in the query
    {
        System.out.println("GetResult Method Reached")    ;
        try {            
            ps = conn.prepareStatement(query);
        } catch (SQLException ex) {
        //    Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Can not Fetch records some problem in the query");
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
}   
