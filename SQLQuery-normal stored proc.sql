if(exists(select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='Bird'))
begin
select *from Bird
end

--creating stored proc

create or alter proc pr_bird
as 
begin
select *from Bird
end

exec pr_bird