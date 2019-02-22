CREATE TABLE [dbo].[Banks]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BankType] [int] NOT NULL CONSTRAINT [DF_Banks_BankType] DEFAULT ((2)),
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SortCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RollNo] [varbinary] (20) NULL,
[LastBatchNo] [int] NOT NULL CONSTRAINT [DF_Banks_BatchNo] DEFAULT ((0)),
[CreateDate] [datetime] NOT NULL,
[CreatedBy] [dbo].[UserID] NOT NULL,
[AlteredDate] [datetime] NULL,
[AlteredBy] [dbo].[UserID] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banks] ADD CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
