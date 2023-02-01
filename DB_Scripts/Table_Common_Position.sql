USE [INSERT_YOUR_DB_NAME_HERE]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [COMMON].[Position](
	[Id] [int] IDENTITY(5000,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[JourneyRoleId] [int] NOT NULL,
	[MaxPosition] [smallint] NULL,
	[DepartmentId] [int] NULL,
	[BranchId] [int] NULL,
	[IsFaculty] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[IsAssignable] [bit] NOT NULL,
	[PrimaryPosition] [bit] NOT NULL,
	[PositionPrecedence] [smallint] NULL,
	[Active] [bit] NOT NULL,
	[DeptIdCGHQ] [int] NULL,
	[DeptDescCGHQ] [nvarchar](50) NULL,
	[PositionNbrCGHQ] [int] NULL,
	[PositionNmCGHQ] [nvarchar](45) NULL,
	[ActivityId] [int] NULL,
	[DeptSectId] [int] NULL,
 CONSTRAINT [PK_COMMON.Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [COMMON].[Position]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.Position_COMMON.JourneyRole_JourneyRoleId] FOREIGN KEY([JourneyRoleId])
REFERENCES [COMMON].[JourneyRole] ([Id])
GO

ALTER TABLE [COMMON].[Position] CHECK CONSTRAINT [FK_COMMON.Position_COMMON.JourneyRole_JourneyRoleId]
GO

ALTER TABLE [COMMON].[Position]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.Position_COMMON.Position_ParentId] FOREIGN KEY([ParentId])
REFERENCES [COMMON].[Position] ([Id])
GO

ALTER TABLE [COMMON].[Position] CHECK CONSTRAINT [FK_COMMON.Position_COMMON.Position_ParentId]
GO


/** I am keeping these FKs as an FYI in case you wonder about some of the columns, but I recommend you don't need them as they are irrelevant for your needs **/


/****

ALTER TABLE [COMMON].[Position]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.Position_COMMON.Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [COMMON].[Branch] ([Id])
GO

ALTER TABLE [COMMON].[Position] CHECK CONSTRAINT [FK_COMMON.Position_COMMON.Branch_BranchId]
GO

ALTER TABLE [COMMON].[Position]  WITH CHECK ADD  CONSTRAINT [FK_COMMON.Position_COMMON.Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [COMMON].[Department] ([Id])
GO

ALTER TABLE [COMMON].[Position] CHECK CONSTRAINT [FK_COMMON.Position_COMMON.Department_DepartmentId]
GO


EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary Key.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'Id'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Shorter name describing the Position.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'More detailed description of the Position.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to JourneyRole table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'JourneyRoleId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum number of entities that can be assigned to this Position.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'MaxPosition'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to Department table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'DepartmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'FK to Branch table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'BranchId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Specifies if position is a Faculty postition.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'IsFaculty'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'References a parent Position if one exists. An example is ALFA Company Officer has a parent Postition of Company Officer.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'ParentId'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Set to false on Positions that are parent positions so end user knows that are not assignable positions.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'IsAssignable'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Specifies if the Position is a primary.  For now this is either Staff or Cadet.  An Entity cannot be assigned to more than one Primary Position and must be assigned to at least one that is not end dated.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'PrimaryPosition'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Specifies the precedence of the Position. Used so BL layer knows which Position is the most important. Example the Entity is associated with both the CIO and DCSO Positions.  The CIO Position will have a higher precedence and will be the display position.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'PositionPrecedence'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Specifies if the Position is Active.  Positions that are no longer used will not be deleted, they will be made In-Active.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'Active'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL data.  Dept Id from CGHQ.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'DeptIdCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL data.  Dept description from CGHQ.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'DeptDescCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL data.  Position number from CGHQ.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'PositionNbrCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'PAL data.  Position name from CGHQ.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position', @level2type=N'COLUMN',@level2name=N'PositionNmCGHQ'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Position lookup table.' , @level0type=N'SCHEMA',@level0name=N'COMMON', @level1type=N'TABLE',@level1name=N'Position'
GO


****/