SHOW DATABASES;
CREATE DATABASE <database_name>;
DROP DATABASE <database_name>;

SHOW DATABASES LIKE '*DWH*';
SHOW TABLES IN <database_name> LIKE '*ABT*';
DESCRIBE FORMATTED <table_name>;

DROP TABLE IF EXISTS <table_name>;

CREATE EXTERNAL TABLE IF NOT EXISTS <table_name>
STORED AS ORC
AS SELECT * FROM <table_name2>;

CREATE EXTERNAL TABLE IF NOT EXISTS <table_name>
STORED AS PARQUET
AS SELECT * FROM <table_name2>;

CREATE TABLE <table_name>
STORED AS ORC TBLPROPERTIES('ORC.COMPRESS'='SNAPPY')
AS SELECT * FROM <table_name2>;

CREATE TABLE IF NOT EXISTS <database_name>.<table_name>(txn_id BIGINT, cust_id INT, amount DECIMAL(20,2),txn_type STRING, created_date DATE)
COMMENT 'A table to store transactions'
PARTITIONED BY (txn_date DATE)
STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS <database_name>.<table_name>(txn_id BIGINT, cust_id INT, amount DECIMAL(20,2), created_date DATE)
COMMENT 'A table to store transactions'
PARTITIONED BY (txn_date DATE, txn_type STRING)
STORED AS PARQUET;

SELECT CAST(snr_5309 AS STRING FORMAT 'YYYY-MM') AS format_5309
