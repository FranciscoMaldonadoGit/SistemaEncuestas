USE [Test]

CREATE TABLE Test
(
	IdPrueba int IDENTITY(1,1) Primary Key,
	NombreExamen varchar(500) not null,
	NoPreguntas  int not null
)

/*Preguntas */
CREATE TABLE Preguntas
(
	IdPregunta int IDENTITY(1,1) Primary Key,
	IdPrueba  int not null,
	NoPregunta  int not null, 
	Pregunta nvarchar(500) not null
)

--Crear las restricciones  Test
ALTER TABLE [dbo].[Preguntas]  
WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Test] 
FOREIGN KEY([IdTest])
REFERENCES [dbo].[Test] ([IdTest])
GO

ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Test]
GO
/*Preguntas  */

/*
3.-  Respuestas
     IdRespuesta  int 
     IdPregunta   int
     IdPrefijoCatalogo    nvarchar(10)
     Respuesta    nvarchar( 500 )
*/

/* Respuestas */

CREATE TABLE Respuestas	
(
	IdRespuesta int IDENTITY(1,1) Primary Key,
	IdPregunta   int not null ,  
	IdPrefijoCatalogo int not null, 
	Respuesta nvarchar(500) not null
)


ALTER TABLE [dbo].[Respuestas]  
WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] 
FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO

ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO

/* Respuestas */


/* Catalogos */

/*
   Catalogos  ( estan prefijos de las preguntas  y mensajes, cuando hay respuesta correcta )
   IdCatalogo  int pk 
   NombreCatalogos    nvarchar( 500 )
   ClaveCatalogo     nvarchar( 10 )
*/

CREATE TABLE Catalogos
(
	IdCatalogo int IDENTITY(1,1) Primary Key,
	NombreCatalogos    nvarchar(500) not null ,  
	ClaveCatalogo      nvarchar(10) not null 
)

ALTER TABLE [dbo].[Respuestas]  
WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Catalogos] 
FOREIGN KEY([IdPrefijoCatalogo])
REFERENCES [dbo].[Catalogos] ([IdCatalogo])
GO

ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO

/* Catalogos */



/* Res correctas
 4.-RespuestasCorrectas
    IdRespuestaCorrecta  int 
    IdPregunta    int 
    IdRespuesta   int */

CREATE TABLE RespuestasCorrectas
(
	IdRespuestaCorrecta  int IDENTITY(1,1) Primary Key,
	IdPregunta			 int not null,  
	IdRespuesta		 int not null
)


ALTER TABLE [dbo].[RespuestasCorrectas]  
WITH CHECK ADD  CONSTRAINT [FK_RespuestasCorrectas_Respuestas] 
FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[Respuestas] ([IdRespuesta])
GO

ALTER TABLE [dbo].[RespuestasCorrectas] CHECK CONSTRAINT [FK_RespuestasCorrectas_Respuestas]
GO 

ALTER TABLE [dbo].[RespuestasCorrectas]  
WITH CHECK ADD  CONSTRAINT [FK_RespuestasCorrectas_Preguntas] 
FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO

ALTER TABLE [dbo].[RespuestasCorrectas] CHECK CONSTRAINT [FK_RespuestasCorrectas_Preguntas]
GO

/*  Res correctas  */


/*	Resultados 
	IdResultados   
    IdPersona      int
    NumContestadas    int 
    NumAciertos   	   int 
    PorcentajeAciertos  int 
    NumFallos     	   int
    NoContestadas  int
    TiempoExamen   time 
*/

CREATE TABLE Resultados
(
	IdResultados    int IDENTITY(1,1) Primary Key,
	IdPersona 		 int not null,  
	NumContestadas	 int not null, 
	NumAciertos   	 int not null,  
	PorcentajeAciertos  int not null,
	NumFallos     	   int not null,
    NoContestadas  int not null,
    TiempoExamen   time null
)

ALTER TABLE [dbo].[Resultados]  
WITH CHECK ADD  CONSTRAINT [FK_Resultados_Persona] 
FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO

ALTER TABLE [dbo].[Resultados] CHECK CONSTRAINT [FK_Resultados_Persona]
GO

/* Resultados */

/*
	 Persona
     IdPersona   int 
     NombrePersona  nvarchar( 500 )
     Edad  int
     Correo   nvarchar( 500 )*/

CREATE TABLE Persona
(
	IdPersona     int IDENTITY(1,1) Primary Key,
	NombrePersona 	nvarchar( 500 ) not null,
	Edad 	 int not null, 
	Correo   	nvarchar( 500 ) not null
)

/*Persona*/





   











