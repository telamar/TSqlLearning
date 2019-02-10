-- Preparatory Step
USE master
CREATE DATABASE ConstraintsLesson;
GO

/*
UNIQUE
Indicates that each value of the column is unique.

[CONSTRAINT c_name]
	UNIQUE [CLUSTERED | NONCLUSTERED] ({ col_name1} ,...)
*/

--Examples
USE ConstraintsLesson
CREATE TABLE FirstUniqueTable (
	StringColumn NVARCHAR(128) NOT NULL
	CONSTRAINT string_column_unique UNIQUE NONCLUSTERED (StringColumn)
);
CREATE TABLE SecondUniqueTable (
	StringColumn NVARCHAR(128) NOT NULL UNIQUE NONCLUSTERED
);
GO

/*
Primary Key
Indicates that column value is unique and will be used as primary key by the database engine.
Can be used with IDENTITY(,) (autoincrement) constraint.

[CONSTRAINT c_name]
	PRIMARY KEY [CLUSTERED | NONCLUSTERED] ({col_name1} ,...)
*/

--Examples
USE ConstraintsLesson
CREATE TABLE FirstPrimaryKeyTable (
	IdColumn INT NOT NULL
	CONSTRAINT firsttable_idcolumn_primarykey PRIMARY KEY CLUSTERED (IdColumn)
);
CREATE TABLE SecondPrimaryKeyTable (
	IdColumn INT NOT NULL PRIMARY KEY CLUSTERED
);
CREATE TABLE ThirdPrimaryKeyTable (
	IdColumn INT NOT NULL CONSTRAINT thirdtable_idcolumn_primarykey PRIMARY KEY CLUSTERED
);
GO

/*
CHECK
Inserted or updated value can be checked for expression.

[CONSTRAINT c_name]
	CHECK [NOT FOR REPLICATION] expression

Expression should return true or false.
Expression has access to all columns (declared as table check constraint)
or only to one column (declared as column check constraint)
*/

-- Examples
USE ConstraintsLesson
CREATE TABLE FirstCheckTable (
	UserRole NVARCHAR(16) NOT NULL,
	-- CHECK condition only for the ProjectUserRole column
	ProjectUserRole NVARCHAR(16) NOT NULL CHECK (ProjectUserRole in ('Owner', 'Participant')),
	-- table CHECK condition with access to all columns
	CHECK (UserRole in ( 'DefaultUser', 'PremiumUser', 'Admin' ) AND ProjectUserRole IS NOT NULL) 
);
GO

/*
FOREIGN KEY
Allows to build dependencies between tables

[CONSTRAINT c_name]
	[[FOREIGN KEY] ({col_name1} ,...)]
		REFERENCES table_name ({col_name2},...)
			[ON DELETE {NO ACTION | CASCADE | SET NULL | SET DEFAULT}]
			[ON UPDATE {NO ACTION | CASCADE | SET NULL | SET DEFAULT}]

The list of options for ON DELETE/UPDATE rules:
- NOACTION (only not referenced tuples can be deleted or updated);
- CASCADE (update of parent tuple will update also and child tuple);
- SET NULL (deletion of parent tuple is possible when child tuple can be assigned with NULL);
- SET DEFAULT (deletion of parent tuple is possible when child tuple has DEFAULT value constraint).
*/

-- Examples
USE ConstraintsLesson
CREATE TABLE FirstForeignKeyTable (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1)
);
CREATE TABLE SecondForeignKeyTable (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	FirstTableId INT NOT NULL,
	CONSTRAINT secondTable_foreignkey_firsttable FOREIGN KEY (FirstTableId)
		REFERENCES FirstForeignKeyTable (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO