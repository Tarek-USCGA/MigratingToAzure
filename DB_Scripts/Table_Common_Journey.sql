USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COMMON].[Journey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcadId] [int] NOT NULL,
	[StartDt] [datetime2](7) NOT NULL,
	[EndDt] [datetime2](7) NULL,
	[JourneyNote] [nvarchar](250) NULL,
	[PositionId] [int] NOT NULL,
	[EntryReasonId] [int] NULL,
	[ExitReasonId] [int] NULL,
	[CreatedDt] [datetime2](7) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[UpdatedDt] [datetime2](7) NULL,
	[UpdatedById] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Obligation] [nvarchar](50) NULL,
 CONSTRAINT [PK_COMMON.Journey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_AcadId] FOREIGN KEY([AcadId])
REFERENCES [COMMON].[Entity] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_AcadId]
GO

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [COMMON].[Entity] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_CreatedById]
GO

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [COMMON].[Entity] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Entity_UpdatedById]
GO


/** I am keeping these FKs as an FYI in case you wonder about some of the columns, but I recommend you don't need them as they are irrelevant for your needs **/


/***********

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.EntryReason_EntryReasonId] FOREIGN KEY([EntryReasonId])
REFERENCES [COMMON].[EntryReason] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.EntryReason_EntryReasonId]
GO

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.ExitReason_ExitReasonId] FOREIGN KEY([ExitReasonId])
REFERENCES [COMMON].[ExitReason] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.ExitReason_ExitReasonId]
GO

ALTER TABLE [COMMON].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Position_PositionId] FOREIGN KEY([PositionId])
REFERENCES [COMMON].[Position] ([Id])
GO

ALTER TABLE [COMMON].[Journey] CHECK CONSTRAINT [FK_COMMON.CgaJourney_COMMON.Position_PositionId]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary Key.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'Id'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date person joined the Academy.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'StartDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date person left the Academy.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'EndDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'JourneyNote'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to Position table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'PositionId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Reason for exit.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'ExitReasonId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'CreatedDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'CreatedById'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date the update was made in the table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'UpdatedDt'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'AcadId of the person updating the entry in the table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'UpdatedById'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey', @level2type=N'COLUMN',@level2name=N'RowVersion'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Junction table between Entity and Position. RULE: Every time an entity starts or ends a Position at the CGA an entry is added or ended in this table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Journey'
GO

****/


