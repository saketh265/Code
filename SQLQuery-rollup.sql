 use sample
 go
 if(not exists(select *from INFORMATION_SCHEMA.TABLES
 where TABLE_NAME='emp' ))
 begin
 create table emp(
 id int identity ,
 name varchar(max),
 salary money
 )
 end
 insert into emp values('camdy',34567),('senu',3876),('seeny',3765),('can',345),('cam',3456)

 select *from emp
 --rollup
 select name,sum(salary) as grandtotal
 from emp
 group by rollup(salary,name)