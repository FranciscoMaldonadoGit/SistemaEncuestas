using Entidades.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public interface IConsultas
    {
        public Task<RespuestaResponseDTO<ResultadosDTO>> ObtenerDatosAciertosCuestionarioM(ListContestadasDTO contestadas);
    }
}
