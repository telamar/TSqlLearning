/*
CREATE DATABASE db_name
    [ON [PRIMARY] { file_spec1} ,...]
    [LOG ON {file_spec2} ,...]
    [COLLATE collation_name]
    [FOR {ATTACH | ATTACH_REBUILD_LOG } ]

db_name = name of the database =)
ON = information about file(s) that will contain the database
LOG ON = information about file(s) that will contain a transaction log
COLLATE = collation name (needs to specify an order of sorting)
FOR ATTACH = specify path/name of the (database/transaction log) file that will be attached to this database
*/

-- Examples
USE master;
CREATE DATABASE MyFirstDatabate;

USE master;
CREATE DATABASE MySecondDatabase
	ON (NAME=database_data,
		FILENAME = 'R:\MySecondDatabase.mdf',
		SIZE = 10MB,
		MAXSIZE = 100MB,
		FILEGROWTH = 5MB)
	LOG ON
		(NAME=database_log,
		FILENAME = 'R:\MySecondDatabase.ldf',
		SIZE = 40MB,
		MAXSIZE = 100MB,
		FILEGROWTH = 10MB);

/*
Also we can create a snapshot of the existing database with updated only data.
This snapshot is readonly.

CREATE DATABASE database_snapshot_name
	ON (NAME = logical_file_name,
		FILENAME = 'os_file_name') [ ,...n ]
	AS SNAPSHOT OF source_database_name
*/

-- Examples
USE master;
CREATE DATABASE MySecondDatabaseSnapshot
	ON (NAME = 'database_data' ,
		FILENAME = 'R:\MySecondDatabaseSnapshot.mdf')
    AS SNAPSHOT OF MySecondDatabase;