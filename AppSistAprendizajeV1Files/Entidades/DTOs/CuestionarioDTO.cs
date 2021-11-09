using Entidades.Validaciones;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.DTOs
{
    public class CuestionarioDTO
    {
        
        [Required(ErrorMessage = "El campo {0} es requerido")]
        [DiferenteDe0]
        public int IdCuestionario { get; set; }

        [Required(ErrorMessage = "El campo {0} es requerido")]
        public string NombreCuestionario { get; set; }
    }
}
