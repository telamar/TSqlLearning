/*
You can create Sequence that is analog of Identity constraint.

CREATE SEQUENCE name
AS type
START WITH value
INCREMENT BY value
MINVALUE value
MAXVALUE value
[NO]CYCLE
*/

-- Preparatory Step
USE master
CREATE DATABASE CreateSequenceLesson;
GO

-- Examples
USE CreateSequenceLesson
CREATE SEQUENCE MySequence
AS INT
START WITH 1
INCREMENT BY 2
MINVALUE 1
MAXVALUE 10
CYCLE;

-- Examples (sequence usage)
CREATE TABLE MyTable (
	DefaultIntValue INT DEFAULT(NEXT VALUE FOR MySequence) NOT NULL,
	IntValue INT NOT NULL
);
GO
INSERT INTO MyTable ("IntValue") VALUES (NEXT VALUE FOR MySequence);
GO
SELECT * FROM MyTable;
GO

/*
Also you can update or delete the existing sequence with ALTER/DROP commands
*/