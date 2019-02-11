-- Preparatory Step
USE master
CREATE DATABASE HelpersLesson;
GO
USE HelpersLesson
CREATE TABLE FirstTable (
	StringColumn NVARCHAR(128) NOT NULL
);
GO

/*
SYNONYM
Allows us to simplify long names (analog of aliases in C#)
*/

--Examples
CREATE SYNONYM fthl FOR [dbo].[HelpersLesson].[FirstTable];
GO