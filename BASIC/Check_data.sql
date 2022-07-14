-- Check the data for errors.

-- Check for NULL.
SELECT * from table_name 
    WHERE column_name IS null
    OR column_name IS null 
;

-- Checking for 0 or negative prices.
SELECT * from table_name 
    WHERE column_name <= 0
    OR column_name <= 0;

-- CHECK FOR ABNORMAL PRICES.

-- If no price range is known, find out the price range.
SELECT column_name from table_name ORDER BY column_name DESC;
SELECT column_name from table_name ORDER BY column_name ASC;
    
-- Range is known.
SELECT * from table_name WHERE column_name NOT BETWEEN 53 AND 92;
SELECT * from table_name WHERE column_name NOT LIKE '___.%';

-- Checking for invalid data (characters, letters, spaces ....).
SELECT * from table_name 
    WHERE column_name / column_name != 1
    OR column_name / column_name != 1;

-- Check for duplicates, DATE.
SELECT count(*), date from table_name
	group by date
having count(*) > 1;


-- Subquery for everything.
select * from table_name 
WHERE 
date IN (select date from b WHERE date ~ '[А-Яа-яA-Za-z]' OR date ~ '[!@#$%^&*( )_+?></\:""''-]'
	OR date LIKE 'NULL' 
    OR char_length(date) != 8)
	OR date IN (SELECT date from b group by date having count(*) > 1)
    OR column_name IN (select column_name from b WHERE column_name ~ '[А-Яа-яA-Za-z]' 
    OR column_name ~ '[!@#$%^&*( )_+?></\:""''-]'	
    OR column_name LIKE 'NULL');

-- CHANGING THE INFORMATION IN THE ERROR CORRECTION TABLE.

-- Updating information .
-- One value.
UPDATE table_name SET column_name = 7 where date = '2020-01-14';

-- Update a bunch of values.
UPDATE table_name SET column_name = 7 WHERE column_name = 0 OR column_name < 0 ;

-- Adding a row.
INSERT INTO table_name (date, column_name, column_name, column_name, close) 
VALUES ('20220102', 59.92, 60.05, 58.56, 58.61);