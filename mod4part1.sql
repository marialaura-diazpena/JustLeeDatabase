--database Just Lee
@c:/cprg250/build_jldb.sql

--Question 1
SET echo ON;
SET linesize 132;
SET pagesize 66;
spool c:\cprg250\module4\mod4part1spool.txt

--Question 2
SELECT title AS "Book Title" FROM books;

--Question 3
SELECT lastname AS "Last Name", firstname AS "First Name", address AS "Address", city AS "City", state AS "State", zip AS "Zip"
From customers;

--Question 4
SELECT title, cost, retail, (retail-cost)/cost*100 AS "% Profit" FROM books;

--Question 5
SELECT UNIQUE authorID AS "Author ID" FROM bookauthor;

spool off