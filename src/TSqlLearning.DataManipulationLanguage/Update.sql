/*
UPDATE

UPDATE tab_name
    { SET column_1 = {expression | DEFAULT | NULL} [,...n]
    [FROM tab_name1 [,...n]]
    [WHERE condition]
*/

-- Preparatory Step
USE master
CREATE DATABASE UpdateLesson;
GO
USE UpdateLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	"Name" VARCHAR(128) NOT NULL,
	"Value" INT NOT NULL DEFAULT(0)
);
GO
INSERT INTO FirstTable VALUES
	('Ivan', 12),
	('Ivan', 13)
GO

-- Examples
UPDATE FirstTable
	SET "Value" = 11, "Name" = 'Vasyl'
	WHERE Id = 1;
GO
-- Combination with SELECT query
UPDATE FirstTable
	SET "Value" = 13, "Name" = 'Andrew'
	WHERE Id IN (SELECT Id FROM FirstTable WHERE "Name" = 'Vasyl');
GO
-- Using CASE statements
UPDATE FirstTable
	SET "Name" = CASE
		WHEN "Value" = 13 THEN 'Andrew'
		WHEN "Value" = 12 THEN 'Ivan'
		ELSE 'Vasyl'
	END
	WHERE Id = 2;
GO