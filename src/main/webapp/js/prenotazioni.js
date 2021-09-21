/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//Visita Convenzionata SSN
document.prenotazione.TipoVisita[0].addEventListener('change', () => {
    document.getElementById("NRicetta").disabled = false;
    document.getElementById("NRicetta").value = "";
    document.getElementById("NRicetta").placeholder = "Inserire N. Ricetta elettronica*";
    document.getElementById("NRicettaHELP").innerHTML = "*per la ricetta cartacea inserire i codici S e Y.";
    document.getElementById("defaultMedico").selected = 'selected';
   
})

//Visita Privata
document.prenotazione.TipoVisita[1].addEventListener('change', () => {
    document.getElementById("NRicetta").disabled = true;
    document.getElementById("NRicetta").value = "";
    document.getElementById("NRicetta").placeholder = "Per visite private non è necessario il numero della ricetta.";
    document.getElementById("NRicettaHELP").innerHTML = "";
    document.getElementById("defaultMedico").selected = 'selected';
    
    
})

function getMedici(){
    
        $.get(ctx + "/Servlet/MediciPrestazione?studio=" 
            + document.getElementById("studio").value 
            + "&visita=" + document.getElementById("prestazione").value, (data, status) => {
            
            let selectMedici = `<option id="defaultMedico" value="-1" selected disabled hidden>Scegliere il Medico*</option>`
            

            data.forEach((el) => {
                selectMedici = selectMedici + `\n<option value="${el.ID}">${el.nome} ${el.cognome}</option>`;
            })
            
            document.getElementById("medico").innerHTML = selectMedici
        });
}

document.getElementById("formPrenotazione").addEventListener('change', () => {
     
    if(document.prenotazione.TipoVisita.value == 1) {
        document.getElementById("medico").disabled = true;
    } else if(document.prenotazione.TipoVisita.value == 0 && document.getElementById("studio").value != -1 && document.getElementById("prestazione").value != -1) {
        document.getElementById("medico").disabled = false;
    } 
})

document.getElementById("studio").addEventListener('change', () => {
    if(document.getElementById("studio").value != -1 && document.getElementById("prestazione").value != -1) getMedici();
    
})
document.getElementById("prestazione").addEventListener('change', () => {
    if(document.getElementById("studio").value != -1 && document.getElementById("prestazione").value != -1) getMedici();
})


window.onload = () => {
    
    let selectStudio = `<option id="defaultStudio" value="-1" selected disabled hidden>Scegliere lo studio*</option>`
    
    $.get(ctx + "/Servlet/Studi", (data, status) => {
        
       console.log(status)
       data.forEach((el) => {
           selectStudio = selectStudio + `\n<option value="${el.ID}">${el.nome}</option>`
       })
       
    document.getElementById("studio").innerHTML = selectStudio
    });
    
    let selectPrestazione = `<option value="-1" selected disabled hidden>Inserire Prestazione*</option>`
    
    $.get(ctx + "/Servlet/Visite", (data, status) => {
        
        console.log(status)
        data.forEach((el) => {
            selectPrestazione = selectPrestazione + `\n<option value="${el.ID}">Visita ${el.nome}</option>`;
        })
        
    document.getElementById("prestazione").innerHTML = selectPrestazione
    });
    
}


$('#datepicker').datepicker({
    uiLibrary: 'bootstrap4',
    format: 'yyyy-mm-dd',
    locale: 'it-it',
    footer: true, 
    modal: true, 
    header: true,
    maxDate: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()),
    weekStartDay: 1
   
});

