/*
CASE

CASE expression_1
    {WHEN expression_2 THEN result_1} ...
    [ELSE result_n]
END

CASE
    {WHEN condition_1 THEN result_1} ...
        [ELSE result_n]
END
*/

-- Preparatory Step
USE master
CREATE DATABASE CaseLesson;
GO
USE CaseLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	"Name" VARCHAR(128) NOT NULL,
	"Value" INT NOT NULL DEFAULT(0)
);
GO
INSERT INTO FirstTable VALUES
	('Ivan', 12),
	('Andrew', 13),
	('Vasyl', 11),
	('Vasyl', 11),
	('Ivan', 12),
	('Andrew', 14),
	('Vasyl', 11);
GO

-- Examples
SELECT
	CASE
		WHEN "Value" = 11 THEN 'Value is 11'
		WHEN "Value" = 12 THEN 'Value is 12'
		ELSE 'Value has another value =)'
	END as 'Result'
	FROM FirstTable;

SELECT
	CASE
		WHEN "Value" = (SELECT MAX("Value") FROM FirstTable)
			THEN 'Value has max value =('
		ELSE 'Value has another value =)'
	END as 'Result'
	FROM FirstTable;

UPDATE FirstTable
	SET "Name" =
		CASE
			WHEN "Value" = 13 THEN 'Andrew'
			WHEN "Value" = 12 THEN 'Ivan'
			ELSE 'Vasyl'
		END;
GO