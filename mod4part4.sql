-build database
@c:\crpg250\module4\Build_JLDB.sql

--Question 1: settings for output
set echo on;
set linesize 132;
set pagesize 66;
spool c:\cprg250\module4\mod4part4spool.txt

--Question 2
COLUMN "Pub Date" FORMAT A20
SELECT initcap(Lname) AS "Surname", initcap(title) AS "Book Title", TO_CHAR(pubdate, 'fmMonth DD, YYYY') AS "Pub Date", retail AS "Final Price"
FROM Author a, Books b, Bookauthor ba
WHERE b.isbn = ba.isbn AND a.authorID = ba.authorID
ORDER BY title;

CLEAR COLUMNS;

--Question 3 
COLUMN "Date Published" FORMAT A20
COLUMN "Review Date" FORMAT A20
SELECT initcap(title) AS "Book Title", pubdate AS "Date Published", ADD_MONTHS(pubdate, 6) AS "Review Date"
FROM Books
ORDER BY title;

CLEAR COLUMNS;
--Question 4 
SELECT initcap(title) AS "Book Title", TO_CHAR(retail, '9,999.00') AS "Price", TO_CHAR(cost, '9,999.00') AS "Cost", TO_CHAR((retail-cost)/cost*100, '9,999.00') AS "% profit"
FROM Books
ORDER BY 4 DESC; 

--Question 5
SELECT title AS "Book Title", TO_CHAR((retail-cost)/cost*100.0, '9,999.00') AS "Margin", TO_CHAR (discount, '9,999.00') AS "Discount",
(CASE 
	WHEN discount IS NOT NULL THEN 'Discounted, will NOT be restocked'
	WHEN (retail-cost)/cost*100.0 >= 60 THEN 'Very High Profit'
	WHEN (retail-cost)/cost*100.0 >= 30 THEN 'High Profit'
	WHEN (retail-cost)/cost*100.0 >= 0 THEN 'Loss Leader'
	END)"Pricing Structure" 
FROM Books
ORDER BY title;

spool off


 