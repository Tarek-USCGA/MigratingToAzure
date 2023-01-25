USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [ACADEMICS].[DfForm_Get]
	@p_DFForm_ID int
AS

   BEGIN
      DECLARE
         @msBad_Code int, 
         @msBad_Message varchar(250)
      BEGIN TRY
	select dfForm.*, Cadet.NmFirst as CadetFirst, Cadet.NmLast as CadetLast, 
	Inst.NmFirst as InstFirst, Inst.NmLast as InstLast, aPrd.PeriodNm
	 from ACADEMICS.DF_FORM dfForm 
	inner join COMMON.Entity Cadet on Cadet.id = dfForm.Cadet_AcadID
	inner join COMMON.Entity Inst on Inst.id = dfForm.Instructor_AcadID
	inner join COMMON.AcademyPeriod aPrd on aPrd.id = dfForm.AcademyPeriodId
	where dfForm.Id = @p_DFForm_ID
	RETURN 

      END TRY

      BEGIN CATCH
         DECLARE
            @errornumber int

         SET @errornumber = ERROR_NUMBER()

         DECLARE
            @errormessage nvarchar(4000)

         SET @errormessage = ERROR_MESSAGE()

         DECLARE
            @exceptionidentifier nvarchar(4000)
            
         BEGIN
            SET @msBad_Code = null 
            SET @msBad_Message = null

            INSERT dbo.UTL_ERR_LOG(
               JOBNAME, 
               JOBSTEP, 
               CODE, 
               ERR_MESSAGE, 
               JOBDESCRIPTION, 
               DATECREATED)
               VALUES (
                  'ACADEMICS', 
                  'DfForm_Get', 
                  @errornumber, 
                  @errormessage, 
                  NULL, 
                  sysdatetime())
         END
      END CATCH
   END
GO


