USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ACADEMICS].[DFForm_Exists]  
   @p_ACAD_ID int,
   @p_EXISTS int  OUTPUT
AS 
   BEGIN
      SET @p_EXISTS = NULL
	  SELECT @p_EXISTS = count_big(DFForm.Cadet_AcadID)
      FROM ACADEMICS.DF_FORM  AS DFForm
      WHERE DFForm.Cadet_AcadID = @p_ACAD_ID 
      RETURN 
   END
GO


