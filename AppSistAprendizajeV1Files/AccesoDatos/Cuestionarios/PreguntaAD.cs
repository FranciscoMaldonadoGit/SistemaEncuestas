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
    public class PreguntaAD
    {
        private readonly SistAprendizajeContext db;
        public PreguntaAD(SistAprendizajeContext dataBase)
        {
            db = dataBase;
        }

        #region Preguntas

        public async Task<RespuestaResponseDTO<List<PreguntaConRespuestaDTO>>> ObtenerPreguntaPorCuestionario(CuestionarioDTO cuestionarioDto )
        {
            List<PreguntaConRespuestaDTO> ListPreguntaConRespuestaVM = new List<PreguntaConRespuestaDTO>();
            List<Pregunta> ListPreguntaEnt = new List<Pregunta>();
            List<RespuestaDTO> ListRespuestaVM = new List<RespuestaDTO>();

            var resp = new RespuestaResponseDTO<List<PreguntaConRespuestaDTO>>();

            try
            {  
                ListPreguntaEnt = await db.Preguntas.Include(x => x.Respuesta).ThenInclude(x1 => x1.IdPrefijoCatalogoNavigation)
               .Where(x => x.IdCuestionario == cuestionarioDto.IdCuestionario).ToListAsync();

                foreach (Pregunta pregunta in ListPreguntaEnt)
                {
                    foreach (Respuesta respuesta in pregunta.Respuesta)
                    {
                        var prefijo = respuesta.IdPrefijoCatalogoNavigation.Valor; 
                        ListRespuestaVM.Add(new RespuestaDTO
                        {
                            IdRespuesta = respuesta.IdRespuesta,
                            TextoRespuesta = prefijo +" "+respuesta.TextoRespuesta
                        });
                    }

                    ListPreguntaConRespuestaVM.Add(new PreguntaConRespuestaDTO
                    {
                        IdCuestionario = cuestionarioDto.IdCuestionario,
                        NombreCuestionario = cuestionarioDto.NombreCuestionario,
                        IdPregunta = pregunta.IdPregunta,
                        NumeroPreguntaFormat = "Pregunta " + pregunta.NoPregunta,
                        TextoPregunta = pregunta.TextoPregunta,
                        ListTextoRespuesta = ListRespuestaVM
                    });

                    //verificar performance 
                    //.Clear elimina los datos en la lista ya asignada en ListPreguntaConRespuestaVM.ListTextoRespuesta
                    //se crea de esta manera porque asi no las borra la lista ya asignada en ListPreguntaConRespuestaVM.ListTextoRespuesta
                    ListRespuestaVM = new List<RespuestaDTO>();
                }

                resp.Datos = ListPreguntaConRespuestaVM;
                resp.EstausCodigo = 200;
            }
            catch (Exception ex)
            {
                resp.mensaje = ex.Message;
                resp.EstausCodigo = 400; 
            }

            return resp;
        }

        #endregion
    }
}
