using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.DTOs
{
    public class RespuestaResponseDTO<T>
    {
        public bool result { get; set; }
        public string mensaje { get; set; }
        public int EstausCodigo { get; set; }

        public T Datos { get; set; }
    }
}
