/*
You can update existing database (add/remove/modify db file/transaction log)
Also you can set database properties
*/

-- Preparatory Step
USE master
CREATE DATABASE AlterDatabaseLesson;
GO

-- Examples
ALTER DATABASE AlterDatabaseLesson
	ADD FILE (
		NAME=logicalfilename,
		FILENAME='R:\logicalfilename.mdf',
		SIZE=10MB,
		MAXSIZE=100MB,
		FILEGROWTH=5MB
	);
GO
ALTER DATABASE AlterDatabaseLesson
	MODIFY FILE (
		NAME=logicalfilename,
		FILEGROWTH=10MB
	);
GO
ALTER DATABASE AlterDatabaseLesson
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE AlterDatabaseLesson
	SET READ_ONLY;
GO
ALTER DATABASE AlterDatabaseLesson
	SET MULTI_USER;
GO