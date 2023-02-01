USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [ACADEMICS].[DF_ADVISOR]
	@varAdvisorAcadID int
AS

   BEGIN
      DECLARE
         @msBad_Code int, 
         @msBad_Message varchar(250)
      BEGIN TRY
	select ent.NmRankTitle, ent.NmFirst, ent.NmLast, 
			ent2.NmRankTitle as InstrRank, ent2.NmFirst as InstrFirst, ent2.NmLast as InstrLast,
		df.CourseName, df.FormType, df.FormGrade, aprd.PeriodNm, df.Id, df.Create_Date from COMMON.Entity ent 
		inner join COMMON.Journey jou on jou.AcadId = ent.id and jou.PositionId in ( /* USE some PositionId values from COMMON.Journey  */)
			and jou.EndDt is null
		inner join ACADEMICS.DF_FORM df on df.Cadet_AcadID = ent.id
		inner join COMMON.AcademyPeriod aprd on aprd.Id = df.AcademyPeriodId
		inner join COMMON.Entity ent2 on ent2.id = df.Instructor_AcadID
		where ent.AdvisorId = @varAdvisorAcadID and ent.GradDt is null
		order by df.AcademyPeriodId desc, ent.NmLast
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
                  'DF_Advisor', 
                  @errornumber, 
                  @errormessage, 
                  NULL, 
                  sysdatetime())
         END
      END CATCH

   END
GO


