SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[OPTICARD_ProcessFile]
as
set nocount on
set transaction isolation level read uncommitted

delete from ot
from ppd3.dbo.Opticard_Transactions ot
join ppd3.dbo.Opticard_Cards oc on ot.cardID = oc.ID
where AuthCode is null
and exists (
	select * from dbo.OPTICARD_FileLOAD
	where CardNumber=oc.CardNo
and amount=ot.amount and TransactionType=ot.TransType and convert(varchar(12),TransDate,113)=convert(varchar(12),ot.TransDate,113)
)

/* insert new transaction records */
insert into ppd3.dbo.Opticard_Transactions ( CardID, Amount, Authcode, TransDate, TransType, CreateDate, CreatedBy )
select c.id,l.TransactionAmount,l.AuthCode,l.TransactionTime,l.TransactionType,getdate(),'sys.mq'
from dbo.OPTICARD_FileLOAD l
join ppd3.dbo.Opticard_Cards c on c.CardNo=l.CardNumber

/* update card balance using balance from last transaction */
update c set c.balance=l.CardBalance
from ppd3.dbo.Opticard_Cards c
join dbo.OPTICARD_FileLOAD l on l.CardNumber=c.CardNo
where l.id= (
	select top 1 id
	from dbo.OPTICARD_FileLOAD
	where cardnumber=l.CardNumber
	order by TransactionDate desc
)

truncate table dbo.OPTICARD_FileLOAD
GO
