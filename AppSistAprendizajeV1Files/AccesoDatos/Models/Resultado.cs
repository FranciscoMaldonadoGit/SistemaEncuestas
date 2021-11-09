using System;
using System.Collections.Generic;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class Resultado
    {
        public int IdResultados { get; set; }
        public int NumContestadas { get; set; }
        public int NumAciertos { get; set; }
        public int PorcentajeAciertos { get; set; }
        public int NumFallos { get; set; }
        public int NoContestadas { get; set; }
        public TimeSpan? TiempoCuestionario { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
