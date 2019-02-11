/*
Several steps to enable filestream feature:
1) Windows -> Sql Server Configuration Manager -> SQL Server -> Properties -> Filestream
2.1) Microsoft SQL Server Management Studio -> Objects Exploere -> Databases -> YourDatabase ->
	Properties -> Options -> Filestream
2.2) Use T-Sql to update database (enabling, filestream files/groups)
*/

-- Preparatory Step
USE master
CREATE DATABASE FilestreamLesson;
GO

-- Examples
USE master
ALTER DATABASE FilestreamLesson SET FILESTREAM( NON_TRANSACTED_ACCESS = FULL )
GO
ALTER DATABASE FilestreamLesson
	ADD FILEGROUP MyCustomFilegroup CONTAINS FILESTREAM;
GO
ALTER DATABASE FilestreamLesson
	ADD FILE (
		NAME = customfilestreamfile,
		FILENAME = 	'R:\customfilestreamfile'
	)
	TO FILEGROUP MyCustomFilegroup;
GO

/*
You need to specify column with attributes UNIQUEIDENTIFIER and ROWGUIDCOL to use filestream data types in table 
*/

-- Examples
USE FilestreamLesson
CREATE TABLE FirstTable (
	GuidColumn UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE,
	FilestreamDataColumn VARBINARY(MAX) FILESTREAM NOT NULL
);
GO