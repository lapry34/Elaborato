/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.gabbo;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gabbo
 */
public class Visite extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        try {
            JDBC db  = new JDBC();
            ResultSet rs = db.query("SELECT V.ID_Visita, V.Nome from Visite as V");
            db.close();
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            ArrayList<Visita> visite = new ArrayList<>();
            
            while(rs.next()){   
                visite.add(new Visita(rs.getInt("ID_Visita"), rs.getString("Nome")));
            }
          
            String JSONString = new Gson().toJson(visite);
            
            out.print(JSONString);      
            
        } catch (SQLException ex) {     
            out.print(ex);
            Logger.getLogger(Studi.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
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
        return "visite mediche";
    }
    
     private class Visita implements Serializable {
        
        private int ID = -1;
        private String nome = "";
        
        
        public Visita(int ID, String nome) {
            setID(ID);
            setNome(nome);
        }
        
        public void setID(int ID){
            this.ID = ID;
        }
        
        public void setNome(String nome){
            this.nome = nome;
        }
        
        public int getID(){
            return ID;
        }
        
        public String getNome(){
            return nome;
        }
        
        
    }
}
