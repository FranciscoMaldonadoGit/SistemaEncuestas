using AccesoDatos.Cuestionarios;
using AccesoDatos.Models;
using Entidades.DTOs;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Servicios
{
    public class Consultas : IConsultas
    {
        private SistAprendizajeContext db;
        private ResultadosAD resultadosAD;

        ///inyectar dependencia en proyecto principal 
        public Consultas(SistAprendizajeContext dataBase)
        {
            db = dataBase;
        }
   
        /// <summary>
        ///  Se obtiene informacion, de los fallos y aciertos, se arma objeto con resultados
        /// </summary>
        /// <param name="contestadas"></param>
        /// <returns></returns>
        public async Task<RespuestaResponseDTO<ResultadosDTO>> ObtenerDatosAciertosCuestionarioM(ListContestadasDTO contestadas)
        {
            resultadosAD = new ResultadosAD(db);
            var resp = new RespuestaResponseDTO<ResultadosDTO>();
            int conteoAciertos = 0;
            int conteoFallos = 0;
            int PorcentajeAciertos = 0;
            int NoContestadas = 0;

            try
            {
                var resp0 = await resultadosAD.ObtenerRespuestasCorrectas(contestadas.IdCuestionario);

                if (!resp0.result)
                throw new Exception("Falla al consultar respuestas correctas!: " + resp0.mensaje);

                var listRespuestasCorrectasVM = resp0.Datos;

                if (listRespuestasCorrectasVM.Count > 0)
                {
                    foreach (RespuestasCorrectasDTO respuestasCorrectasVM in listRespuestasCorrectasVM)
                    {
                        if (contestadas.LContestadasVM.Any(x => x.IdRespuesta == respuestasCorrectasVM.IdRespuesta))
                            conteoAciertos++;
                    }
                }

                var preguntasTotales = listRespuestasCorrectasVM.Count();
                //tomando en cuenta que, solo hay una respuesta por pregunta
                //contestadas.Totalpreguntas - conteoAciertos
                conteoFallos = preguntasTotales - conteoAciertos;
                PorcentajeAciertos = (100 * conteoAciertos) / preguntasTotales;
                NoContestadas = preguntasTotales - contestadas.LContestadasVM.Count;

                resp.Datos = new ResultadosDTO
                {
                    Aciertos = conteoAciertos,
                    Fallos = conteoFallos,
                    PorcentajeAciertos = PorcentajeAciertos + "%",
                    Contestadas = contestadas.LContestadasVM.Count,
                    TotalPreguntas = preguntasTotales,
                    TiempoHoras = contestadas.TiempoHoras,
                    TiempoMinutos = contestadas.TiempoMinutos,
                    TiempoSegundos = contestadas.TiempoSegundos
                };
                resp.EstausCodigo = 200;
            }
            catch (Exception ex)
            {
                resp.mensaje = ex.Message;
                resp.EstausCodigo = 400;
            }

            return resp;
        }
    }
}
