USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ACADEMICS].[DfFormList_Get]
	@p_DFForm_ID int,
    @p_DFForm_IDHasValue int,
    @p_TIME_PERIOD_ID int,
    @p_TIME_PERIOD_IDHasValue int,
    @p_FORMTYPE varchar(12),
    @p_FORMTYPEHasValue int,
    @p_INSTRACADID int,
    @p_INSTRACADIDHasValue int,
    @p_CADETACADID int,
    @p_CADETACADIDHasValue int,
    @p_CDT_NM_LAST varchar(30),
    @p_CDT_NM_LASTHasValue int,
    @p_ADVISORACAD_ID int,
    @p_ADVISORACAD_IDHasValue int
AS
   
   BEGIN
      DECLARE
         @msBad_Code int, 
         @msBad_Message varchar(250)
      BEGIN TRY
	select dfForm.CourseName, dfForm.Cadet_AcadID, Cadet.NmFirst as CadetFirst, Cadet.NmLast as CadetLast, 
	dfForm.Instructor_AcadID as InstructorAcadID, Inst.NmFirst as InstFirst, Inst.NmLast as InstLast, 
	dfForm.FormGrade, dfForm.id as DFFormId, cadet.AdvisorId, dfForm.FormType,
	dfForm.AcademyPeriodId, aPrd.PeriodNm as TimePeriodNm, dfForm.Create_Date from ACADEMICS.DF_FORM dfForm 
	inner join COMMON.Entity Cadet on Cadet.id = dfForm.Cadet_AcadID
	inner join COMMON.Entity Inst on Inst.id = dfForm.Instructor_AcadID
	inner join COMMON.AcademyPeriod aPrd on aPrd.Id = dfForm.AcademyPeriodId
	where (dfForm.Id = @p_DFForm_ID OR (@p_DFForm_ID IS NULL AND @p_DFForm_IDHasValue = 0)) AND
	(dfForm.AcademyPeriodId = @p_TIME_PERIOD_ID OR (@p_TIME_PERIOD_ID IS NULL AND @p_TIME_PERIOD_IDHasValue = 0)) AND
	(dfForm.FormType = @p_FORMTYPE OR (@p_FORMTYPE IS NULL AND @p_FORMTYPEHasValue = 0)) AND
	(dfForm.Instructor_AcadID = @p_INSTRACADID OR (@p_INSTRACADID IS NULL AND @p_INSTRACADIDHasValue = 0)) AND
	(dfForm.Cadet_AcadID = @p_CADETACADID OR (@p_CADETACADID IS NULL AND @p_CADETACADIDHasValue = 0)) AND
	(Cadet.AdvisorId = @p_ADVISORACAD_ID OR (@p_ADVISORACAD_ID IS NULL AND @p_ADVISORACAD_IDHasValue = 0)) AND
	(upper(Cadet.NmLast) LIKE upper('%' + ISNULL(@p_CDT_NM_LAST, '') + '%') OR (@p_CDT_NM_LAST IS NULL AND @p_CDT_NM_LASTHasValue = 0))
	order by cadet.NmLast, Cadet.NmFirst;
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
                  'DfFormList_Get', 
                  @errornumber, 
                  @errormessage, 
                  NULL, 
                  sysdatetime())
         END
      END CATCH
   END
GO


