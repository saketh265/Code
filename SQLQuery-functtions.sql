create function fn_bird(@ID int)
returns int
as 
begin
return(
select count(TypeOfBird) from Bird


)
end

select dbo.fn_bird(1) as count,BirdName from bird