create table sales(
salesagent varchar(20),
salescountry varchar(20),
salesamount int
);

select *from sales

insert into sales values('harish','india',4000),('hari','india',5000),('harih','uk',6000),('arish','uk',7000),('sh','uk',8000)

select salesagent,india,uk
from sales
pivot(
sum(salesamount)
for salescountry
in([india],[uk]))
as p