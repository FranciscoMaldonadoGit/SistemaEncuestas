IdPregunta	IdRespuesta
1			3	correcta
2			5	correcta
4			10  no correcta
75379		0	no contestada
75380		0	no contestada
75381		0	no contestada


​/api​/Consultas​/ObtenerDatosAciertosCuestionario
{
  "IdCuestionario": 1,
  "lContestadasVM": [
    {
      "idPregunta":  1,
      "idRespuesta": 3
    },
  {
      "idPregunta":  2,
      "idRespuesta": 5
    },
  {
      "idPregunta":  4,
      "idRespuesta": 10
    }
  ]
}


​/api​/Consultas​/ObtenerCorreccionPreguntas
{
  "IdCuestionario": 1,
  "nombreCuestionario": "Javascrip Completo",
  "lContestadasVM": [
    {
      "idPregunta":  1,
      "idRespuesta": 3
    },
  {
      "idPregunta":  2,
      "idRespuesta": 5
    },
  {
      "idPregunta":  4,
      "idRespuesta": 10
    }
  ]
}

{
    "idCuestionario": 1,
    "nombreCuestionario": "Javascrip Completo"
}


use [SistAprendizaje]
--select * from Catalogos 
--select * from Cuestionarios
--select * from Preguntas
--select * from Respuestas
--select * from Resultados
--select * from Persona

select  c.NombreCuestionario,c.IdCuestionario,p.IdPregunta, r.IdRespuesta,p.TextoPregunta,r.TextoRespuesta,r.esCorrecta
---, * 
from Cuestionarios  c 
inner join Preguntas p on c.IdCuestionario = p.IdCuestionario
inner join Respuestas r on r.IdPregunta = p.IdPregunta
where c.IdCuestionario = 1 

--delete from Preguntas  where IdPregunta >  7 
--delete from Respuestas where IdRespuesta > 25 

select * from Preguntas
select * from Respuestas
--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(1,3)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(2,5)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(4,11)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(5,16)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(6,20)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(6,20)

--insert into RespuestasCorrectas( IdPregunta , IdRespuesta)
--values(6,22)


DECLARE @__IdCuestionario_0 int = 1;

SELECT [p].[IdPregunta], [p].[FechaAlta], [p].[FechaModificacion], [p].[IdCuestionario], [p].[NoPregunta], [p].[TextoPregunta], [r].[IdRespuesta], [r].[esCorrecta], [r].[FechaAlta], [r].[FechaModificacion], [r].[IdPrefijoCatalogo], [r].[IdPregunta], [r].[TextoRespuesta]
FROM [Preguntas] AS [p]
LEFT JOIN [Respuestas] AS [r] ON [p].[IdPregunta] = [r].[IdPregunta]
WHERE [p].[IdCuestionario] = @__IdCuestionario_0
ORDER BY [p].[IdPregunta], [r].[IdRespuesta]


C:\FranciscoMaldonadoBecerra\SistemaEncuestas\AppSistAprendizajeV1Files\ScriptBD









