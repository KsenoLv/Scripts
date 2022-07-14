-- Data deletion. 

-- Deleting one row.
DELETE FROM table_name WHERE date = '2020-01-13';

-- Deletion of multiple rows by criterion.
DELETE FROM table_name WHERE column_name <= 0;

-- Complex data deletion, all invalid data of one column.
DELETE FROM table_name 
	WHERE column_name = 0 OR column_name < 0 
	OR column_name NOT BETWEEN 53 AND 92 
	OR column_name / column_name != 1;

-- Deleting table.
DROP TABLE table_name;

-- Deletion of the database.
DROP DATABASE table_name;

-- Deletion of the column.
ALTER TABLE db_name DROP COLUMN column_name;

-- Deleting functions.
drop function_name();