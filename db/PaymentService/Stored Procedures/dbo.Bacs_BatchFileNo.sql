SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc	[dbo].[Bacs_BatchFileNo]
as
set transaction isolation level read uncommitted
set nocount on

declare @uniqueNo int,@tablename varchar(50),@padlength int

select @tablename='BACS - BatchFileNo',@padlength=7

select 
	@uniqueNo=x.uniqueNo
from (
	select
		isnull((
			select code 
			from syslookup 
			where tablename=@tablename)
		,0) [uniqueNo]
)x

insert into sysLookup( 
	TableName,Code 
)
select @tablename,@uniqueNo
where not exists(
	select * from sysLookup where TableName=@tablename 
)

update s
	set s.code=replace(str(@uniqueNo+1,@padlength),' ',0)
from syslookup s 
where tablename=@tablename
GO
