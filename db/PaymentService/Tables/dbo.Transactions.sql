CREATE TABLE [dbo].[Transactions]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[SystemID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemPassword] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RequestDate] [datetime] NULL CONSTRAINT [DF_Transactions_RequestDate] DEFAULT (getdate()),
[Status] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletedDate] [datetime] NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Transactions_CreateDate] DEFAULT (getdate()),
[CreatedBy] [dbo].[UserID] NOT NULL CONSTRAINT [DF_Transactions_CreatedBy] DEFAULT ('sys')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions] ADD CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED  ([ID]) WITH (FILLFACTOR=100) ON [PRIMARY]
GO
