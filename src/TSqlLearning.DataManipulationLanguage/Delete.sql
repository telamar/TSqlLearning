/*
DELETE

DELETE FROM table_name
    [WHERE predicate];
    
DELETE table_name
    FROM table_name [,...n]
    [WHERE condition];
*/

-- Preparatory Step
USE master
CREATE DATABASE DeleteLesson;
GO
USE DeleteLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	"Name" VARCHAR(128) NOT NULL,
	"Value" INT NOT NULL DEFAULT(0)
);
GO
CREATE TABLE SecondTable (
	"Name" VARCHAR(128) NOT NULL
);
GO
INSERT INTO FirstTable VALUES
	('Ivan', 12),
	('Andrew', 13),
	('Vasyl', 11)
INSERT INTO SecondTable VALUES ('Vasyl')
GO

-- Examples
DELETE FROM FirstTable WHERE "Name" = 'Ivan';
GO
-- Combination with SELECT query
DELETE FROM FirstTable WHERE Id IN (
	SELECT Id FROM FirstTable WHERE "Name" = 'Andrew');
GO
-- DELETE with WHERE statement that uses data from another table
DELETE FirstTable
FROM FirstTable as ft, SecondTable as st
WHERE ft."Name" = st."Name";
-- Delete all
DELETE FROM FirstTable;
GO