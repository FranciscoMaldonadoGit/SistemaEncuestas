
BEGIN TRY

    BEGIN TRANSACTION 
		
		CREATE TABLE UnidadMedidaArchivo
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
					
			Nombre NVARCHAR(50) NOT NULL,
			Prefijo NVARCHAR(10) NOT NULL,
			Descripcion NVARCHAR(100) NOT NULL,

			FechaCreacion datetime NOT NULL
		);

		CREATE TABLE Idioma
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
					
			Nombre NVARCHAR(50) NOT NULL,
			Prefijo NVARCHAR(10) NOT NULL,
			
			FechaCreacion datetime NOT NULL
		);

		CREATE TABLE Etiquetas
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			
			IdIdioma int NOT NULL,
			IdTagEtiqueta UNIQUEIDENTIFIER NOT NULL,

			Descripcion NVARCHAR(1000) NOT NULL,
			
			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_Etiquetas_Idioma FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id)
		);

		CREATE TABLE DatosArchivo
		(
			Id UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
			
			IdIdioma int NOT NULL,
			IdUnidadMedida int NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdArchivoBox NVARCHAR(300) NOT NULL,

			Extension NVARCHAR(50) NOT NULL,
			Ancho decimal(12,2) NULL,
			Alto decimal(12,2) NULL,
			Peso decimal(12,2) NULL,

			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			Version int NOT NULL,

			CONSTRAINT FK_DatosArchivo_Idioma FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id),
			CONSTRAINT FK_DatosArchivo_UnidadMedida FOREIGN KEY (IdUnidadMedida) REFERENCES UnidadMedidaArchivo(Id),
			CONSTRAINT fk_DatosArchivo_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_DatosArchivo_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE AvisoPrivacidad
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdDatoArchivo UNIQUEIDENTIFIER NOT NULL,	
			
			FechaCreacion datetime NOT NULL
		);

		CREATE TABLE InicioMovil
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdTagEtiqueta UNIQUEIDENTIFIER NOT NULL,

			Orden int NOT NULL,
			Activo bit NOT NULL,
			
			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_InicioMovil_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_InicioMovil_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE RelacionArchivoInicio
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdInicio int NOT NULL,	
			IdDatoArchivo UNIQUEIDENTIFIER NOT NULL,

			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_RelacionArchivoIni_Inicio FOREIGN KEY (IdInicio) REFERENCES InicioMovil(Id),
			CONSTRAINT FK_RelacionArchivoIni_DatArc FOREIGN KEY (IdDatoArchivo) REFERENCES DatosArchivo(Id)
		);

		CREATE TABLE PreguntasFrecuentes
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdTagPregunta UNIQUEIDENTIFIER NOT NULL,
			IdTagRespuesta UNIQUEIDENTIFIER NOT NULL,

			Orden int NOT NULL,
			Activo bit NOT NULL,
			
			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_PregFrecuentes_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_PregFrecuentes_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE Intereses
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdTagEtiqueta UNIQUEIDENTIFIER NOT NULL,
			
			Activo bit NOT NULL,
			
			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_Intereses_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_Intereses_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE ProgramasMovil
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdTagEtiqueta UNIQUEIDENTIFIER NOT NULL,
			
			Activo bit NOT NULL,
			
			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_ProgMovil_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_ProgMovil_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE PreRegistro
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdIntereses int NOT NULL,
			IdProgramasMovil int NOT NULL,
			Nombre NVARCHAR(100) NOT NULL,
			Apellido NVARCHAR(100) NOT NULL,
			Email NVARCHAR(100) NOT NULL,
			Telefono NVARCHAR(15) NOT NULL,
			Colonia NVARCHAR(100) NOT NULL,
			Calle NVARCHAR(140) NOT NULL,
			CP int NOT NULL,
			Estado NVARCHAR(100) NOT NULL,
			Municipio NVARCHAR(100) NOT NULL,

			FechaCreacion datetime NOT NULL,
			
			CONSTRAINT fk_PreRegistro_Intereses FOREIGN KEY (IdIntereses) REFERENCES Intereses(Id),
			CONSTRAINT fk_PreRegistro_ProgMovil FOREIGN KEY (IdProgramasMovil) REFERENCES ProgramasMovil(Id)
		);

		CREATE TABLE BuzonDudasSugerencias
		(
			Id UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
			IdPreRegistro INT NOT NULL,
			Comentario NVARCHAR(900) NOT NULL,

			Contestado bit NOT NULL,
			Respuesta NVARCHAR(4000) NOT NULL,

			FechaCreacion datetime NOT NULL,

			CONSTRAINT fk_Buzon_PreRegistro FOREIGN KEY (IdPreRegistro) REFERENCES PreRegistro(Id)
		);

		CREATE TABLE Bases
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdProgramasMovil int NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,

			Activo bit NOT NULL,

			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_Bases_ProgMovil FOREIGN KEY (IdProgramasMovil) REFERENCES ProgramasMovil(Id),
			CONSTRAINT fk_Bases_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_Bases_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE RelacionArchivoBases
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdBase int NOT NULL,	
			IdDatoArchivo UNIQUEIDENTIFIER NOT NULL,

			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_RelacionArchivoBas_Base FOREIGN KEY (IdBase) REFERENCES Bases(Id),
			CONSTRAINT FK_RelacionArchivoBas_DatArc FOREIGN KEY (IdDatoArchivo) REFERENCES DatosArchivo(Id)
		);

		CREATE TABLE Beneficios
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdProgramasMovil int NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,

			Activo bit NOT NULL,

			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_Beneficios_ProgMovil FOREIGN KEY (IdProgramasMovil) REFERENCES ProgramasMovil(Id),
			CONSTRAINT fk_Beneficios_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_Beneficios_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE RelacionArchivoBeneficios
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdBeneficio int NOT NULL,	
			IdDatoArchivo UNIQUEIDENTIFIER NOT NULL,

			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_RelacionArchivoBen_Beneficios FOREIGN KEY (IdBeneficio) REFERENCES Bases(Id),
			CONSTRAINT FK_RelacionArchivoBen_DatArc FOREIGN KEY (IdDatoArchivo) REFERENCES DatosArchivo(Id)
		);

		CREATE TABLE VideosProgramas
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdProgramasMovil int NOT NULL,
			IdUsuarioCreacion NVARCHAR(128) NOT NULL,
			IdUsuarioModificacion NVARCHAR(128) NOT NULL,
			IdTagEtiqueta UNIQUEIDENTIFIER NOT NULL,

			Activo bit NOT NULL,

			FechaCreacion datetime NOT NULL,
			FechaModificacion datetime NOT NULL,

			CONSTRAINT fk_Videos_ProgMovil FOREIGN KEY (IdProgramasMovil) REFERENCES ProgramasMovil(Id),
			CONSTRAINT fk_Videos_UsuCreac FOREIGN KEY (IdUsuarioCreacion) REFERENCES Usuario(Id),
			CONSTRAINT fk_Videos_UsuMod FOREIGN KEY (IdUsuarioModificacion) REFERENCES Usuario(Id)
		);

		CREATE TABLE RelacionArchivoVideos
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdVideoPrograma int NOT NULL,	
			IdDatoArchivo UNIQUEIDENTIFIER NOT NULL,

			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_RelacionArchivoVid_Videos FOREIGN KEY (IdVideoPrograma) REFERENCES VideosProgramas(Id),
			CONSTRAINT FK_RelacionArchivoVid_DatArc FOREIGN KEY (IdDatoArchivo) REFERENCES DatosArchivo(Id)
		);

		CREATE TABLE AceptacionAvisoPrivacidad
		(
			Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
			IdPreRegistro int NOT NULL,	
			
			FechaCreacion datetime NOT NULL,

			CONSTRAINT FK_Aceptacion_PreRegistro FOREIGN KEY (IdPreRegistro) REFERENCES PreRegistro(Id)
		);

		ALTER TABLE Cliente ADD IdPreRegistro int NULL;
		ALTER TABLE Cliente ADD FOREIGN KEY (IdPreRegistro) REFERENCES PreRegistro(Id);
	
	COMMIT

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0

	 SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;

     ROLLBACK

END CATCH
