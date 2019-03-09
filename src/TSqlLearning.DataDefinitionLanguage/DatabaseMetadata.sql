/*
The system catalog is a tables set that describes databases.
The information_schema is a analog of the system catalog that is required by ANSI/ISO standart.
*/

-- Examples
USE master
SELECT * FROM sys.tables;
SELECT * FROM INFORMATION_SCHEMA.TABLES;

/*
Dynamic Management Views, DMV
AND
Dynamic Management Functions, DMF

These are API to get information about processes, memory usage, users and others.
This API allows us to setup and optimize database dynamic settings.

sys.dm_db_* - to get data about databases and their objects;
sys.dm_tran_* - to get data about transactions;
sys.dm_io_* - to get data about input/output (IO);
sys.dm_exec_* - to get data about the user code execution.
*/

-- Examples
USE master
SELECT * FROM sys.dm_db_file_space_usage;
SELECT * FROM sys.dm_db_log_info(null);
SELECT * FROM sys.dm_exec_connections;

/*
System functions

Examples of System Functions:

- OBJECT_ID (object_name)
- OBJECT_NAME (object_id)
- USER_ID ([user_name])
- USER_NAME ([user_id])
- DB_ID ([ db_name])
- DB_NAME ([db_id])

Examples of System Property Functions
- OBJECTPROPERTY (id, property)
- COLUMNPROPERTY (id, column, property)
- FILEPROPERTY (filename, property)
- TYPEPROPERTY (type, property)
*/

-- Examples
USE master
SELECT OBJECTPROPERTY(86, 'IsConstraint') as IsConstraint;
SELECT OBJECTPROPERTY(86, 'IsTable') as IsTable;