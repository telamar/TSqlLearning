/*
You can specify own custom data type and use this in the table creation query.

CREATE TYPE [type_schema_name.] type_name
	{ [ FROM base_type [ ( precision [, scale] ) ] [ NULL | NOT NULL ] ]
	| [ EXTERNAL NAME assembly_name [ .class_name ] ]}

Also you can specify own data type as table.
*/

-- Preparatory Step
USE master
CREATE DATABASE CreateTypeLesson;
GO

-- Examples
USE CreateTypeLesson
CREATE TYPE CustomType
	FROM SMALLINT NOT NULL;
CREATE TYPE CustomTableType AS TABLE (
	Id INT NOT NULL,
	StringColumn NVARCHAR(128) NULL
);
GO