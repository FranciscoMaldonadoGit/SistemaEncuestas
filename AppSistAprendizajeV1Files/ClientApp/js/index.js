//variables
const uri = '/api/Consultas/ObtenerTodosLosCuestionarios';
const contenedor = document.querySelector('#contenedor_carga');
let todos = [];

//eventos
CargaInicial()
function CargaInicial(){
     getItems()
     setTimeout( () => TardandoEN(contenedor), 2000) 
}

//funciones
function getItems() {
  fetch(servidor+uri)
    .then(response => response.json())
    .then(data => _displayItems(data))
    .catch(error => console.error('Unable to get items.', error));
}


function TardandoEN(contenedor){
     console.log("retardo y ocultar");
     contenedor.style.visibility = 'hidden';
      contenedor.style.opacity = '0'; 
}


function alerta(evt, este){
     evt.preventDefault();
     var nombreCuestionario  = este.innerText; 
     var  idCuestionario= este.getAttribute("data-value"); 
     window.location.href =  `PreguntasExamen.html?nombreCuestionario=${nombreCuestionario}&idCuestionario=${idCuestionario}`;
     //window.location.href = "PreguntasExamen.html?nombreCuestionario="+nombreCuestionario+"&idCuestionario="+idCuestionario;
}

function _displayItems(data) {

     data.forEach(element => {

          let ancore = document.createElement('a'); 
          ancore.appendChild(document.createTextNode(element.nombreCuestionario));
          ancore.setAttribute("data-value", element.idCuestionario);
          ancore.setAttribute("href",  "#");
          ancore.classList.add("listaProyectos","listaProyectos--link");
          ancore.addEventListener("click", function(event){ alerta(event,this) } );

          let li = document.createElement('li'); 
          li.classList.add("listaProyectos__item");
          li.appendChild( ancore );

          var lista  =  document.querySelector(".listaProyectos");
          lista.appendChild(li);

     });

}

// window.onload = getItems;
