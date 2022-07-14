-- DB Creation.
CREATE DATABASE db_name;

-- Copy data.
copy and FROM 'C:\folder_name\file_name.csv' DELIMITER ';' CSV HEADER;

-- Copying data from database to file.
COPY (SELECT * FROM table_name WHERE column_name LIKE 'A%') TO 'C:\folder_name\file_name.csv';

-- Creating a Table.
-- These are columns and types for the example, use your own data.
CREATE TABLE table_name (
	DATE DATE NOT NULL PRIMARY KEY
  column_name INTEGER NOT NULL );

-- Filling the table.
-- This is just one table attribute for the example, use your data to fill in.
INSERT INTO table_name (DATE,TIME,OPEN,HIGH,LOW,CLOSE,VOL) 
VALUES ('20200102',000000,59.9200000,60.0500000,58.5600000,58.6100000,364436);

-- Renaming the columns for further convenience.
ALTER TABLE and RENAME COLUMN column_name TO new_column_name;

-- Change column data type.
ALTER TABLE table_name ALTER COLUMN column_name TYPE numeric(6, 2);



