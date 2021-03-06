USE [SistAprendizaje]
GO
/****** Object:  Table [dbo].[Cuestionarios]    Script Date: 10/08/2021 03:24:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuestionarios](
	[IdCuestionario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCuestionario] [nvarchar](500) NOT NULL,
	[NoPreguntas] [int] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK__Test__0E8DC9BEEBCD61F5] PRIMARY KEY CLUSTERED 
(
	[IdCuestionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cuestionarios] ON 

INSERT [dbo].[Cuestionarios] ([IdCuestionario], [NombreCuestionario], [NoPreguntas], [FechaAlta], [FechaModificacion], [Activo]) VALUES (1, N'Javascrip Completo', 20, CAST(N'2021-07-24T08:30:08.153' AS DateTime), CAST(N'2021-07-24T08:30:08.153' AS DateTime), 1)
INSERT [dbo].[Cuestionarios] ([IdCuestionario], [NombreCuestionario], [NoPreguntas], [FechaAlta], [FechaModificacion], [Activo]) VALUES (2, N'HTML completo', 10, CAST(N'2021-07-24T08:30:08.153' AS DateTime), CAST(N'2021-07-24T08:30:08.153' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Cuestionarios] OFF
