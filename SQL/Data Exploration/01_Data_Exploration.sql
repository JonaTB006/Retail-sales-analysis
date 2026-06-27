use WideWorldImportersDW;

/*
  Objective:
  Understand the structure of the data warehouse before
  performing any business analysis.
*/

/*------------------------------------------------------------
1. Retrieve all schemas available in the database
------------------------------------------------------------*/
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA;

/*------------------------------------------------------------
2. Retrieve schemas that contain tables
------------------------------------------------------------*/
SELECT DISTINCT TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
ORDER BY 1;

/*------------------------------------------------------------
3. Retrieve all tables by schema
------------------------------------------------------------*/
SELECT TABLE_SCHEMA, 
		TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY 1,2;

/*------------------------------------------------------------
4. Retrieve columns and data types for all tables
------------------------------------------------------------*/

SELECT TABLE_SCHEMA,
		TABLE_NAME,
		COLUMN_NAME,
		DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
ORDER BY 1,2;

/*------------------------------------------------------------
5. Retrieve Keys in all tables
------------------------------------------------------------*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%Key'
ORDER BY TABLE_SCHEMA,
         TABLE_NAME,
         COLUMN_NAME;


/*------------------------------------------------------------
6. Retrieve tables in fact schema
------------------------------------------------------------*/

SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'FACT'
ORDER BY 1;

/*------------------------------------------------------------
7. Retrieve table_name and it's colums in fact schema
------------------------------------------------------------*/

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'FACT'
ORDER BY 1;

/*------------------------------------------------------------
8. Retrieve tables in dimension schema
------------------------------------------------------------*/

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'DIMENSION'
ORDER BY 1;

/*------------------------------------------------------------
9. Retrieve table_name and it's colums in dimension schema
------------------------------------------------------------*/

SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'DIMENSION'
ORDER BY 1;

/*------------------------------------------------------------
10. data tables exploration
------------------------------------------------------------*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Fact'
  AND TABLE_NAME = 'Sale'
ORDER BY ORDINAL_POSITION;


SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dimension'
  AND TABLE_NAME = 'Customer';

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dimension'
  AND TABLE_NAME = 'city';


SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dimension'
  AND TABLE_NAME = 'date';


SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dimension'
 AND TABLE_NAME = 'STOCK ITEM'

SELECT TOP 10 *
FROM Fact.[Sale]
ORDER BY [Sale Key];

SELECT TOP 10 *
FROM Dimension.[Stock Item]