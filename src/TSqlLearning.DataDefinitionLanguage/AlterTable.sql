/*
You can update each table/column/constraint
*/

-- Preparatory Step
USE master
CREATE DATABASE AlterTableLesson;
GO
USE AlterTableLesson
CREATE TABLE FirstTable (
	Id INT NULL,
	NAME VARCHAR(128) NOT NULL
);
GO
CREATE TABLE SecondTable (
	Id INT NULL
);
GO

-- Examples
USE AlterTableLesson
ALTER TABLE FirstTable
	DROP COLUMN NAME;
GO
ALTER TABLE FirstTable
	ADD NewName VARCHAR(128) NOT NULL;
GO
ALTER TABLE SecondTable
	ALTER COLUMN Id INT NOT NULL;
GO
ALTER TABLE SecondTable
	ADD CONSTRAINT secondtable_primarykey PRIMARY KEY (Id);
ALTER TABLE SecondTable
	DROP CONSTRAINT secondtable_primarykey;

/*
Use sp_rename(db) system function to rename database/table/column
*/

-- Examples
USE AlterTableLesson
EXEC sp_rename @objname='FirstTable.NewName', @newname=newName2