CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
    
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO

drop table SourceProducts
drop table TargetProducts
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts

create or alter proc pr_insert
as
begin
merge  TargetProducts as target
using SourceProducts as source
on source.ProductId=target.ProductId

when not matched by target then
insert(ProductID,ProductName, Price)
values(source.ProductID,source.ProductID,source.Price);
end

exec pr_insert



--DROP PROCEDURE IF EXISTS [insertingproducts]

--update 
create or alter proc pr_update
as
begin
merge  TargetProducts as target
using SourceProducts as source
on source.ProductId=target.ProductId

WHEN MATCHED THEN UPDATE SET
        Target.ProductName	= Source.ProductName,
        Target.Price		= Source.Price;
end
exec pr_update