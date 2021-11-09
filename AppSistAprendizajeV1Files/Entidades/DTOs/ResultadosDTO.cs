using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.DTOs
{
    public class ResultadosDTO
    {
        public int Aciertos { get; set; }
        public int Fallos { get; set; }
        public string PorcentajeAciertos { get; set; }
        public int Contestadas { get; set; }
        public int TotalPreguntas { get; set; }
        public int TiempoHoras { get; set; }
        public int TiempoMinutos { get; set; }
        public int TiempoSegundos { get; set; }
    }
}
