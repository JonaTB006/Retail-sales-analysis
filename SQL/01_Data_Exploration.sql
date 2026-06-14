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
4. Retrieve Keys in all tables
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

