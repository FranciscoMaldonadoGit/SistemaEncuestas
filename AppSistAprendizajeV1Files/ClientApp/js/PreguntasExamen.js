//antes de cargar el html
const urlSearchParams = new URLSearchParams(window.location.search);
const params = Object.fromEntries(urlSearchParams.entries());

const DatoSesion = { idCuestionario : params.idCuestionario,
    nombreCuestionario : params.nombreCuestionario  }

let dataTamanio = 0;
const objEnvio ={ "IdCuestionario" : params.idCuestionario , "lContestadasVM" : [] }

//variables
const uriObtienePreguntas = '/api/Consultas/ObtenerPreguntaPorCuestionario';

CargaInicial();
function CargaInicial(){
    //console.log("dentro de metodo carga inicial");
    const btnInicio = document.querySelector(".Inicio"); 
    const btnCorregirExamen = document.querySelector(".CorregirExamen"); 
    const contenedor = document.querySelector('#contenedor_carga');
    const BtnBorrarAvanze =  document.querySelector(".BorrarAvanze")    
    localStorage.setItem("DatoSesion", JSON.stringify(DatoSesion))  

    // const contenedor = document.querySelector('.spinner');

    btnInicio.addEventListener("click", VolverInicio);
    btnCorregirExamen.addEventListener("click", corregirExamen);
    BtnBorrarAvanze.addEventListener("click", BorrarAvanze);

    ObtenerPreguntas();
    setTimeout( () => TardandoEN(contenedor), 2000)
}

function TardandoEN(contenedor){
    contenedor.style.visibility = 'hidden';
	contenedor.style.opacity = '0'; 
}

function BorrarAvanze(){
    if (window.confirm("Estas seguro de borrar tu avanze?")) {
        localStorage.removeItem('Resultados');
    }
}
function corregirExamen(){
    // pendiente de descomentar
    //if(dataTamanio !== objEnvio.lContestadasVM.length){
        // alert("Es necesario contestar todas las preguntas")
        // return; 
   // }

    window.location.href =  " /Resultados.html"; 
}

function VolverInicio(){
    window.location.href =  servidorNavPagina+"/index.html"; 
}

function MarcaDesmarcaRadoio(este){

    let  idPregunta= este.target.getAttribute("data-idPregunta"); 
    let  idRespuesta= este.target.getAttribute("data-idRespuesta"); 

    //añadir solo solo una vez la pregunta //existe la pregunta 
    if(objEnvio.lContestadasVM.some( x => x.idPregunta == idPregunta)){ 

        //aqui se da por hecho que la pregunta existe dentro del arreglo
        // x.idPregunta == idPregunta solo se usa , para buscar
        // x.idRespuesta != idRespuesta para comparar, si no es igual la remplaza
        let BuscaReplazlContestadasVM = objEnvio.lContestadasVM
            .map( (x) => {
            //se busca que respuesta tiene, si la respuesta no es la misma se remplza
            if(x.idPregunta == idPregunta && x.idRespuesta != idRespuesta){
                x.idRespuesta = idRespuesta
            }
            return x;
        })
        //se remplaza el arreglo, porque es posible que se modificara
        objEnvio.lContestadasVM = [...BuscaReplazlContestadasVM]
    }else{
        const objtPreguntaRespuest = { "idPregunta":  idPregunta,"idRespuesta": idRespuesta }
        objEnvio.lContestadasVM.push(objtPreguntaRespuest);
    }
    
    localStorage.setItem("Resultados", JSON.stringify(objEnvio))
}

function _displayItems(data){  
        
    // console.log(data);
    dataTamanio = data.length
    
    data.forEach( element => {
            //console.log(element.numeroPreguntaFormat);
             let h2Tag = document.createElement('h2'); 
             h2Tag.appendChild(document.createTextNode(element.numeroPreguntaFormat));
             h2Tag.classList.add("HeadNombrePregExamen");

             let sectionTag = document.createElement('section'); 
             sectionTag.appendChild(h2Tag);

             var mainTag =  document.querySelector(".contPrincipal");
             mainTag.appendChild(sectionTag);

             //respuestas
             var ulTag = document.createElement('ul'); 
             ulTag.classList.add("listaPreg");
             
             let liTag = document.createElement('li');  
             liTag.appendChild(document.createTextNode(element.textoPregunta));
             ulTag.appendChild(liTag);

             element.listTextoRespuesta.forEach((element0, indice ) => { 
                    /*
                      <input type="radio" id="html" name="fav_language" value="HTML">
                     <label for="html">HTML</label><br>
                    */
                    let inputTag = document.createElement('input'); 
                    inputTag.setAttribute("type", "radio");
                    inputTag.onchange = function(evt){ MarcaDesmarcaRadoio(evt) };
                    inputTag.setAttribute("data-idRespuesta", element0.idRespuesta );
                    inputTag.setAttribute("data-idPregunta",  element.numeroPreguntaFormat.split(" ")[1] );
                    inputTag.setAttribute("name", "respdePregunta"+ element.numeroPreguntaFormat.split(" ")[1] );
                
                    let labelTag = document.createElement('label'); 
                    labelTag.setAttribute("for",  element0.idRespuesta);

                    let liTag = document.createElement('li'); 

                    // if (indice == 0) 
                    //     labelTag.appendChild(document.createTextNode(element.textoPregunta));
                    // else{
                        labelTag.appendChild(document.createTextNode(element0.textoRespuesta));
                    //     liTag.appendChild(inputTag); //solo las respuestas llevab input radio
                    // }

                    liTag.appendChild(inputTag);
                    liTag.appendChild(labelTag);
                    ulTag.appendChild(liTag);
             })

             sectionTag.appendChild(ulTag);

        });
}

function ObtenerPreguntas(){

    fetch(servidor+uriObtienePreguntas, {
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        },
        body: JSON.stringify(DatoSesion)
    }).then(response => response.json())
    //  .then(data => console.log(data))
    .then(data => _displayItems(data))
    .catch(error => console.error('Unable to add item.', error));
}

// window.onload = CargaInicial;

//funcionalidad del radio
//https://desarrolloweb.com/articulos/1448.php