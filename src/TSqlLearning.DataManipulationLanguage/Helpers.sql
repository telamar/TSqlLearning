-- Preparatory Step
USE master
CREATE DATABASE DmlHelpersLesson;
GO
USE DmlHelpersLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	"Name" VARCHAR(128) NOT NULL,
	"Value" INT NOT NULL DEFAULT(0)
);
GO
INSERT INTO FirstTable VALUES
	('Ivan', 12),
	('Andrew', 13),
	('Vasyl', 11);
GO

/*
TRUNCATE TABLE

This command deletes all data from the table and resets an index of the IDENTITY constraint

TRUNCATE TABLE table_name
*/

-- Examples
TRUNCATE TABLE FirstTable;
GO

/*
OUTPUT

Save information about completed operation(s) (see examples)
*/

-- Examples
-- TEMP table to save deleted data
DECLARE @deleteTable TABLE (Id INT NOT NULL, "Name" VARCHAR(128) NOT NULL);
-- DELETE query with OUTPUT statement
DELETE FROM FirstTable
	OUTPUT deleted.Id, deleted."Name" INTO @deleteTable
	WHERE "Name" = 'Ivan';
-- Selection from the TEMP table
SELECT * FROM @deleteTable;
GO

/*
MERGE
see https://docs.microsoft.com/en-us/sql/t-sql/statements/merge-transact-sql?view=sql-server-2017
*/