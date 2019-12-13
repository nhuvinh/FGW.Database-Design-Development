# Week 01

## Summary

- SQL Server 2017 Installation
- T-SQL Data Types
- T-SQL Create Database
- T-SQL Drop Database
- T-SQL Create Tables
- T-SQL Drop Tables
- T-SQL Alter Tables
- NOT NULL Constraint
- PRIMARY KEY
- UNIQUE
- AUTO INCREMENT

## SQL Server 2017 Installation

The first place to start is on the [SQL Server download page](https://www.microsoft.com/en-us/sql-server/sql-server-downloads). The following is an explanation of the options on that page.

<img src="./image/sql-server-installation.PNG" width="600px"/>

Once you've downloaded the installation file, you can install SQL Server by double-clicking the file. Here are [detailed instructions](https://www.quackit.com/sql_server/sql_server_2017/tutorial/sql_server_2017_installation_windows.cfm) explaining how to install SQL Server on Windows (it also includes how to install SSMS — a management tool for SQL Server).

## T-SQL Data Types

### Exact Numeric Types

|**Type**|	**From** |	**To**|
|------|-------------|--------|
|bigint|	-9,223,372,036,854,775,808|	9,223,372,036,854,775,807|
|int	|-2,147,483,648	|2,147,483,647|
|smallint| -32,768|	32,767|
|tinyint|	0|	255|
|bit|	0|	1|
|decimal|	-10^38 +1|	10^38 –1|
|numeric	|-10^38 +1|	10^38 –1|
|money|	-922,337,203,685,477.5808|	+922,337,203,685,477.5807|
|smallmoney	|-214,748.3648	|+214,748.3647|

### Approximate Numeric Types

|**Type**|	**From**|**To**|
|--------|----------|------|
|Float|	-1.79E + 308|	1.79E + 308|
|Real|	-3.40E + 38|	3.40E + 38|

### Character Strings

1. **char**: Fixed-length non-Unicode character data with a maximum length of 8,000 characters.
2. **varchar**:Variable-length non-Unicode data with a maximum of 8,000 characters.
3. **Varchar(max)**:Variable-length non-Unicode data with a maximum length of 231 characters (Introduced in SQL Server 2005).
4. **text**:Variable-length non-Unicode data with a maximum length of 2,147,483,647 characters

### Binary Strings

1. **binary**: Fixed-length binary data with a maximum length of 8,000 bytes.
2. **varbinary**: Variable-length binary data with a maximum length of 8,000 bytes.
3. **varbinary(max)**: Variable-length binary data with a maximum length of 231 bytes (Introduced in SQL Server 2005).
4. **image**: Variable-length binary data with a maximum length of 2,147,483,647 bytes.

## T-SQL Create Database
***
### Syntax 
```sql
CREATE DATABASE databasename;
```

### Example
```sql
CREATE DATABASE testDB;
```

## T-SQL Drop Database
***
### Syntax:
```sql
DROP DATABASE databasename;
```

### Example
```
DROP DATABASE testDB;
```

## T-SQL Create Table

### Syntax
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
```
### Example
```sql
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);
```

The empty "Persons" table will now look like this:

|**PersonID**|	**LastName**|	**FirstName**|	**Address**|	**City**|
|------------|--------------|----------------|-------------|-----------|
| | | | | |

## T-SQL Drop Tables
***
Syntax
```sql
DROP TABLE table_name;
```

Example
```sql
DROP TABLE Persons
```

## T-SQL Alter Tables

### Syntax
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

To add a column in a table, use the following syntax:
```sql
ALTER TABLE table_name
ADD column_name datatype;
```

To delete a column in a table, use the following syntax (notice that some database systems don't allow deleting a column):
```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

To change the data type of a column in a table, use the following syntax:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name datatype;
```
### Example
Look at the "Persons" table:

| ID | LastName | FirstName | Address | City |
|----|----------|-----------|---------|------|
| 1 | Hansen	| Ola	| Timoteivn | 10	| Sandnes|
| 2 | Svendson	| Tove| Borgvn| 23| Sandnes|
| 3	| Pettersen	| Kari| Storgt | 20| Stavanger|

We use the following SQL statement:
```sql
ALTER TABLE Persons
ADD DateOfBirth date;
```
The "Persons" table will now look like this:

| ID | LastName | FirstName | Address | City | DateOfBirth |
|----|----------|-----------|---------|------|-------------|
|1	|Hansen	|Ola	|Timoteivn |10	||
|2	|Svendson	|Tove|	Borgvn| 23|	|
|3	|Pettersen	|Kari|	Storgt |20| |

Next, we want to delete the column named "DateOfBirth" in the "Persons" table.

We use the following SQL statement:
```sql
ALTER TABLE Persons
DROP COLUMN DateOfBirth;
```	 	 	 	 
The "Persons" table will now look like this:

| ID | LastName | FirstName | Address | City |
|----|----------|-----------|---------|------|
| 1 | Hansen	| Ola	| Timoteivn | 10	| Sandnes|
| 2 | Svendson	| Tove| Borgvn| 23| Sandnes|
| 3	| Pettersen	| Kari| Storgt | 20| Stavanger|

### NOT NULL 

By default, a column can hold NULL values.

The NOT NULL constraint enforces a column to NOT accept NULL values.

The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values:

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
```

### PRIMARY KEY

The PRIMARY KEY constraint uniquely identifies each record in a database table.

A table can have only one primary key, which may consist of single or multiple fields.

The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

```sql
CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
```

## UNIQUE

The UNIQUE constraint ensures that all values in a column are different.

Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.

A PRIMARY KEY constraint automatically has a UNIQUE constraint.

However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:
```sql
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
```

To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);
```

### AUTO INCREMENT

Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

```sql
CREATE TABLE Persons (
    ID int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
```




