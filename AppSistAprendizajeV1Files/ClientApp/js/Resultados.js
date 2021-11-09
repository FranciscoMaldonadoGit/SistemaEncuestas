
//variables
const uriObtienePreguntas = '/api/Consultas/ObtenerDatosAciertosCuestionario';
const ulTag =  document.querySelector(".listaRes"); 
const objRes = localStorage.getItem("Resultados");
const btnInicio = document.querySelector(".Inicio"); 
const btnVolverIntentarlo = document.querySelector(".VolverIntentarlo"); 
const btnVerCorrecion = document.querySelector(".VerCorrecion"); 

CargaInicial();
function CargaInicial(){

    btnInicio.addEventListener("click", VolverInicio);
    btnVerCorrecion.addEventListener("click", VerCorrecion); 

    btnVolverIntentarlo.addEventListener("click", function(){
          window.history.back();
    });

    // console.log(objRes);
    if(objRes  !==  null )
        ObtenerDatosAciertosCuestionario(objRes)
    else{
        let liTag = document.createElement('li');  status
        liTag.classList.add("textoError")
        liTag.appendChild(document.createTextNode("No hay datos, contesta preguntas de un examen"));
        ulTag.appendChild(liTag);
    }   
}

function VolverInicio(){
    window.location.href =  servidorNavPagina+"/index.html"; 
}

function VerCorrecion(){
    window.location.href =   servidorNavPagina+"/VerCorreccion.html"; 
}

function ObtenerDatosAciertosCuestionario(objResParam){

    fetch(servidor+uriObtienePreguntas, {
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        },
        body: objResParam//JSON.stringify(objResParam)
    }).then(response => response.json())
    //.then(data => console.log(data))
    .then(data => _displayItems(data))
    .catch(error => console.error('Unable to add item.', error));
}


function _displayItems(data){

    // console.log("dentro de _displayItems")
    // console.log(data);
    
    // {
    //     "aciertos": 2,
    //     "fallos": 4,
    //     "porcentajeAciertos": "33%",
    //     "contestadas": 3,
    //     "totalPreguntas": 6,
    //     "tiempoHoras": 0,
    //     "tiempoMinutos": 0,
    //     "tiempoSegundos": 0
    //   }

    let primeraLinea = `Contestadas ${data.contestadas}  de  ${data.totalPreguntas}`
    let porcentajeAciertos = `Porcentaje de aciertos ${data.porcentajeAciertos}`
    let Aciertos = `Aciertos ${data.aciertos}`
    let Fallos = `Fallos ${data.fallos}`
    let NoContestadas = data.totalPreguntas - data.contestadas
    let NoContestadasStr = `No contestadas ${NoContestadas}`
    let TiempoInvertido = `Horas : ${data.tiempoHoras}, Minutos : ${data.tiempoMinutos}, Segundos : ${data.tiempoSegundos}`

    let liTag = document.createElement('li');  
    liTag.appendChild(document.createTextNode(primeraLinea));
    ulTag.appendChild(liTag);

    let liTag2 = document.createElement('li');  
    liTag2.appendChild(document.createTextNode(porcentajeAciertos));
    ulTag.appendChild(liTag2);

    let liTag3 = document.createElement('li');  
    liTag3.appendChild(document.createTextNode(Aciertos));
    ulTag.appendChild(liTag3);

    let liTag4 = document.createElement('li');  
    liTag4.appendChild(document.createTextNode(Fallos));
    ulTag.appendChild(liTag4);
        
    let liTag5 = document.createElement('li');  
    liTag5.appendChild(document.createTextNode(NoContestadasStr));
    ulTag.appendChild(liTag5);

    let liTag6 = document.createElement('li');  
    liTag6.appendChild(document.createTextNode(TiempoInvertido));
    ulTag.appendChild(liTag6);
}
