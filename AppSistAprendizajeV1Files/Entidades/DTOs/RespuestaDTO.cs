using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.DTOs
{
    public class RespuestaDTO
    {
        public int IdRespuesta { get; set; }
        public string TextoRespuesta { get; set; }
        //public bool Contestado { get; set; }
    }

    public class RespuestaVerCorrecionDTO
    {
        public int IdRespuesta { get; set; }
        public string TextoRespuesta { get; set; }
        public string TextoSiFueRespuestCorrecta { get; set; }
        public string TextoRespuestCorrecta { get; set; }

    }

}
