<%-- 
    Document   : test
    Created on : 1 mag 2021, 18:30:54
    Author     : gabbo
--%>
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
        </style>
    </head>
    <body>
        <%
            String blah = request.getParameter("blah");
        %>
        
        <h1> 
            <marquee><%= blah %></marquee>
        </h1>
    </body>
</html>
