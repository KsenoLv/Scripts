-- Round prices to two decimal places and create a new table with the correct data.

CREATE TABLE table_name AS (
SELECT date, 
	ROUND(open_price, 2) AS new_open_price, 
	ROUND(open_price, 2) AS new_open_price, 
	ROUND(open_price, 2) AS new_open_price, 
	ROUND(open_price, 2) AS new_open_price
from table_name);

-- One value by date

UPDATE table_name SET open_price name = 7 where date = '2020-01-14';

--  Update a bunch of values 

UPDATE table_name SET open_price name = 7 WHERE open_price name = 0 OR open_price name < 0 ;