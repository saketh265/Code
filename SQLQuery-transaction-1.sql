use sample
go


create table billing(
addid int,
name varchar(40),
streetadd varchar(40),
housenumber int,
city varchar(40)
);

drop table billing


insert billing values(1,'saketh','rajkishore nagar',20,'vskp')

create table delivery(
addid int,
name varchar(40),
streetadd varchar(40),
housenumber int,
city varchar(40)
);
drop table delivery 

select *from billing
select *from delivery
delete billing where city='vkp'
insert billing values(1,'saketh','rajkishore nagar',20,'vkp')

insert into delivery(addid,name,streetadd,housenumber,city)
select addid,name,streetadd,housenumber,city from billing; 

ALTER TABLE delivery ALTER COLUMN city VARCHAR (5) NOT NULL;

ALTER TABLE billing ALTER COLUMN city VARCHAR (5) NOT NULL;

update billing set city='vskp' where addid=1



create or alter proc changecity
as
begin
begin try
begin transaction
update billing set city='vp' where addid=1
update delivery set city='vp' where addid=1
commit transaction
print 'transaction passed'
end try
begin catch
rollback transaction
print 'faced error'
end catch
end


changecity