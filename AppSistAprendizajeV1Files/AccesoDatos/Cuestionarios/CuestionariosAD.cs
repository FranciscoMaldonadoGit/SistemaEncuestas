using AccesoDatos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Entidades.DTOs;

namespace AccesoDatos
{
    public class CuestionariosAD
    {
        private readonly SistAprendizajeContext db;
        
        public CuestionariosAD(SistAprendizajeContext dataBase)
        {
            db = dataBase;
        }

        #region Cuestionarios
        /// <summary>
        /// Se obtiene el listado de nombres de los examenes, desde bd con ef core
        /// </summary>
        /// <returns></returns>
        public async Task<RespuestaResponseDTO<List<Cuestionario>>> ObtenerTodosLosCuestionarios()
        {  
            var resp = new RespuestaResponseDTO<List<Cuestionario>>();
            
            try
            {
                var ListCuestionaEnt1 = await db.Cuestionarios.Where(x => x.Activo == true).ToListAsync();
               
                if (ListCuestionaEnt1.Count > 0)
                {   
                    resp.Datos = ListCuestionaEnt1;
                    resp.EstausCodigo = 200;
                }
                else
                {
                    throw new Exception("No hay registros!");
                }
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
