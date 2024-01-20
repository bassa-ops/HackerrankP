DELIMITER
CREATE PROCEDURE stars(r INT) BEGIN WHILE r >= 1 DO SELECT repeat('* ', r); SET r = r - 1; END WHILE; END;
CALL stars(20);

**# HackerrankP /*Challenges practising Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s. where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
Note: There will be at least two entries in the table for each type of occupation.*/ **
  
SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS NameAndProfession FROM OCCUPATIONS ORDER BY NameAndProfession;
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', CASE WHEN Occupation = 'Doctor' THEN 'doctors' WHEN Occupation = 'Singer' THEN 'singers' WHEN Occupation = 'Actor' THEN 'actors' WHEN Occupation = 'Professor' THEN 'professors' END, '.') FROM OCCUPATIONS GROUP BY Occupation ORDER BY COUNT(Occupation);
-- Each item in a web shop belongs to a seller. To ensure service quality, each seller has a rating.
--
-- The data are kept in the following two tables:
--
-- TABLE sellers
--   id INTEGER PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   rating INTEGER NOT NULL
--
-- TABLE items
--   id INTEGER PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   sellerId INTEGER REFERENCES sellers(id)
--
-- Write a query that selects the item name and the name of its seller for each item that belongs to a seller with a rating greater than 4.
--
-- Suggested testing environment:
-- http://sqlite.online/

-- Example case create statement:
-- CREATE TABLE sellers (
--   id INTEGER NOT NULL PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   rating INTEGER NOT NULL
-- );
--
-- CREATE TABLE items (
--   id INTEGER NOT NULL PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   sellerId INTEGER REFERENCES sellers(id)
-- );
--
-- INSERT INTO sellers(id, name, rating) VALUES(1, 'Roger', 3);
-- INSERT INTO sellers(id, name, rating) VALUES(2, 'Penny', 5);
--
-- INSERT INTO items(id, name, sellerId) VALUES(1, 'Notebook', 2);
-- INSERT INTO items(id, name, sellerId) VALUES(2, 'Stapler', 1);
-- INSERT INTO items(id, name, sellerId) VALUES(3, 'Pencil', 2);
--
-- Expected output (in any order):
-- Item      Seller
-- ----------------
-- Notebook  Penny
-- Pencil    Penny

select items.name, sellers.name from items
join sellers on items.sellerId = sellers.id
where sellers.rating > 4;
