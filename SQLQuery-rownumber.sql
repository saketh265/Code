use sample
go

create table employees(
id int,
Nam nvarchar(40),
company nvarchar(40),
gender nvarchar(40)
);
select *from employees
truncate table employees
insert employees values(1,'saketh','hcl','male'),(1,'saketh','dell','male'),(1,'saketh','hcl','male'),(1,'saketh','hcl','male'),(2,'naveen','dell','male'),
(2,'naveen','dell','male'),(3,'lilly','tcs','female'),(3,'lilly','tcs','female'),(3,'lilly','tcs','female'),(3,'lilly','tcs','female')
with employees as 
(
select *,ROW_NUMBER()over( partition by id  order by id) as reduce
from employees
)
delete from employees where reduce>1 

