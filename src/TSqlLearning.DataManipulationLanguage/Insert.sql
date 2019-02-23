/*
INSERT

INSERT [INTO] tab_name [(col_list)]
    DEFAULT VALUES | VALUES ({ DEFAULT | NULL | expression } [ ,...n] )
    
INSERT INTO tab_name | view_name [(col_list)]
    {select_statement | execute_statement}
*/

-- Preparatory Step
USE master
CREATE DATABASE InsertLesson;
GO
USE InsertLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	"Name" VARCHAR(128) NOT NULL,
	"Value" INT NOT NULL DEFAULT(0)
);
GO

-- Examples
-- Id is primary key
INSERT INTO FirstTable VALUES ('Ivan', 12);
GO
-- 'Value' column has default value
INSERT INTO FirstTable VALUES ('Ivan', DEFAULT);
GO
-- Multiple insert
INSERT INTO FirstTable VALUES
	('Ivan', 12),
	('Ivan', DEFAULT);
GO
-- Insert named values
INSERT INTO FirstTable ("Value", "Name") VALUES (12, 'Ivan');
GO
-- Insert result of SELECT query
INSERT INTO FirstTable ("Value", "Name")
	SELECT "Value", "Name"
		FROM FirstTable
		WHERE Id = 1;
GO