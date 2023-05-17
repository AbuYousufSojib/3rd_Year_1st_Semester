create TABLE CustomerAndSuppliers
(
cusl_id CHAR(6) PRIMARy KEY CHECK (cusl_id LIKE('[CS][0-9][0-9][0-9][0-9][0-9]')),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT,
cusl_telno CHAR(12) CHECK(cusl_telno LIKE('[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
cusl_city CHAR(12) DEFAULT 'Rajshahi',
sales_amnt MONEY CHECK(sales_amnt>=0),
proc_amnt MONEY CHECK(proc_amnt>=0)
)

create table Item
(
item_id char(6) primary key check (item_id like ('[P][0-9][0-9][0-9][0-9][0-9]')),
item_name char(12),
item_catagory char(10),
item_price float check(item_price>=0),
item_qoh int check(item_qoh>=0),
item_last_sold datetime  default getdate()
)

create table Transactions
(
tran_id char(10) primary key check (tran_id like '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id char(6) foreign key references Item(item_id), 
cusl_id char(6) foreign key references customerAndsuppliers(cusl_id) ,
tran_type char(1),
tran_quantity int check (tran_quantity>=0),
tran_date datetime default getdate()

)

INSERT CustomerAndSuppliers VALUES ('C00001','Iqbal','Hossain','221/B Dhanmondi','017-00000000',default,10,10)
INSERT CustomerAndSuppliers VALUES ('C00002','Tanzim','Hossain','221/B Dhanmondi','017-00000000',default,10,10)

select * from CustomerAndSuppliers;

--drop table CustomerAndSuppliers

insert Item values('P00001','Tofail','Phone',57.8,23,default)
insert Item values('P00002','Imran','Phone',57.8,23,default)
insert Item values('P00003','Asraf','Laptop',57.8,23,default)

select * from Item

--drop table Item


insert transactions values('T000000001','P00001','C00001','s',10,default)
insert transactions values('T000000001','P00002','C00002','s',10,default)

select * from Transactions

--drop table Transactions




CREATE TRIGGER trg_update_C ON Transactions FOR INSERT
AS
BEGIN
DECLARE @item_id char(6), @tranamount int, @tran_type char(1),@cusld_id char(6),@price money
SELECT @item_id=item_id, @tranamount=tran_quantity, @tran_type=tran_type,@cusld_id =cusl_id FROM INSERTED
Select @price=item_price from item where item_id=@item_id
 IF (@tran_type ='S')
     begin
       UPDATE Item SET item_qoh=item_qoh- @tranamount WHERE item_id=@item_id 
       update  CustomerAndSuppliers set sales_amnt=sales_amnt+@price*@tranamount where cusl_id=@cusld_id
     end
 ELSE
   begin
    UPDATE Item SET item_qoh=item_qoh+ @tranamount WHERE item_id=@item_id
    update  CustomerAndSuppliers set proc_amnt=proc_amnt+@tranamount*@price where cusl_id=@cusld_id
    end
END