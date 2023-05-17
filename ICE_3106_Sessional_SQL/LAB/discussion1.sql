use pubs
select *from sysobjects
select *from sysobjects where xtype='U';

select * from authors;

select au_fname+ ' ' + au_lname as Name,address from authors;

select *from authors where au_lname='White' and state='CA';

select *from titles

/*Task1: Show the name of the books which have yearly total sales of more than 8000*/
select title,ytd_sales from titles where ytd_sales>=8000;

/*Task2: Show the name of the books which have royalty of 12 to 24*/
select title from titles where royalty>=12 and royalty<=24;
--same output
select title from titles where royalty between 12 and 24;
--using order by
select title,price from titles where royalty between 12 and 24 order by price desc;

--Suppose we want to show the book type and the average price of the each type.--

select * from titles
select type,AVG(price) from titles group by type

/*Suppose we want to show the book type and the average price of the each type if average price is higher than a given values , say, 15*/

select type,AVG(price) from titles group by type having AVG(price)>15

/*Task3: Show average price of the books of each type, the total yearly sales of that book type
along with book type*/

select type,AVG(price),SUM(ytd_sales) from titles group by type

/* We want to show the author name and ph no. where the name should be in the following manner
J. White, i.e. First letter of first name dot last name*/
select "Name"=SUBSTRING(au_fname,1,1)+ ''+ au_lname,phone from authors


SELECT au_lname, pub_name FROM authors, publishers where  authors.city=publishers.city

--Show author name,phone number and publisher name.
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname), phone,pub_name FROM authors, publishers where  authors.city=publishers.city

/*Task 2(iii):Show the author name, city, publisher name and city only for which the authors and the
publishers live in the same city */
--discussion 2--
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname),authors.city,pub_name,publishers.city  FROM authors ,publishers where  authors.city=publishers.city

SELECT "Name"=au_fname + '. '+ (au_lname),authors.city,pub_name,publishers.city  FROM authors ,publishers where  authors.city=publishers.city