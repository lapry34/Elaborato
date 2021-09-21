/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.gabbo;

import java.io.IOException;
import java.io.PrintWriter;
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
public class Prenotazione extends HttpServlet {


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
        
        String CF = request.getParameter("CF"),
               NTS = request.getParameter("NTS"),
               nome = request.getParameter("nome"),
               cognome = request.getParameter("cognome"),
               DOB = request.getParameter("dob"),
               cellulare = request.getParameter("cellulare"),
               email = request.getParameter("email"),
               TipoVisita = request.getParameter("TipoVisita"),
               medico = request.getParameter("medico"),  
               N_Ricetta = request.getParameter("NRicetta") == null ? "NULL" : "'" + request.getParameter("NRicetta") + "'" ;
        
        try {
            JDBC db  = new JDBC();
            db.query("INSERT INTO pazienti VALUES ('"+CF+"','"+nome+"','"+cognome+"', '"+DOB+"',NULL, '"+cellulare+"', '"+email+"', '"+NTS+"')"
                   + " ON DUPLICATE KEY UPDATE CF = '"+CF+"', Nome = '"+nome+"', Cognome = '"+cognome+"', Data_Nascita = '"+DOB+"', email = '"+email+"', N_TEAM = '"+NTS+"'; ");
            if(TipoVisita == "1") db.query("INSERT INTO prestazioni VALUES (DEFAULT, NULL, NULL)");
            else db.query("INSERT INTO prestazioni VALUES (DEFAULT, "+medico+", NULL)");
            db.query("INSERT INTO prenotazioni VALUES (DEFAULT,"+N_Ricetta+", (SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES" 
                   + " WHERE TABLE_SCHEMA = 'elaborato' AND TABLE_NAME = 'prestazioni') -1, '"+CF+"')");
            
            db.close();                   
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            
        } catch (SQLException ex) {     
            out.print(ex);
            Logger.getLogger(Studi.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            out.flush();
            out.close();
            response.sendRedirect(request.getContextPath() + "/convalida.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    @Override
    public String getServletInfo() {
        return "Form processing";
    }

}
