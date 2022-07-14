-- SCRIPT.
-- Filter by date, number of days of history and price.

CREATE VIEW nyse_data_strategy_bar AS (
select * from nyse_data 
where date IN (select date from nyse_data where date BETWEEN '2000-01-01' AND '2022-04-01')
AND date IN (select date from nyse_data where open_price BETWEEN 1 AND 10)
AND ticker IN (select ticker from nyse_data group by ticker HAVING count(*) > 1000)
);