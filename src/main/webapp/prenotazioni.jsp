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
            <h1 style="text-align: center;">Inserimento Prenotazioni</h1>
            <hr class="my-4" />
            <p class="lead">Qui puoi inserire le prenotazioni di visite specialistiche private o convenzionate con il SSN.</p>
            <form name="prenotazione" id="formPrenotazione" method="post" action="${pageContext.request.contextPath}/Servlet/Prenotazione">
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="CF">Codice Fiscale</label>
                      <input type="text" class="form-control" id="CF" name = "CF" aria-describedby="CFHelp" placeholder="Inserire Codice Fiscale*">
                      <small id="CFHelp" class="form-text text-muted">*Inserire il codice fiscale così come riportato sulla tessera sanitaria.</small>
                    </div>
                    <div class="form-group col-md-6">
                      <label for="NTS">N. Tessera Sanitaria</label>
                      <input type="text" class="form-control" id="NTS" name = "NTS" aria-describedby="NTSHelp" placeholder="Inserire Numero Tessera Sanitaria*">
                      <small id="NTSHelp" class="form-text text-muted">*Inserire il codice della tessera sanitaria TEAM.</small>
                    </div>
                </div>
                <div class="form-group">
                    <div class="container">
                        <div class="row">
                            <div class="form-group col p-0" style="margin-right: 1em">
                              <label for="nome">Nome</label>
                              <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome">
                            </div>
                            <div class="form-group col p-0" style="margin-right: 1em">
                              <label for="cognome">Cognome</label>
                              <input type="text" class="form-control" name="cognome" id="cognome" placeholder="Cognome">
                            </div>
                            <div class="form-group col p-0" style="margin-right: 0 !important; width: 100%">
                                <label for="dob">Data di Nascita</label>
                                <input name="dob" type="text" class="form-control" id="datepicker" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="cellulare">Cellulare</label>
                      <input type="text" class="form-control" name="cellulare" id="cellulare" placeholder="Numero di Telefono">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" name="email" id="email" placeholder="Indirizzo Email">
                    </div>
                </div>
                <div class="form-row" style="padding-left: 1.25em">
                <div class="form-check col">
                  <input class="form-check-input" type="radio" name="TipoVisita" id="VisitaSSN" value="1" checked>
                  <label class="form-check-label" for="VisitaSSN">
                    Prestazione Convenzionata SSN
                  </label>
                </div>
                <div class="form-check col">
                  <input class="form-check-input" type="radio" name="TipoVisita" id="VisitaPrivata" value="0">
                  <label class="form-check-label" for="VisitaPrivata">
                    Prestazione Privata
                  </label>
                </div>
                </div>
               
                <div class="form-row" style="padding-top: .75em">
                    <div class="form-group col">
                        <label for="NRicetta">Numero Ricetta</label>
                        <input type="text" class="form-control" name="NRicetta" id="NRicetta" aria-describedby="NRicettaHelp" placeholder="Inserire N. Ricetta*">
                        <small id="NRicettaHELP" class="form-text text-muted">*per la ricetta cartacea inserire i codici S e Y.</small>
                   </div>
                    <div class="form-group col">
                        <label for="studio">Studio</label>
                        <select class="form-control" id="studio" name="studio">
                        </select>
                    </div>
                </div>    
                
                <div class="form-row">
                    <div class="form-group col">
                      <label for="prestazione">Prestazione</label>
                      <select class="form-control" id="prestazione" name="prestazione" aria-describedby="prestazioneHelp">
                      </select>
                      <small id="prestazioneHelp" class="form-text text-muted">*Inserire la prestazione richiesta.</small>
                    </div>
                    <div class="form-group col">
                      <label for="medico">Medico</label>
                      <select class="form-control" id="medico" name="medico" aria-describedby="medicoHelp" placeholder="" disabled>
                          <option id="defaultMedico" value="-1" selected disabled hidden>Scegliere il Medico*</option>

                      </select>
                      <small id="medicoHELP" class="form-text text-muted">*Selezionabile solo per prestazioni private</small>
                    </div>
                </div>
                <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="gdpr" required>
                  <label class="form-check-label" for="gdpr">Preso atto dell'informativa di cui all'art. 13 del GDPR EU 2016/679</label>
                </div>
                <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="privacy" required>
                  <label class="form-check-label" for="privacy">Acconsento al trattamento dei dati personali e relativi allo stato di salute al fine di effettuare la prenotazione della prestazione richiesta</label>
                </div>
                

                <div class="form-check" style="text-align: center; padding: 1.75em 0 0 0;">
                <button type="submit" class="btn btn-primary btn-lg">Invia Prenotazione</button>
                </div>

              </form>
          </div>
        </main>
            
        <script type="text/javascript">document.write(`<script type="text/javascript" src="${pageContext.request.contextPath}/js/prenotazioni.js?v=` + Math.floor((Math.random() * 100) + 1).toString() + `"><\/script>`)</script>
    </body>
</html>
