USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COMMON].[Entity](
	[Id] [int] NOT NULL,
	[NmLast] [nvarchar](40) NULL,
	[NmFirst] [nvarchar](20) NULL,
	[NmMid] [nvarchar](20) NULL,
	[NmSuffix] [nvarchar](4) NULL,
	[NmRankTitle] [nvarchar](5) NULL,
	[Gender] [nvarchar](6) NULL,
	[Citizenship] [nvarchar](16) NULL,
	[BirthDt] [datetime2](7) NULL,
	[Username] [nvarchar](100) NULL,
	[Cohort] [smallint] NULL,
	[GradDt] [datetime2](7) NULL,
	[CommDt] [datetime2](7) NULL,
	[Code] [int] NULL,
	[Company] [nvarchar](2) NULL,
	[AcademicClassYr] [smallint] NULL,
	[PoBox] [smallint] NULL,
	[Emplid] [int] NOT NULL,
	[AdvisorId] [int] NULL,
	[PayGradeCGHQ] [nvarchar](10) NULL,
	[JobTitleAbbrCGHQ] [nvarchar](10) NULL,
	[EducationLevelCGHQ] [nvarchar](25) NULL,
	[JobTitleCGHQ] [nvarchar](45) NULL,
	[JobCodeCGHQ] [int] NULL,
	[Ethnicity] [nvarchar](64) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[SwornInDt] [datetime2](7) NULL,
	[BarCode] [nvarchar](150) NULL,
	[AmotAdvisorId] [int] NULL,
	[PrivacyWaiverSigned] [bit] NULL,
 CONSTRAINT [PK_COMMON.Entity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary Key. This is the AcadId uniquely identifying the person in the system.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Id'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Must be MALE or FEMALE.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Gender'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Must be USA CITIZENSHIP or FOREIGN NATIONAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Citizenship'
GO

EXEC sys.sp_addextendedproperty @name=N'Source', @value=N'From Admissions Application' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'BirthDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This must be the same as the EDU Active Directory Username.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Username'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Year the Cadet started taking academic classes. This can vary from class year if they leave and come back.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Cohort'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Legacy Cadet Code. Supplied by Registrar. Hope to consolidate this with the Acad Id.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Government Employee Id for all GS and Cadets. Contractors or anyone who does not have an Emplid, use the AcadId.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'Emplid'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the Entity is a Cadet then this is a FK to the Cadet''s Advisor.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'AdvisorId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL Data. Employee pay grade/level. Populated from PAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'PayGradeCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL Data. Employee pay series/type. Abbreviated title. Populated from PAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'JobTitleAbbrCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL Data. Employee education level. Populated from PAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'EducationLevelCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL Data. Description of title filling position. Full title. Populated from PAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'JobTitleCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL Data. Id for persons rank/title filling position. Full title. Populated from PAL.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity', @level2type=N'COLUMN',@level2name=N'JobCodeCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Main repository of CGA Personnel static data.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Entity'
GO


