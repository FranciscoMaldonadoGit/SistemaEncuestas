using System;
using System.Collections.Generic;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class Pregunta
    {
        public Pregunta()
        {
            Respuesta = new HashSet<Respuesta>();
        }

        public int IdPregunta { get; set; }
        public int IdCuestionario { get; set; }
        public int NoPregunta { get; set; }
        public string TextoPregunta { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public virtual Cuestionario IdCuestionarioNavigation { get; set; }
        public virtual ICollection<Respuesta> Respuesta { get; set; }
    }
}
