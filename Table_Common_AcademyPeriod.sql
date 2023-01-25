USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COMMON].[AcademyPeriod](
	[Id] [int] NOT NULL,
	[PeriodNm] [nvarchar](30) NULL,
	[PeriodCategory] [nvarchar](20) NULL,
	[PeriodBeginDt] [datetime2](7) NULL,
	[PeriodEndDt] [datetime2](7) NULL,
	[PartOfTimePeriodId] [int] NULL,
	[AssociatedTimePeriodId] [int] NULL,
	[YearId] [int] NULL,
	[SemesterId] [int] NULL,
	[CreatedDt] [datetime2](7) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[UpdatedDt] [datetime2](7) NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK_COMMON.AcademyPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [COMMON].[AcademyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.AcademyPeriod_COMMON.AcademyPeriod_AssociatedTimePeriodId] FOREIGN KEY([AssociatedTimePeriodId])
REFERENCES [COMMON].[AcademyPeriod] ([Id])
GO

ALTER TABLE [COMMON].[AcademyPeriod] CHECK CONSTRAINT [FK_COMMON.AcademyPeriod_COMMON.AcademyPeriod_AssociatedTimePeriodId]
GO

ALTER TABLE [COMMON].[AcademyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.AcademyPeriod_COMMON.AcademyPeriod_PartOfTimePeriodId] FOREIGN KEY([PartOfTimePeriodId])
REFERENCES [COMMON].[AcademyPeriod] ([Id])
GO

ALTER TABLE [COMMON].[AcademyPeriod] CHECK CONSTRAINT [FK_COMMON.AcademyPeriod_COMMON.AcademyPeriod_PartOfTimePeriodId]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary Key.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'Id'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of period.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'PeriodNm'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'PeriodCategory'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'PeriodBeginDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'PeriodEndDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'PartOfTimePeriodId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'AssociatedTimePeriodId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to the REGIS.AcademicYear table.  This is used for RegIS.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'YearId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to the REGIS.Semester table.  This is used for RegIS.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod', @level2type=N'COLUMN',@level2name=N'SemesterId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'AcademyPeriod'
GO


