USE [SistAprendizaje]
GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 10/08/2021 03:24:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogos](
	[IdCatalogo] [int] IDENTITY(1,1) NOT NULL,
	[NombreCatalogos] [nvarchar](500) NOT NULL,
	[ClaveCatalogo] [nvarchar](10) NOT NULL,
	[Valor] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK__Catalogo__FD0AC26CD5A0D1D5] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalogos] ON 

INSERT [dbo].[Catalogos] ([IdCatalogo], [NombreCatalogos], [ClaveCatalogo], [Valor]) VALUES (1, N'PrefijoRespuestasLetra', N'01', N'a)')
INSERT [dbo].[Catalogos] ([IdCatalogo], [NombreCatalogos], [ClaveCatalogo], [Valor]) VALUES (2, N'PrefijoRespuestasLetra', N'02', N'b)')
INSERT [dbo].[Catalogos] ([IdCatalogo], [NombreCatalogos], [ClaveCatalogo], [Valor]) VALUES (3, N'PrefijoRespuestasLetra', N'03', N'c)')
INSERT [dbo].[Catalogos] ([IdCatalogo], [NombreCatalogos], [ClaveCatalogo], [Valor]) VALUES (4, N'PrefijoRespuestasLetra', N'04', N'd)')
INSERT [dbo].[Catalogos] ([IdCatalogo], [NombreCatalogos], [ClaveCatalogo], [Valor]) VALUES (5, N'PrefijoRespuestasLetra', N'05', N'e)')
SET IDENTITY_INSERT [dbo].[Catalogos] OFF
