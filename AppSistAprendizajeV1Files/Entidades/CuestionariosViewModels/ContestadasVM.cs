//using Entidades.Validaciones;
//using System;
//using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace Entidades.CuestionariosViewModels
//{
//    public class ListContestadasVM
//    {
//        [Required(ErrorMessage = "El campo {0} es requerido")]
//        [DiferenteDe0]
//        public int IdCuestionario { get; set; }
        
//        public int TiempoHoras { get; set; }
    
//        public int TiempoMinutos { get; set; }

//        public int TiempoSegundos { get; set; }

//        [Required(ErrorMessage = "El campo lista {0} es requerido")]
//        public List<ContestadasVM> LContestadasVM { get; set; }
//    }

//    public class ListContestadasVerCorrecionVM
//    {
//        [Required(ErrorMessage = "El campo {0} es requerido")]
//        [DiferenteDe0]
//        public int IdCuestionario { get; set; }

//        [Required(ErrorMessage = "El campo {0} es requerido")]
//        public string NombreCuestionario { get; set; }
//        public List<ContestadasVM> LContestadasVM { get; set; }
//    }

//    public class ContestadasVM
//    {
//        [Required(ErrorMessage = "El campo {0} es requerido")]
//        [DiferenteDe0]
//        public int IdPregunta { get; set; }

//        [Required(ErrorMessage = "El campo {0} es requerido")]
//        [DiferenteDe0]
//        public int IdRespuesta { get; set; }
//    }
//}
