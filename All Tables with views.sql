--views

create table tblemployees(
id int,
name varchar(40),
gender varchar(40),
departmentid int
);
select *from tblDepartment
select *from tblemployees

insert tblemployees values(1,'saketh','male',3),(2,'manish','male',3),(3,'kajal','female',2),(4,'roshan','male',2),(5,'karthik','male',4),(6,'saranya','female',4)

create or alter view vwtotal  as select  deptname,departmentid,count(*) as totalemp from tblemployees
join tblDepartment
on tblemployees.departmentid=tblDepartment.deptid
group by deptname,departmentid

select *from vwtotal

select deptname,totalemp from vwtotal
where totalemp>1

--temp tables

select  deptname,departmentid,count(*) 
as totalemp 
into #temptable
from tblemployees
join tblDepartment
on tblemployees.departmentid=tblDepartment.deptid
group by deptname,departmentid


select *from #temptable

select deptname,totalemp from #temptable
where totalemp>1

--derived table

select deptname,totalemp from
(
select  deptname,departmentid,count(*) 
as totalemp 
from tblemployees
join tblDepartment
on tblemployees.departmentid=tblDepartment.deptid
group by deptname,departmentid
) as empcount
where totalemp>1

--cte

with empcount(deptname,totalemp) as 
(
select  deptname,departmentid,count(*) 
as totalemp 
from tblemployees
join tblDepartment
on tblemployees.departmentid=tblDepartment.deptid
group by deptname,departmentid
) 
select deptname,totalemp from vwtotal
where totalemp>1