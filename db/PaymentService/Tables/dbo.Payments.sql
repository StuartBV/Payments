CREATE TABLE [dbo].[Payments]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Bank] [int] NULL CONSTRAINT [DF_Payments_Bank] DEFAULT ((1)),
[GUID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PayeeName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankBranch] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankSortCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BankAccountNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuildingSocietyRollNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [tinyint] NULL CONSTRAINT [DF_Payments_Status] DEFAULT ((2)),
[OurRef] [int] NULL,
[InsuranceClaimNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsurancePolicyNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Channel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatePaid] [datetime] NULL,
[PaymentType] [tinyint] NULL,
[OriginatingSystem] [tinyint] NULL,
[Amount] [money] NULL,
[BatchFileNo] [int] NULL,
[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Payments_CreateDate] DEFAULT (getdate()),
[CreatedBy] [dbo].[UserID] NOT NULL CONSTRAINT [DF_Payments_CreatedBy] DEFAULT ('sys'),
[AlteredDate] [datetime] NULL,
[AlteredBy] [dbo].[UserID] NULL,
[FailedBatchFileNo] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE trigger [dbo].[Payments_Insert] on [dbo].[Payments] for insert
as 
set nocount on
if @@rowcount=0 return

update p set p.BatchFileNo=null
from inserted i join Payments p on p.ID=i.Id
where i.BatchFileNo=0
GO
ALTER TABLE [dbo].[Payments] ADD CONSTRAINT [PK_Payments_1] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_batch] ON [dbo].[Payments] ([BatchFileNo]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Defaults to Armed Forces bank account', 'SCHEMA', N'dbo', 'TABLE', N'Payments', 'COLUMN', N'Bank'
GO
