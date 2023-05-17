use University
select * from item;

alter procedure Demo
as 
begin
	select item_catagory as Category,SUM(item_qoh),AVG(item_price) from Item group by item_catagory
end

Demo

create procedure Demo2
@catagory_name char(15),
@price_value money
as
begin
	select * from Item where item_catagory=@catagory_name and item_price<@price_value 
end

Demo2 'phone',58



