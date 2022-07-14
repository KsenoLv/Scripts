-- FILE SYSTEM
-- Location
SHOW data_directory;

-- Change the folder (carefully!!!).
SET data_directory to new_directory_path;

-- TABLES and DB.
-- DB change without rebooting (not for all parameters !!!)
SELECT pg_reload_conf();

-- Size of a specified database.
SELECT pg_database_size('my_database');
SELECT pg_size_pretty(pg_database_size(current_database()))
select datname, pg_size_pretty(pg_database_size(datname)) 
from pg_database;

-- The size of the 20 largest tables.
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_relation_size(C.oid)) AS "size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname NOT IN ('pg_catalog', 'information_schema')
  ORDER BY pg_relation_size(C.oid) DESC
  LIMIT 20;

-- List of all tables.
SELECT table_name FROM information_schema.tables
WHERE table_schema NOT IN ('information_schema','pg_catalog');

-- FUNCTIONS.
-- List of all user-defined functions. (check required !!!).
select oid, * from pg_namespace ;

-- REQUIREMENTS.
-- Query times and intervals.
SELECT pid, age(query_start, clock_timestamp()), usename, query
FROM pg_stat_activity
WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%'
ORDER BY query_start desc;

-- Stop a specific query.
SELECT pg_cancel_backend(procpid);

-- End the query.
SELECT pg_terminate_backend(procpid);

-- USERS.
-- List.
SELECT datname,usename,client_addr,client_port FROM pg_stat_activity;