using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Validaciones
{
    public class DiferenteDe0 : ValidationAttribute
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"> valor del campo </param>
        /// <param name="validationContext"> acceso al objeto completo que queremos validar </param>
        /// <returns></returns>
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (Convert.ToInt32(value) < 1)
            {
                return new ValidationResult("el campo debe ser mayor a 0");
            }
            return ValidationResult.Success;
        }
    }
}
