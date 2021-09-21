<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="me.gabbo.JDBC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Gabriele Onorato" />
        <meta name="author" content="Gabriele Onorato" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge;chrome=1"/>
        <title>Gabriele Onorato</title>
        
        <style media="screen">
            body {
                 text-align: center;
            }
            table {
                text-align: center;
                margin: 0 auto;
                border-spacing: 2px;
                border: solid;
            }
            
            td {
                border-spacing: 1px;
                border: solid;
            }
            
            
        </style>
    </head>
    <body>
        <h1>
            <strong>Sciao belo!</strong>
        </h1>
        
        <table>
            <%
                JDBC db = new JDBC();
            ResultSet result = db.query("SELECT COUNT(*) as N, M.ID_Medico FROM Medici as M WHERE Codice_Studio=" + String.valueOf(request.getParameter("studio"))
            + " AND Codice_Visita=" + String.valueOf(request.getParameter("visita")) + " ORDER BY M.ID_Medico ASC LIMIT 1");
                db.close();


                while(result.next()){
                    
            %>
            <tr>
                <td><%= result.getString("N") %></td>
            <tr/>
            <%}%>
            
        </table>
    </body>
</html>
