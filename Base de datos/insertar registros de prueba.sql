use [SistAprendizaje]
-- Verify that the stored procedure does not already exist.  
IF OBJECT_ID ( 'usp_GetErrorInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_GetErrorInfo;  
GO  
  
-- Create procedure to retrieve error information.  
CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  

DECLARE @TransactionName VARCHAR(20) = 'Transaction1';  
BEGIN TRAN @TransactionName  

BEGIN TRY  

-- Generate divide-by-zero error.  
--SELECT 1/0;  

declare @pregunta nvarchar(500)
declare @iconteo int=0
declare @tablaPreguntas  table(num int, Pregunta nvarchar(500),idcuestionario int, numeropregunta int)
declare @tablaRespuestas table(
num int,
idprefijoCatalogoResp1 int, resp1 nvarchar(200), esCorrectaResp1 bit,
idprefijoCatalogoResp2 int, resp2 nvarchar(200), esCorrectaResp2 bit,
idprefijoCatalogoResp3 int, resp3 nvarchar(200), esCorrectaResp3 bit,
idprefijoCatalogoResp4 int, resp4 nvarchar(200), esCorrectaResp4 bit
) 

declare @icuestionario int =  ( select IdCuestionario from Cuestionarios where NombreCuestionario  = 'Javascrip Completo' )
set @pregunta  = 'En qué lugar se ejecuta generalmente el código JavaScript?'
declare @resp1 nvarchar(100) = 'Servidor' 
declare @resp2 nvarchar(100) = 'Cliente (en el propio navegador de internet)' 
declare @resp3 nvarchar(100) = 'sistema operativo' 
declare @resp4 nvarchar(100) = 'movil' 

declare @numeroFila int = 0 

insert into @tablaPreguntas (num, Pregunta, idcuestionario, numeropregunta)
values
(
@numeroFila,
@pregunta,
@icuestionario,
( select top 1 NoPregunta from Preguntas  where IdCuestionario = @icuestionario order by NoPregunta desc)
)

insert into @tablaRespuestas (
num,
idprefijoCatalogoResp1 , resp1 , esCorrectaResp1,
idprefijoCatalogoResp2 , resp2 , esCorrectaResp2,
idprefijoCatalogoResp3 , resp3 , esCorrectaResp3,
idprefijoCatalogoResp4 , resp4 , esCorrectaResp4
)
values(@numeroFila,
1, @resp1,0,
2, @resp2,1,
3, @resp3,0,
4, @resp4,0)

while @iconteo < ( select count(*) from @tablaPreguntas) begin

	insert into Preguntas  
		 (
				IdCuestionario,
				NoPregunta,
				TextoPregunta,
				FechaAlta,
				FechaModificacion
		   )
	values(
	      ( select idcuestionario from @tablaPreguntas where num = @iconteo),
		  ( select numeropregunta from @tablaPreguntas where num = @iconteo),
		  ( select Pregunta from @tablaPreguntas where num = @iconteo),
		  GETDATE(), 
		  GETDATE()
	)

	declare @idultimo int = @@identity 

	insert into Respuestas
	(
		IdPregunta,
		IdPrefijoCatalogo,
		TextoRespuesta,
		FechaAlta,
		FechaModificacion,
		esCorrecta	
	)
	values(
		  @idultimo, 
		  ( select idprefijoCatalogoResp1 from @tablaRespuestas where num = @iconteo),
		  ( select resp1 from @tablaRespuestas where num = @iconteo),
		  getdate(), 
		  getdate(),
		  ( select esCorrectaResp1 from @tablaRespuestas where num = @iconteo)
	)

	insert into Respuestas
	(
		IdPregunta,
		IdPrefijoCatalogo,
		TextoRespuesta,
		FechaAlta,
		FechaModificacion,
		esCorrecta	
	)
	values(
		  @idultimo, 
		  ( select idprefijoCatalogoResp2 from @tablaRespuestas where num = @iconteo),
		  ( select resp2 from @tablaRespuestas where num = @iconteo),
		  getdate(), 
		  getdate(),
		  ( select esCorrectaResp2 from @tablaRespuestas where num = @iconteo)
	)


	insert into Respuestas
	(
		IdPregunta,
		IdPrefijoCatalogo,
		TextoRespuesta,
		FechaAlta,
		FechaModificacion,
		esCorrecta	
	)
	values(
		  @idultimo, 
		  ( select idprefijoCatalogoResp3 from @tablaRespuestas where num = @iconteo),
		  ( select resp3 from @tablaRespuestas where num = @iconteo),
		  getdate(), 
		  getdate(),
		  ( select esCorrectaResp3 from @tablaRespuestas where num = @iconteo)
	)

	insert into Respuestas
	(
		IdPregunta,
		IdPrefijoCatalogo,
		TextoRespuesta,
		FechaAlta,
		FechaModificacion,
		esCorrecta	
	)
	values(
		  @idultimo, 
		  ( select idprefijoCatalogoResp4 from @tablaRespuestas where num = @iconteo),
		  ( select resp4 from @tablaRespuestas where num = @iconteo),
		  getdate(), 
		  getdate(),
		  ( select esCorrectaResp4 from @tablaRespuestas where num = @iconteo)
	)
	
	set @iconteo += 1; 

end --fin de while

END TRY  
BEGIN CATCH  
	
	 -- Execute error retrieval routine.  
	 EXECUTE usp_GetErrorInfo;  
	
	 IF @@TRANCOUNT > 0  
     ROLLBACK TRANSACTION @TransactionName;  

END CATCH;   

IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION @TransactionName;  
GO  
