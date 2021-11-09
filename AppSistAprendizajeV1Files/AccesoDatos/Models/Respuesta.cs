using System;
using System.Collections.Generic;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class Respuesta
    {
        public int IdRespuesta { get; set; }
        public int IdPregunta { get; set; }
        public int IdPrefijoCatalogo { get; set; }
        public string TextoRespuesta { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public bool EsCorrecta { get; set; }

        public virtual Catalogo IdPrefijoCatalogoNavigation { get; set; }
        public virtual Pregunta IdPreguntaNavigation { get; set; }
    }
}
