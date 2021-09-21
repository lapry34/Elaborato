/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.gabbo;

/**
 *
 * @author gabbo
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBC {
    
        protected String host = "localhost",
                  dbname = "elaborato",
                  url = "jdbc:mariadb://" + host + "/" + dbname,
                  username = "root",
                  password = "";
        protected Connection conn = null;
    
    public JDBC() throws SQLException {
            try {
                Class.forName("org.mariadb.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(JDBC.class.getName()).log(Level.SEVERE, null, ex);
            }

        conn = DriverManager.getConnection(url, username, password);
    }
    
    public ResultSet query(String query) throws SQLException {

        Statement st = conn.createStatement();
        
        ResultSet rs = st.executeQuery(query);       
        st.close();
        
        return rs;
    }
    
    public void close() throws SQLException {
        conn.close();
    }  
}
        