/*
Syntax of the query to create a new table

CREATE TABLE table_name (
	col_name1 type1 [NOT NULL | NULL]
	[{, col_name2 type2 [NOT NULL | NULL]} ...]
)
*/

-- Preparatory Step
USE master
CREATE DATABASE CreateTableLesson;
GO

-- Examples
USE CreateTableLesson
CREATE TABLE FirstTable (
	StringColumn NVARCHAR(128) NOT NULL,
	NullableIntColumn INT NULL
);
CREATE TABLE [dbo].[SecondTable] (
	-- This default value will be assign instead of NULL
	StringColumnWithDefaultValue NVARCHAR(128) DEFAULT ( 'some default value' )
);
CREATE TABLE dbo.ThirdTable (
	-- IDENTITY( 5, 2 ) = autoincrement where 5 is a start value and 2 is a step
	IdColumn INT NOT NULL PRIMARY KEY IDENTITY ( 5, 2 )
);
GO