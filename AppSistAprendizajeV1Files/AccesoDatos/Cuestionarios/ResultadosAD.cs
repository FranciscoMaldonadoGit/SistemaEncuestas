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
    public class ResultadosAD
    {
        private readonly SistAprendizajeContext db;
        public ResultadosAD(SistAprendizajeContext dataBase)
        {
            db = dataBase;
        }
        
        public async Task<RespuestaResponseDTO<List<RespuestasCorrectasDTO>>> ObtenerRespuestasCorrectas(int IdCuestionario)
        {
            var resp =new RespuestaResponseDTO<List<RespuestasCorrectasDTO>>();
            var ListRespuestasCorrectasVM = new List<RespuestasCorrectasDTO>();
            resp.result = true;
            try
            {   
                var respuestasCorrectas = await db.Preguntas.Include(x => x.Respuesta)
                                                .Where(x => x.IdCuestionario == IdCuestionario).ToListAsync();

                ListRespuestasCorrectasVM = (from Pregunta in respuestasCorrectas
                        select new RespuestasCorrectasDTO
                        {
                            IdCuestionario = Pregunta.IdCuestionario,
                            IdPregunta = Pregunta.IdPregunta,
                            IdRespuesta = Pregunta.Respuesta.FirstOrDefault(x  => x.EsCorrecta == true ).IdRespuesta
                        }).ToList();

                if (respuestasCorrectas.Count == 0)
                    throw new Exception("Faltan indicar las respuestas correctas, para las preguntas!");

                resp.Datos = ListRespuestasCorrectasVM;
            }
            catch (Exception ex)
            {
                resp.mensaje = ex.Message;
                resp.result = false;
            }
            return resp;
        }
    }
}
