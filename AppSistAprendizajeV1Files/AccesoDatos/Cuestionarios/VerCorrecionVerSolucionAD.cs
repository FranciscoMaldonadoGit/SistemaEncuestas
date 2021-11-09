using AccesoDatos.Models;
using Entidades.DTOs;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos.Cuestionarios
{
    public class VerCorrecionVerSolucionAD
    {
        private readonly SistAprendizajeContext db;
        public VerCorrecionVerSolucionAD(SistAprendizajeContext dataBase)
        {
            db = dataBase;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="listContestadasVerCorrecionVM"></param>
        /// <returns></returns>
        public async Task<RespuestaResponseDTO<List<PreguntaConRespuestaVerCorrecionDTO>>> ObtenerCorreccionPreguntas
        (ListContestadasVerCorrecionDTO listContestadasVerCorrecionVM)
        {
            List<PreguntaConRespuestaVerCorrecionDTO> ListPreguntaConRespuestaVerCorrecionVM = new List<PreguntaConRespuestaVerCorrecionDTO>();
            List<Pregunta> ListPreguntaEnt = new List<Pregunta>();
            List<RespuestaVerCorrecionDTO> ListRespuestaVerCorrecionVM = new List<RespuestaVerCorrecionDTO>();

            var resp = new RespuestaResponseDTO<List<PreguntaConRespuestaVerCorrecionDTO>>();
            //resp.result = true;

            try
            {
                if (listContestadasVerCorrecionVM.IdCuestionario == 0 || listContestadasVerCorrecionVM.NombreCuestionario == null)
                    throw new Exception("Faltan parametros para consultar preguntas!");

                ListPreguntaEnt = await db.Preguntas.Include(x => x.Respuesta)
               .Where(x => x.IdCuestionario == listContestadasVerCorrecionVM.IdCuestionario).ToListAsync();

                var queryString =db.Preguntas.Include(x => x.Respuesta)
              .Where(x => x.IdCuestionario == listContestadasVerCorrecionVM.IdCuestionario).ToQueryString();

                foreach (Pregunta pregunta in ListPreguntaEnt)
                {

                    var respuestaSolucion = pregunta.Respuesta.FirstOrDefault(x => x.EsCorrecta == true);

                    if (listContestadasVerCorrecionVM.LContestadasVM.Any(x => x.IdPregunta == pregunta.IdPregunta))
                    {
                        foreach (Respuesta respuesta in pregunta.Respuesta)
                        {
                            if (listContestadasVerCorrecionVM.LContestadasVM.Any(x => x.IdRespuesta == respuesta.IdRespuesta))
                            {
                                ListRespuestaVerCorrecionVM.Add(new RespuestaVerCorrecionDTO
                                {
                                    IdRespuesta = respuesta.IdRespuesta,
                                    TextoRespuesta = "Tu respuesta: " + respuesta.TextoRespuesta,
                                    TextoSiFueRespuestCorrecta = respuesta.EsCorrecta ? "¡Respuesta correcta!" : "¡Respuesta errónea!",
                                    TextoRespuestCorrecta =respuestaSolucion != null ? "Solución: "+respuestaSolucion.TextoRespuesta : ""
                                });
                            }
                        }
                    }
                    else
                    {
                        ListRespuestaVerCorrecionVM.Add(new RespuestaVerCorrecionDTO
                        {
                            IdRespuesta = 0,
                            TextoRespuesta = "Tu respuesta: Pregunta no contestada",
                            TextoSiFueRespuestCorrecta = "¡Respuesta errónea!",
                            TextoRespuestCorrecta = respuestaSolucion != null ? "Solución: "+respuestaSolucion.TextoRespuesta : ""
                        });
                    }

                    ListPreguntaConRespuestaVerCorrecionVM.Add(new PreguntaConRespuestaVerCorrecionDTO
                    {
                        IdCuestionario = listContestadasVerCorrecionVM.IdCuestionario,
                        NombreCuestionario = listContestadasVerCorrecionVM.NombreCuestionario,
                        IdPregunta = pregunta.IdPregunta,
                        NumeroPreguntaFormat = "Pregunta " + pregunta.NoPregunta,
                        TextoPregunta = pregunta.TextoPregunta,
                        ListTextoTuRespuesta = ListRespuestaVerCorrecionVM
                    });

                    //verificar performance 
                    //.Clear elimina los datos en la lista ya asignada en ListPreguntaConRespuestaVM.ListTextoRespuesta
                    //se crea de esta manera porque asi no las borra la lista ya asignada en ListPreguntaConRespuestaVM.ListTextoRespuesta
                    ListRespuestaVerCorrecionVM = new List<RespuestaVerCorrecionDTO>();
                }

                resp.Datos = ListPreguntaConRespuestaVerCorrecionVM;
                resp.EstausCodigo = 200; 
            }
            catch (Exception ex)
            {
                resp.mensaje = ex.Message;
                //resp.result = false;
                resp.EstausCodigo = 400;
            }

            return resp;
        }
    }
}
