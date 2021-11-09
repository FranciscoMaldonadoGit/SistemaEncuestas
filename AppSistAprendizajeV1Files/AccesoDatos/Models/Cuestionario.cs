using System;
using System.Collections.Generic;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class Cuestionario
    {
        public Cuestionario()
        {
            Pregunta = new HashSet<Pregunta>();
        }

        public int IdCuestionario { get; set; }
        public string NombreCuestionario { get; set; }
        public int NoPreguntas { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public bool Activo { get; set; }

        public virtual ICollection<Pregunta> Pregunta { get; set; }
    }
}
