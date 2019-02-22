CREATE TABLE [dbo].[Suppliers]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankBranch] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankSortCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankAccountNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingSocietyRollNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Suppliers_CreateDate] DEFAULT (getdate()),
[CreatedBy] [dbo].[UserID] NOT NULL CONSTRAINT [DF_Suppliers_CreatedBy] DEFAULT ('sys'),
[AlteredDate] [datetime] NULL,
[AlteredBy] [dbo].[UserID] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Suppliers] ADD CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
