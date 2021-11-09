using AccesoDatos.Cuestionarios;
using AccesoDatos.Models;
using System;

namespace TestConsoleApp
{
    class Program
    {
        //public static SistAprendizajeContext db;
        //public Program (SistAprendizajeContext dataBase)
        //{
        //    db = dataBase; 
        //}

        static  void Main(string[] args)
        {

            //Console.WriteLine("Hello World!");
            SistAprendizajeContext db = new SistAprendizajeContext();
            var lista = new ResultadosAD(db).ObtenerRespuestasCorrectas(1);
            Console.ReadKey(); 
        }
    }
}
