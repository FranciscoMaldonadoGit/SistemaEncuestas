USE [Test]
CREATE TABLE Test
(
	IdPrueba int IDENTITY(1,1) Primary Key,
	NombreExamen varchar(500) NULL,
	NoPreguntas  int
)

/*Preguntas  */
CREATE TABLE Preguntas
(
	IdPregunta int IDENTITY(1,1) Primary Key,
	IdTest  int,
	NoPregunta  int, 
	Pregunta nvarchar(500)
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
