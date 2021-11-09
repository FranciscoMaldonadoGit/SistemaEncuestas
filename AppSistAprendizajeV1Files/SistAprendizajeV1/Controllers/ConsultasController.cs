using AccesoDatos;
using AccesoDatos.Cuestionarios;
using AccesoDatos.Models;
using AutoMapper;
using Entidades.DTOs;
using Microsoft.AspNetCore.Mvc;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistAprendizajeV1.Controllers
{
    [ApiController]
    [Route("api/[controller]/")]
    public class ConsultasController : ControllerBase
    {
        private CuestionariosAD consultasAD;
        private PreguntaAD preguntaAD;
        private ResultadosAD resultadosAD;
        private VerCorrecionVerSolucionAD verCorrecionAD;
        private SistAprendizajeContext db;
        private IConsultas consultas;
        private IMapper mapper;

        public ConsultasController(SistAprendizajeContext dataBase, IConsultas Paramconsultas, IMapper Parammapper)
        {
            db = dataBase;
            consultas = Paramconsultas;
            mapper = Parammapper;
        }

        /// <summary>
        /// Pantalla al iniciar cuestionario "InicioListadoExamenes" : 
        /// Se obtiene el listado de nombres de los examenes
        /// </summary>
        /// <returns></returns>
        [HttpGet()]
        [Route("ObtenerTodosLosCuestionarios")]
        public async Task<IActionResult> ObtenerTodosLosCuestionarios()
        {
            consultasAD = new CuestionariosAD(db);
            var ObtenerTodos = await consultasAD.ObtenerTodosLosCuestionarios();

            if (ObtenerTodos.EstausCodigo == 200)
                return Ok(mapper.Map<List<CuestionarioDTO>>(ObtenerTodos.Datos));

            if (ObtenerTodos.EstausCodigo == 400)
                return BadRequest(ObtenerTodos.mensaje);

            return NoContent();
        }

        /// <summary>
        /// Preguntas del cuestionario "PreguntasPorExamen"
        /// Se obtienen las preguntas por examen
        /// </summary>
        /// <param name="cuestionarioDTO"></param>
        /// <returns></returns>
        [HttpPost()]
        [Route("ObtenerPreguntaPorCuestionario")]
        public async Task<IActionResult> ObtenerPreguntaPorCuestionario([FromBody] CuestionarioDTO cuestionarioDTO)
        {
            preguntaAD = new PreguntaAD(db);
            var ObtenerPregunta = await preguntaAD.ObtenerPreguntaPorCuestionario(cuestionarioDTO);

            if (ObtenerPregunta.EstausCodigo == 200)
                return Ok(ObtenerPregunta.Datos);

            if (ObtenerPregunta.EstausCodigo == 400)
                return BadRequest(ObtenerPregunta.mensaje);

            return NoContent();
        }

        /// <summary>
        /// Pantalla Corregir examen
        /// Se obtiene informacion, de los fallos y aciertos
        /// </summary>
        /// <param name="listcontestadasDTO"></param>
        /// <returns></returns>
        [HttpPost()]
        [Route("ObtenerDatosAciertosCuestionario")]
        public async Task<IActionResult> ObtenerDatosAciertosCuestionario([FromBody] ListContestadasDTO listcontestadasDTO)
        { 
            consultas = new Consultas(db);
            var ObtenerDatos = await consultas.ObtenerDatosAciertosCuestionarioM(listcontestadasDTO);
            if (ObtenerDatos.EstausCodigo == 200)
                return Ok(ObtenerDatos.Datos);

            if (ObtenerDatos.EstausCodigo == 400)
                return BadRequest(ObtenerDatos.mensaje);

            return NoContent();
        }

        /// <summary>
        /// Pantalla Ver correcion : muestra si la respuesta fue correcta
        /// Pantalla Ver solucion :   muestra si la respuesta fue correcta y la respuesta correcta
        /// </summary>
        /// <param name="listContestadasVerCorrecionDTO"></param>
        /// <returns></returns>
        [HttpPost()]
        [Route("ObtenerCorreccionPreguntas")]
        public async Task<IActionResult>  ObtenerCorreccionPreguntas([FromBody] ListContestadasVerCorrecionDTO listContestadasVerCorrecionDTO)
        {
            verCorrecionAD = new VerCorrecionVerSolucionAD(db);
            var ObtenerCorreccion = await verCorrecionAD.ObtenerCorreccionPreguntas(listContestadasVerCorrecionDTO);
            if (ObtenerCorreccion.EstausCodigo == 200)
                return Ok(ObtenerCorreccion.Datos);

            if (ObtenerCorreccion.EstausCodigo == 400)
                return BadRequest(ObtenerCorreccion.mensaje);

            return NoContent();
        }
    }


}
