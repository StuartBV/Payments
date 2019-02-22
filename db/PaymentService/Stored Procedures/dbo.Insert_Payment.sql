SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[Insert_Payment]
@BankId int,
@SourceSystemGuid varchar(50),
@PayeeName varchar(50),
@BankSortCode varchar(10),
@BankAccountNo varchar(20),
@SourceSystemRef int,
@InsuranceClaimNo varchar(50),
@InsurancePolicyNo varchar(50),
@Channel varchar(20),
@PaymentType tinyint=1,
@OriginatingSystem tinyint,
@Amount money,
@UserId userid
as
-- This is used by the OrderingService.CashSettlementOrderSender
if exists(select * from Payments where GUID=@SourceSystemGuid)
begin
 raiserror('Duplicate payment exists SP_Insert_Payment',18,1)
 return
end

if @OriginatingSystem<>6 begin --V4 -- DF this is temp until below is fixed
	set @OriginatingSystem=5 --CC -- MP this is temp
	end

insert into Payments (Bank, [GUID], PayeeName, BankSortCode, BankAccountNo, 
	OurRef, InsuranceClaimNo, InsurancePolicyNo, Channel, PaymentType, OriginatingSystem, Amount, 
	CreateDate, CreatedBy)
select @BankId, @SourceSystemGuid, @PayeeName, @BankSortCode, @BankAccountNo, 
	@SourceSystemRef, @InsuranceClaimNo, @InsurancePolicyNo, @Channel, @PaymentType, @OriginatingSystem, @Amount, 
	getdate(), @userId
GO
