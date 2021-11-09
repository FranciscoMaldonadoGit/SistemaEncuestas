using AccesoDatos.Models;
using AutoMapper;
using Entidades.DTOs;

namespace SistAprendizajeV1.Utilidades
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<Cuestionario, CuestionarioDTO>();
        }
    }
}
