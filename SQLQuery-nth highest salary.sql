use sample
go
create table employees
(
id int identity ,
salary float);
drop table employees
select *from employees
 insert into employees values(2000),(3000),(4000),(5000),(6000),(7000),(8000),(9000)

 select *from employees order by salary desc ;

 with result as (
 select salary,rank() over(order by salary desc) as salaryrank
 from employees
 )
 select top 1 salary from result where salaryrank=1
 