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
 * @author Gabbo
 */
public class MediciPrestazione extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        PrintWriter out = response.getWriter();
        
        try {
            JDBC db  = new JDBC();
            ResultSet rs = db.query("SELECT M.ID_Medico, M.Nome, M.Cognome FROM Medici as M WHERE Codice_Studio=" + request.getParameter("studio") + " AND Codice_Visita=" + request.getParameter("visita"));
            db.close();  
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");    

            ArrayList<Medico> medici = new ArrayList<>();
       
            while(rs.next()){   
                medici.add(new Medico(rs.getInt("ID_Medico"), rs.getString("Nome"), rs.getString("Cognome")));
            }     
                   
            String JSONString = new Gson().toJson(medici);
               
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

    @Override
    public String getServletInfo() {
        return "ritorna i medici che svolgono una determinata prestazione";
    }
    
    private class Medico implements Serializable {
        
        private int ID = -1;
        private String nome = "";
        private String cognome = "";
        
        public void setID(int ID){
            this.ID = ID;
        }
        
        public void setNome(String nome){
            this.nome = nome;
        }

        public void setCognome(String cognome){
            this.cognome = cognome;
        }
        
        public int getID(){
            return ID;
        }
        
        public String getNome(){
            return nome;
        }
        
        public String getCognome(){
            return nome;
        }
        
        public Medico(int ID, String nome, String cognome){
            setID(ID);
            setNome(nome);
            setCognome(cognome);
        }  
    }
}
