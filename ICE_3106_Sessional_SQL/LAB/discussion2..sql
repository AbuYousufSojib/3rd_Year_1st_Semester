select * from authors
select * from titleauthor
select * from titles
select * from publishers
select * from pub_info

/*The following query shows author’s last name and title id of books */

SELECT au_lname, title_id FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id

/* Task 1:
i) Show the title of a book, the corresponding author name.
ii) Show the title of a book, the corresponding author and publisher name */
-- number i--
select title,au_fname+au_lname as Name from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id;

--number ii--
select title,au_fname+au_lname as Name,pub_name from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id join publishers on titles.pub_id=publishers.pub_id;


/*Task 2(iii):Show the author name, city, publisher name and city only for which the authors and the
publishers live in the same city */
--discussion 2--
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname),authors.city,pub_name,publishers.city  FROM authors ,publishers where  authors.city=publishers.city

/*Task 3:
iv) Show the author name(s) of the book which has the maximum royalty*/
--max royalty--
select MAX(royalty) from titles

select au_fname+au_lname as Name from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty=(select MAX(royalty) from titles);


