/*
There are 2 ways to create a temp table
CREATE TABLE temp_table_name {...}
and
SELECT * INTO temp_table_name FROM ....

To specify temp table use naming like '#table_name' for the local temp table and '##table_name' the for global temp table
*/

-- Preparatory Step
USE master
CREATE DATABASE TempTablesLesson;
GO

--Examples
USE TempTablesLesson
CREATE TABLE #FirstTempTable
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	"Name" VARCHAR(128) NULL
);
GO

SELECT "Name" INTO #SecondTempTable FROM #FirstTempTable; 
GO