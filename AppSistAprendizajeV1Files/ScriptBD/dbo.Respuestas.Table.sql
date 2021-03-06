USE [SistAprendizaje]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 10/08/2021 03:24:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdPrefijoCatalogo] [int] NOT NULL,
	[TextoRespuesta] [nvarchar](500) NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[esCorrecta] [bit] NOT NULL,
 CONSTRAINT [PK__Respuest__D34801987295CEE6] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (1, 1, 1, N'var txt = new Array:1=("tim"),2=("kim"),3=("jim")', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (2, 1, 2, N'var txt = new Array(1="tim",2="kim",3="jim")', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (3, 1, 3, N'var txt = new Array("tim","kim","jim")', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (4, 1, 4, N'var txt = new Array(1:"tim",2:"kim",3:"jim")', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (5, 2, 1, N'alert("Hola mundo!");', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (6, 2, 2, N'alertBox = "Hola mundo!";', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (7, 2, 3, N'alertBox("Hola mundo!);', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (8, 2, 4, N'msgBox("Hola mundo!);', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (9, 4, 1, N'Bill Gates', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (10, 4, 2, N'Bjarne Stroustrup', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (11, 4, 3, N'Brendan Eich', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (12, 4, 4, N'Dennis M. Ritchie', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (13, 5, 1, N'Un bloque de código', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (14, 5, 2, N'Un formulario de búsqueda', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (15, 5, 3, N'Un párrafo', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (16, 5, 4, N'Una cita', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (17, 6, 1, N'<css>', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (18, 6, 2, N'<link>', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (19, 6, 3, N'<script>', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (20, 6, 4, N'<style>', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (21, 7, 1, N'Proporcionar el texto de una descripción más larga que la definida con el atributo alt', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (22, 7, 2, N'Indicar la URL de una página web donde se proporcina una descripción larga de la imagen', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (23, 7, 3, N'Indicar la URL de una imagen que complementa el texto de un párrafo', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (24, 7, 4, N'Las anteriores respuestas no son correctas', CAST(N'2021-07-24T09:00:40.910' AS DateTime), CAST(N'2021-07-24T09:00:40.910' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301500, 75379, 1, N'Servidor', CAST(N'2021-08-04T20:59:19.250' AS DateTime), CAST(N'2021-08-04T20:59:19.250' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301501, 75379, 2, N'Cliente (en el propio navegador de internet)', CAST(N'2021-08-04T20:59:19.250' AS DateTime), CAST(N'2021-08-04T20:59:19.250' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301502, 75379, 3, N'sistema operativo', CAST(N'2021-08-04T20:59:19.250' AS DateTime), CAST(N'2021-08-04T20:59:19.250' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301503, 75379, 4, N'movil', CAST(N'2021-08-04T20:59:19.250' AS DateTime), CAST(N'2021-08-04T20:59:19.250' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301504, 75380, 1, N'Librería comprimida de jQuery para Móviles', CAST(N'2021-08-05T07:27:10.753' AS DateTime), CAST(N'2021-08-05T07:27:10.753' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301505, 75380, 2, N'Un objeto del API de Javascript', CAST(N'2021-08-05T07:27:10.783' AS DateTime), CAST(N'2021-08-05T07:27:10.783' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301506, 75380, 3, N'Una librería javascript  correcta', CAST(N'2021-08-05T07:27:10.783' AS DateTime), CAST(N'2021-08-05T07:27:10.783' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301507, 75380, 4, N'Nada relacionado con Javascript', CAST(N'2021-08-05T07:27:10.783' AS DateTime), CAST(N'2021-08-05T07:27:10.783' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301508, 75381, 1, N'Lanza un evento llamado preventDefault. correcta', CAST(N'2021-08-05T07:27:13.087' AS DateTime), CAST(N'2021-08-05T07:27:13.087' AS DateTime), 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301509, 75381, 2, N'Ejecutar un método que habrá que definir y se llamará preventDefault', CAST(N'2021-08-05T07:27:13.087' AS DateTime), CAST(N'2021-08-05T07:27:13.087' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301510, 75381, 3, N'Desasignar la respuesta por defecto de un evento', CAST(N'2021-08-05T07:27:13.087' AS DateTime), CAST(N'2021-08-05T07:27:13.087' AS DateTime), 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [IdPrefijoCatalogo], [TextoRespuesta], [FechaAlta], [FechaModificacion], [esCorrecta]) VALUES (301511, 75381, 4, N'Ninguna de las tres anteriores es correcta', CAST(N'2021-08-05T07:27:13.087' AS DateTime), CAST(N'2021-08-05T07:27:13.087' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
ALTER TABLE [dbo].[Respuestas] ADD  CONSTRAINT [DF_Respuestas_esCorrecta]  DEFAULT ((0)) FOR [esCorrecta]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Catalogos] FOREIGN KEY([IdPrefijoCatalogo])
REFERENCES [dbo].[Catalogos] ([IdCatalogo])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Catalogos]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
