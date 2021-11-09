--- ejemplo de alta de columna
ALTER TABLE Preguntas
ADD FechaAlta  datetime  null

ALTER TABLE Preguntas
ADD FechaModificacion   datetime  null

--eliminar tabla
ALTER TABLE Resultados
DROP CONSTRAINT FK_Resultados_Persona;
ALTER TABLE Resultados DROP COLUMN IdPersona;

EXEC sp_columns 'Respuestas'
--ALTER TABLE Cuestionarios
--ADD Activo   bit  null
--update Cuestionarios  set Activo = 1 

--select preg.TextoPregunta,res.TextoRespuesta from Preguntas  preg
--inner join Respuestas  res on preg.IdPregunta  = res.IdPregunta 
--where preg.IdCuestionario  = 1 
