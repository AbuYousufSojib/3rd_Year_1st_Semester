use pubs

select *from authors where au_lname='White' and state='CA';

select *from titles
select *from authors

select title,ytd_sales from titles where ytd_sales>=8000;
select title,royalty from titles where royalty>=12 and royalty<=24;

select title,ytd_sales from titles where ytd_sales>=8000 order by title desc;

select type,Avg(price) from titles group by type having avg(price)>=15;
select type,AVG(price) as Avg_Price,SUM(ytd_sales) as Yearly_sales from titles group by type;

select "Name"=au_fname+ '.' +substring(au_lname,1,2),phone from authors

use pubs

select * from authors
select * from titles
select * from titleauthor
select * from publishers

select au_fname+au_lname as Name,title from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id;
--up 1(i)--

select au_fname+au_lname as Name,title,pub_name from authors join publishers on authors.city=publishers.city join titles on publishers.pub_id=titles.pub_id join titleauthor on authors.au_id=titleauthor.au_id

select au_fname+au_lname as Name,title,pub_name from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id join publishers on titles.pub_id=publishers.pub_id;
--pu 1(ii)--


SELECT * FROM titles WHERE royalty = (SELECT avg(royalty) FROM titles)

select * from authors
select * from titles
select * from titleauthor
select * from publishers

select AVG(royalty) from titles;

select * from titles where royalty=(select Max(royalty) from titles);

select au_fname+au_lname as Name,royalty,titles.title_id from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty in(select Max(royalty) from titles);

select au_fname+ ' '+au_lname as Name,authors.city,pub_name  from authors join publishers on authors.city=publishers.city;
/*task2:(iii): Show the author name, city, publisher name and city only for which the authors and the
publishers live in the same city*/

use University
drop table CustomerAndSuppliers
drop table Item
drop table Transactions
--creating table--

create table CustomerAndSuppliers(
cusl_id char(6) primary key check(cusl_id like'[CS][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname char(15) not null,
cusl_lname varchar(15),
cusl_address text,
cusl_telno char(12) check(cusl_telno like'[0][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city char(12) default'Rajshahi',
sales_amnt money check(sales_amnt >=0),
proc_amnt money check(proc_amnt >=0)
);

create table Item(
item_id char(6) primary key check(item_id like'[P][0-9][0-9][0-9][0-9][0-9]'),
item_name char(12),
item_category char(10),
item_price float check(item_price >=0),
item_qoh int check(item_qoh >=0),
item_last_sold date default getdate(),
);

create table Transactions(
tran_id char(10) primary key check(tran_id like'[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id char(6) foreign key references Item(item_id),
cusl_id char(6) foreign key references CustomerAndSuppliers(cusl_id), 
tran_type char(1) check(tran_type like'[SO]'),
tran_quantity int check(tran_quantity >=0),
tran_date datetime default getdate(), 
);

insert into CustomerAndSuppliers values('S61234','Md.Abu','Yousuf','Natore','017-12345623',default,21,22);
insert into CustomerAndSuppliers values('S01234','Md.Abu','Yousuf','Natore','017-12345623',default,21,22);
select * from CustomerAndSuppliers;

insert into Item values('P20001','Rice','Food',22.33,12,DEFAULT)
insert into Item values('P50001','Rice','Food',22.33,12,DEFAULT)
insert into Item values('P50007','Milk','Lequid',12.3,4,DEFAULT)
select * from Item;

insert into Transactions values('T123456785','P10001','S61234','o',6,default);
insert into Transactions values('T123456783','P50001','S61234','o',6,default);
select * from Transactions;
use pubs

ALTER PROC sp_showTitleAndAuthor
@title_id char(100)
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in (select au_id from
titleauthor where title_id=@title_id)
END

sp_showTitleAndAuthor 'BU1032'

create proc sp_updatePrice @titleid char(100)
as
begin
	declare @price Money
	select @price=price from titles where title_id=@titleid
	set @price=@price+0.1*@price
	if @price<=20
	update titles set price=@price where title_id=@titleid
end

EXEC sp_updatePrice 'BU7832'
EXEC sp_updatePrice 'BU1111'
use pubs
select * from Item

alter procedure sp_showTitleAndAuthor
as 
begin
select "Category"=item_category,"Sum"=SUM(item_qoh),"Average"=Avg(item_price) from Item group by item_category;
end

sp_showTitleAndAuthor
select * from Item

alter procedure sp_showTitleAndAuthor
@category_name char(100),
@price_value money
as 
begin
select * from Item where item_category=@category_name and item_price<@price_value; 
end

sp_showTitleAndAuthor 'Food',13


create trigger trg_test on item for insert 
as 
 begin
 print'one item insert into item table'
end
insert into Item values('P00007','Beef','Meat',12.3,4,DEFAULT)
insert into Item values('P00008','Water','Lequid',12.3,4,DEFAULT)

select * from Item

select * from Transactions

create trigger trg_update_C on Transactions for insert
as
begin
declare @item_id char(6), @tranamount int, @tran_type char(1),@cusld_id char(6),@price money
SELECT @item_id=item_id, @tranamount=tran_quantity, @tran_type=tran_type,@cusld_id =cusl_id FROM INSERTED 
Select @price=item_price from item where item_id=@item_id
 IF (@tran_type ='S')
 begin
       UPDATE Item SET item_qoh=item_qoh- @tranamount WHERE item_id=@item_id 
       update  CustomerAndSuppliers set sales_amnt=sales_amnt+(@price*@tranamount) where cusl_id=@cusld_id
     end
 ELSE
   begin
    UPDATE Item SET item_qoh=item_qoh+ @tranamount WHERE item_id=@item_id
    update  CustomerAndSuppliers set proc_amnt=proc_amnt+(@tranamount*@price) where cusl_id=@cusld_id
    end
end 

drop trigger trg_update_C

select * from Transactions
select * from CustomerAndSuppliers
select * from Item

insert into Item values('P11111','History2','Book',40.1,5,DEFAULT)
select * from Transactions

insert into Transactions values('T111111121','P20001','S01234','O',1,default);

CREATE TRIGGER trg_update_item ON Transactions FOR INSERT
AS
BEGIN
DECLARE @item_id char(6), @tranamount int, @tran_type char(1)
SELECT @item_id=item_id, @tranamount=tran_quantity, @tran_type=tran_type FROM INSERTED
IF (@tran_type ='S')
UPDATE Item SET item_qoh=item_qoh- @tranamount WHERE item_id=@item_id
ELSE
UPDATE Item SET item_price=item_price+ @tranamount WHERE item_id=@item_id
END

Create TRIGGER trg_update_CustomerAndSuppliers ON Transactions FOR INSERT
AS
BEGIN
DECLARE @cusl_id char(6), @salesamount money, @tran_type char(1)
SELECT @cusl_id=cusl_id, @tran_type=tran_type FROM INSERTED
IF (@tran_type ='S')
UPDATE CustomerAndSuppliers SET sales_amnt=sales_amnt+ @salesamount WHERE cusl_id=@cusl_id
ELSE
UPDATE CustomerAndSuppliers SET sales_amnt=sales_amnt+ @salesamount WHERE cusl_id=@cusl_id
END