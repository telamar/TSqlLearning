-- Preparatory Step
USE master
CREATE DATABASE SelectLesson;
GO
USE SelectLesson;
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

/*
SELECT

SELECT [ ALL | DISTINCT] column_list
    FROM {table1 [tab_alias1] } ,...
*/

-- Examples
USE SelectLesson;
SELECT * FROM FirstTable;
SELECT "Name", "Value" FROM FirstTable;
-- get unique values
SELECT DISTINCT "Name" FROM FirstTable;

/*
SELECT

SELECT select_list
    [INTO new_table_]
    FROM table
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC | DESC] ];
*/

/*
WHERE

!=, <, >, >=, <=, !>, !< 
OR, AND, NOT
IN (...), BETWEEN ... AND ...
IS [NOT] NULL
[NOT] LIKE 'pattern' (with '_' = any 1 symbol and '%' = any symbols, '[,]' = array of concrete symbol, '^' = not)
*/

-- Examples
SELECT * FROM FirstTable
	WHERE "Name" LIKE '[A-Z]%' AND "Value" IN (8, 11, 5, 12);
SELECT * FROM FirstTable
	WHERE "Value" BETWEEN 10 AND 12;

-- GROUP BY
-- Examples
SELECT "Value" FROM FirstTable GROUP BY "Value";
SELECT "Value", "Name" FROM FirstTable GROUP BY "Value", "Name";

-- Having (analog of WHERE but for groups)
-- Examples
SELECT "Value", "Name" FROM FirstTable
	GROUP BY "Value", "Name"
		HAVING "Value" IN (1, 5, 11, 12);

/*
ORDER BY

ORDER BY {[col_name | col_number [ASC | DESC]]} , ...
*/

-- Examples
SELECT * FROM FirstTable ORDER BY "Value" DESC;
SELECT * FROM FirstTable ORDER BY "Value", "Name" ASC;

/*
OFFSET and FETCH NEXT

OFFSET - skip N records
FETCH NEXT - return M records

ORDER BY is required for these commands
*/

-- Examples
SELECT * FROM FirstTable
	ORDER BY "Value" DESC
		OFFSET 3 ROWS -- skip 3 records
		FETCH NEXT 2 ROWS ONLY; -- return only 2 records

/*
UNION, INTERSECT, EXCEPT

select_1 UNION [ALL] select_2 {[UNION [ALL] select_3]}...
select_1 INTERSECT select_2 {[INTERSECT select_3]}...
select_1 EXCEPT select_2 {[EXCEPT select_3]}...
*/

-- Preparatory Step
SELECT * INTO SecondTable
	FROM FirstTable;

-- Examples
SELECT * FROM FirstTable
	UNION ALL SELECT * FROM SecondTable;
SELECT "Value", "Name" FROM FirstTable
	INTERSECT SELECT "Value", "Name" FROM SecondTable;
SELECT Id FROM FirstTable
	EXCEPT SELECT Id FROM SecondTable;