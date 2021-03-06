USE [SistAprendizaje]
GO
/****** Object:  Table [dbo].[Resultados]    Script Date: 10/08/2021 03:24:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados](
	[IdResultados] [int] IDENTITY(1,1) NOT NULL,
	[NumContestadas] [int] NOT NULL,
	[NumAciertos] [int] NOT NULL,
	[PorcentajeAciertos] [int] NOT NULL,
	[NumFallos] [int] NOT NULL,
	[NoContestadas] [int] NOT NULL,
	[TiempoCuestionario] [time](7) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdResultados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
