SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[MaintenancePolicy] as
set nocount on
declare @dt date=getdate(), @months int=72

delete from Transactions where datediff(mm,CreateDate,@dt)>@months
delete from Payments where datediff(mm,CreateDate,@dt)>@months

GO
