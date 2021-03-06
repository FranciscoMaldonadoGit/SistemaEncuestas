USE [SistAprendizaje]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 10/08/2021 03:24:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCuestionario] [int] NOT NULL,
	[NoPregunta] [int] NOT NULL,
	[TextoPregunta] [nvarchar](500) NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK__Pregunta__754EC09E743F649A] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (1, 1, 1, N'En JavaScript, ¿cuál es la forma correcta de crear un array?', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (2, 1, 2, N'En JavaScript, ¿cómo se muestra una ventana con el mensaje "Hola mundo!"?', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (4, 1, 3, N'JavaScript fue diseñado por?', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (5, 2, 1, N'¿La etiqueta <blockquote> se emplea para definir?', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (6, 2, 2, N'¿Qué etiqueta de HTML se emplea para definir una hoja de estilo interna?', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (7, 2, 3, N'¿En HTML, el atributo longdesc se emplea para? ', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (75379, 1, 4, N'En qué lugar se ejecuta generalmente el código JavaScript?', CAST(N'2021-08-04T20:59:19.250' AS DateTime), CAST(N'2021-08-04T20:59:19.250' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (75380, 1, 5, N' Qué es Zepto?', CAST(N'2021-08-05T07:27:10.753' AS DateTime), CAST(N'2021-08-05T07:27:10.753' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCuestionario], [NoPregunta], [TextoPregunta], [FechaAlta], [FechaModificacion]) VALUES (75381, 1, 6, N'Qué conseguimos con la línea de código evt.preventDefault?', CAST(N'2021-08-05T07:27:13.087' AS DateTime), CAST(N'2021-08-05T07:27:13.087' AS DateTime))
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Test] FOREIGN KEY([IdCuestionario])
REFERENCES [dbo].[Cuestionarios] ([IdCuestionario])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Test]
GO
