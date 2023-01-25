USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [ACADEMICS].[DF_Cadet]
	@varCadetAcad_ID int
AS

   BEGIN
      DECLARE
         @msBad_Code int, 
         @msBad_Message varchar(250)
      BEGIN TRY
      select ent.NmRankTitle, ent.NmFirst, ent.NmLast, df.CourseName, df.FormType, df.FormGrade, aprd.PeriodNm, df.Id, df.Create_Date from ACADEMICS.DF_FORM df
		inner join COMMON.AcademyPeriod aprd on aprd.Id = df.AcademyPeriodId
		inner join COMMON.Entity ent on ent.id = df.Instructor_AcadID
		where df.Cadet_AcadID = @varCadetAcad_ID
		order by df.AcademyPeriodId desc;
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
                  'CGASection_Get', 
                  @errornumber, 
                  @errormessage, 
                  NULL, 
                  sysdatetime())
         END
      END CATCH
END
GO


