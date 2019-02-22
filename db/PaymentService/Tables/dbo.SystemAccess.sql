CREATE TABLE [dbo].[SystemAccess]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[System] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdateURL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FailedPaymentURL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_SystemAccess_CreateDate] DEFAULT (getdate()),
[CreatedBy] [dbo].[UserID] NOT NULL CONSTRAINT [DF_SystemAccess_CreatedBy] DEFAULT ('sys')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemAccess] ADD CONSTRAINT [PK_SystemAccess] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
