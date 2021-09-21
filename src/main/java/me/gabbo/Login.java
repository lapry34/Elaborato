/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.gabbo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gabbo
 */
public class Login extends HttpServlet {


    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        
        PrintWriter out = response.getWriter();
        try {   
            JDBC db = new JDBC();
            
            ResultSet rs = db.query("SELECT firstname, lastname from MyGuests WHERE firstname = \"" + request.getParameter("username") + "\"AND lastname = \"" + request.getParameter("password") + "\"");
            
            
            db.close();
            
            if(rs.next()) {
                
                String username = rs.getString("FIRSTNAME");
                String password = rs.getString("LASTNAME");
                
                response.setContentType("text/html;charset=UTF-8");
                out.println(username);
                out.println(password);
                
            } else {
                
                response.setContentType("text/html;charset=UTF-8");
                out.println("Dati NON trovati");

            }
                   
     
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.flush();
            out.close();
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Login process";
    }

}
