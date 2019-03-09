/*
CROSS JOIN (n * m)
-----------
value1 value1
value1 value2
...
value1 valueM
...
valueN valueM
-----------

INNER JOIN
-----------
value value
-----------

FULL OUTER JOIN
-----------
value value
null value
value null
-----------

LEFT OUTER JOIN
-----------
value value
value null
-----------

RIGHT OUTER JOIN
-----------
value value
null value
-----------

Also you can exclude 'value value' set as example from LEFT OUTER JOIN query result using 'WHERE smth IS NULL'
*/

-- Preparatory Step
USE master
CREATE DATABASE JoinsLesson;
GO
USE JoinsLesson;
CREATE TABLE FirstTable (
	Id INT PRIMARY KEY IDENTITY(1,1),
	StringValue VARCHAR(128) NOT NULL
);
GO
CREATE TABLE SecondTable (
	Id INT PRIMARY KEY IDENTITY(1,1),
	StringValue VARCHAR(128) NOT NULL,
	FirstTableId INT NULL,
	CONSTRAINT secondtable_firsttable_foreignkey FOREIGN KEY (FirstTableId)
		REFERENCES FirstTable (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO
INSERT INTO FirstTable VALUES ('FirstTable_FirstRecord'), ('FirstTable_SecondRecord');
INSERT INTO SecondTable VALUES ('SecondTable_FirstRecord', 1), ('SecondTable_SecondRecord', NULL);
GO

-- Examples
SELECT * FROM FirstTable
	CROSS JOIN SecondTable;
SELECT ft.StringValue, st.StringValue
	FROM FirstTable as ft
	INNER JOIN SecondTable as st ON ft.Id = st.FirstTableId;
SELECT ft.StringValue, st.StringValue
	FROM FirstTable as ft
	FULL OUTER JOIN SecondTable as st ON ft.Id = st.FirstTableId;
SELECT ft.StringValue, st.StringValue
	FROM FirstTable as ft
	LEFT OUTER JOIN SecondTable as st ON ft.Id = st.FirstTableId;
SELECT ft.StringValue, st.StringValue
	FROM FirstTable as ft
	RIGHT OUTER JOIN SecondTable as st ON ft.Id = st.FirstTableId;
/*
Teta-join
*/
SELECT * FROM FirstTable as ft
	INNER JOIN SecondTable as st ON ft.Id > st.Id;
/*
Semi-join
Get columns only from the one table
*/
SELECT ft.Id, ft.StringValue FROM FirstTable as ft
	INNER JOIN SecondTable as st ON ft.Id = st.FirstTableId;