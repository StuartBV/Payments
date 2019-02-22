SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[Payment_UpdateSourceSystem]
@paymentid int,
@success bit
as
set nocount on

declare @sourceSystem int, @guid varchar(38)

select @SourceSystem=p.OriginatingSystem, @guid=p.GUID
from Payments p
where p.ID=@paymentid

if @SourceSystem=1 -- CMS
begin
	exec ppd3.dbo.PaymentServiceUpdate @guid=@guid, @success=@success
	return
end

--if @SourceSystem=2 -- TS
--begin
--	exec fraud.dbo.PaymentServiceUpdate @guid=@guid, @success=@success
--end

if @SourceSystem=3 -- FNOL
begin
	exec Fnol.dbo.PaymentServiceUpdate @guid=@guid, @success=@success
	return
end

if @SourceSystem IN (5, 6)
begin
	exec Ordering.dbo.PaymentServiceUpdate @guid=@guid, @success=@success
	return
end

GO
