-build database
@c:\crpg250\module4\Build_JLDB.sql

--settings for output
set echo on;
set linesize 132;
set pagesize 66;
spool c:\cprg250\module4\mod4part2spool.txt

--Question 1
SELECT firstname, lastname
FROM customers
WHERE state = 'CA'
ORDER BY lastname, firstname;

--Question 2
SELECT title, category
FROM books
WHERE retail-cost < 15
ORDER BY category, title;

--Question 3
SELECT title
FROM books
WHERE category = 'COMPUTER' AND discount > 3;

--Question 4
SELECT firstname, lastname, region
FROM customers
WHERE region != 'N' AND region != 'NW' AND region != 'NE'
ORDER by lastname DESC, firstname ASC;

--Question 5
SELECT firstname, lastname, region
FROM customers
WHERE NOT region = 'N' AND NOT region = 'NW' AND NOT region = 'NE'
ORDER by lastname DESC, firstname ASC;

spool off