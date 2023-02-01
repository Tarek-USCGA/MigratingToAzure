USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ACADEMICS].[DF_FORM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Instructor_AcadID] [int] NOT NULL,
	[Cadet_AcadID] [int] NOT NULL,
	[FormType] [varchar](12) NULL,
	[FormGrade] [varchar](1) NULL,
	[CourseName] [varchar](50) NULL,
	[FinalExGrad] [decimal](4, 1) NULL,
	[FinalExGradAss] [varchar](5) NULL,
	[HourlyExGrad1] [decimal](4, 1) NULL,
	[HourlyExGrad2] [decimal](4, 1) NULL,
	[HourlyExGrad3] [decimal](4, 1) NULL,
	[HourlyExGrad4] [decimal](4, 1) NULL,
	[HourlyExGrad5] [decimal](4, 1) NULL,
	[HourlyExGradAss] [varchar](5) NULL,
	[LabAve] [decimal](4, 1) NULL,
	[LabAveAss] [varchar](5) NULL,
	[QuizAve] [decimal](4, 1) NULL,
	[QuizAveAss] [varchar](5) NULL,
	[HomeWAve] [decimal](4, 1) NULL,
	[HomeWAveAss] [varchar](5) NULL,
	[PaperProjRep1] [decimal](4, 1) NULL,
	[PaperProjRep2] [decimal](4, 1) NULL,
	[PaperProjRep3] [decimal](4, 1) NULL,
	[PaperProjRep4] [decimal](4, 1) NULL,
	[PaperProjRep5] [decimal](4, 1) NULL,
	[PaperProjRepAss] [varchar](5) NULL,
	[Punctuality] [varchar](5) NULL,
	[AttInClass] [varchar](5) NULL,
	[MilBearing] [varchar](5) NULL,
	[Courtesy] [varchar](5) NULL,
	[PersonalApp] [varchar](5) NULL,
	[SoughtExtHelp] [varchar](6) NULL,
	[AttendExtSess] [varchar](6) NULL,
	[Comments] [varchar](max) NULL,
	[AcademyPeriodId] [int] NULL,
	[Section_ID] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Effort] [varchar](12) NULL,
	[CREATE_ACAD_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


