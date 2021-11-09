using System;
using System.Collections.Generic;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class Catalogo
    {
        public Catalogo()
        {
            Respuesta = new HashSet<Respuesta>();
        }

        public int IdCatalogo { get; set; }
        public string NombreCatalogos { get; set; }
        public string ClaveCatalogo { get; set; }
        public string Valor { get; set; }

        public virtual ICollection<Respuesta> Respuesta { get; set; }
    }
}
