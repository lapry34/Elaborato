<%-- 
    Document   : test
    Created on : 4 mag 2021, 18:30:54
    Author     : Gabbo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE HTML>
<html lang="it">
    <head>
        <script type="text/javascript">var ctx = "<%=request.getContextPath()%>"</script>
        <script type="text/javascript" src="https://kit.fontawesome.com/d256209648.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://unpkg.com/gijgo@1.9.13/js/messages/messages.it-it.js" crossorigin="anonymous"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        
        <meta name="description" content="Gabriele Onorato" />
        <meta name="author" content="Gabriele Onorato" />
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO2.ico" />
        <title>Gabriele Onorato</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge;chrome=1" />
        
        <link type="text/css" media="screen" rel="stylesheet" crossorigin="anonymous" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link type="text/css" media="screen" rel="stylesheet" crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
        <link type="text/css" media="screen" rel="stylesheet" crossorigin="anonymous" href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" />
        <link type="text/css" media="screen" rel="stylesheet" crossorigin="anonymous" href="${pageContext.request.contextPath}/css/main.css" />
        <style media="screen">

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/img/LOGO2.png" width="30" height="30" class="d-inline-block align-top" alt="" />  
            &nbsp;IRCCS Gieri
          </a>
        </nav>

        <main role="main" class="container">
          <div class="jumbotron">
            <h1 style="text-align: center;">Prenotazione ricevuta!</h1>
            <hr class="my-4" />
            <p class="lead" style="text-align: center;">Verrai ricontattato da un membro del CUP il prima possibile.</p>
          </div>
        </main>
    </body>
</html>
