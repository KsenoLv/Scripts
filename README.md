<a id="anchor"></a>
# Scripts for financial market.<br>

More than 100 scripts for complete analysis of financial markets with PostgreSQL.<br>
The main purpose is to be able to check any strategy on any financial market.<br>

The project is open to all, but is designed for personal use.<br>
The repository is updated, with ongoing support.<br>
_Вся информация доступна на Русском языке >>> [GitFlic.ru](https://gitflic.ru/project/kseno/skripty)_.<br>

## Technical requirements.

- PostgreSQL - PgAdmin. (Any database that supports PlpgSql)<br>

## Short description.

Repository created as an extension of the project [Server with financial data](https://github.com/KsenoLv/Server).<br>
The repository stores scripts for technical price analysis, strategies, risk management and more.

## File structure:

BASIC/ - Basic scripts for general understanding.<br>
- Change_data.sql - Change data.<br>
- Check-data.sql - Checking data for errors.<br>
- Dbcreation.sql - Creating databases and tables.<br>
- Dbinfo - Information about databases and tables.<br>
- Delete_data - Deleting information.<br>
- Function - Functions.<br>

STRATEGY/ - Full strategies.<br>
- Levels.sql - Levels search on the large amount of data.<br>
- Bar.sql - Bar strategies.

## PostgreSQL table structure:

The scripts use a query structure based on the table below.<br>
**The data is taken from the repository listed in the short description. There you will also find the original data files and tables.**<br>

Create a VIEW on your table with the following parameters:<br>

1 - Rename the columns to make them easier to read.<br>
2 - Round up prices to two decimal places.<br>
3 - Add a small analytics in the form of price difference between the closing, opening, maximum and minimum of the day.<br>
4 - Also for one of the strategies we will add a gap, the difference between today's close and the next day's open.<br>
5 - Let's add a date filter for a specific period of time.<br>

```
CREATE VIEW nyse_view AS (
select 
    date AS date, 
    symbols AS Ticker, 
	ROUND(close, 2) AS close_price, 
	ROUND(high, 2) AS high_price, 
	ROUND(low, 2) AS low_price, 
	ROUND(open, 2) AS open_price,
	ROUND(open - close, 2) AS open_close, 
	ROUND(high - low, 2) AS high_low,
	ROUND(open - high, 2) AS open_high, 
	ROUND(close - low, 2) AS close_low,
	ROUND(open - low, 2) AS open_low,
	ROUND(high - close, 2) AS high_close,
	ROUND(lag(close) over (order by date), 2) AS gep
from nyse_data WHERE date > '1983-05-09');
```

Change the script if you will use different column and table names. In that case, don't forget to change the data in all scripts.<br>

##### nyse_view - table:

| Date | Ticker | Close_price | high_price | low_price | open_price | open_close | high_low | open_high | close_low | open_low | high_close | gep |
|:----:|:-----------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
| Date | Varchar(10) | Numeric | Numeric | Numeric | Numeric | Numeric | Numeric | Numeric | Numeric | Numeric 
| 1983-05-09 | GIBL | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 | 13.12 |

----

Subscribe to updates and news >>> [Telegram](https://t.me/fxmmsqleng)

----

Author: Mikhail Ksenofontov<br>
Contact: ksenofontov.mihail@gmail.com<br>
Page: [www.kseno.site](https://www.kseno.site)

[Up](#anchor)