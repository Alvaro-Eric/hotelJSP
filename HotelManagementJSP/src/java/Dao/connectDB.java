/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Alvaro
 */
public class connectDB {
    public static Connection getCon() {
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/internhip","root","");
           
            return conn;
            
        } catch (Exception e) {
            
            System.out.println(e);
            return null;
        }
    }
    
}

