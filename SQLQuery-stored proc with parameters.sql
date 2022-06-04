create or alter proc pr_bird

@BirdName varchar(50),
@TypeOfBird varchar(50)
as 
begin
select ID,ScientificName from bird 
where BirdName=@BirdName and TypeOfBird=@TypeOfBird

end

 pr_bird 'Cassins Sparrow','Sparrow'


select *from Bird