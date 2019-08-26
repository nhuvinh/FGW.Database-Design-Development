# Week 02

## Summary
- INSERT INTO
- SELECT
- WHERE
- AND, OR and NOT Operators
- NULL Values
- UPDATE
- DELETE
- ORDER BY
- MIN, MAX
- COUNT, AVG, SUM
- IN
- BETWEEN
- GROUP BY
- HAVING
- EXISTS

### INSERT

#### Syntax

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

#### Example

Demo database:

| CustomerID | CustomerName         | ContactName     | Address                     | City     | PostalCode | Country |
|:-----------|:---------------------|:----------------|:----------------------------|:---------|:-----------|:--------|
| 89         | White Clover Markets | Karl Jablonski  | 305 - 14th Ave. S. Suite 3B | Seattle  | 98128      | USA     |
| 90         | Wilman Kala          | Matti Karttunen | Keskuskatu 45               | Helsinki | 21240      | Finland |
| 91         | Wolski               | Zbyszek         | ul. Filtrowa 68             | Walla    | 01-012     | Poland  |

The following SQL statement inserts a new record in the "Customers" table:

```sql
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
```

| CustomerID | CustomerName         | ContactName     | Address                     | City      | PostalCode | Country |
|:-----------|:---------------------|:----------------|:----------------------------|:----------|:-----------|:--------|
| 89         | White Clover Markets | Karl Jablonski  | 305 - 14th Ave. S. Suite 3B | Seattle   | 98128      | USA     |
| 90         | Wilman Kala          | Matti Karttunen | Keskuskatu 45               | Helsinki  | 21240      | Finland |
| 91         | Wolski               | Zbyszek         | ul. Filtrowa 68             | Walla     | 01-012     | Poland  |
| 92         | Cardinal             | Tom B. Erichsen | Skagen 21                   | Stavanger | 4006       | Norway  |

### SELECT

#### Syntax

```sql
SELECT column1, column2, ...
FROM table_name;
```

Select everything from a table: 

```sql
SELECT * FROM table_name;
```

#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

The following SQL statement selects the "CustomerName" and "City" columns from the "Customers" table:

```sql
SELECT CustomerName, City FROM Customers;
```

### WHERE

#### Syntax

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |


```sql
SELECT * FROM Customers
WHERE Country = 'Mexico';
```

```sql
SELECT * FROM Customers
WHERE CustomerID = 1;
```

### AND, OR and NOT Operators

#### Syntax

AND 

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
```

OR

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
```

NOT

```sql
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
```

#### Example

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

```sql
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';
```

```sql
SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'München
```

```sql
SELECT * FROM Customers
WHERE NOT Country = 'Germany';
```

```sql
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City='Berlin' OR City = 'München');
```

```sql
SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';
```

### NULL Values

It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

We will have to use the IS NULL and IS NOT NULL operators instead

IS NULL Syntax

```sql
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```

IS NOT NULL Syntax

```sql
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
```

#### Example

Demo Database:

| ID | LastName | FirstName | Address            | City     |
|:---|:---------|:----------|:-------------------|:---------|
| 1  | Doe      | John      | 542 W. 27th Street | New York |
| 2  | Bloggs   | Joe       |                    | London   |
| 3  | Roe      | Jane      |                    | New York |
| 4  | Smith    | John      | 110 Bishopsgate    | London   |

```sql
SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NULL;
```

The result set will look like this: 

| LastName | FirstName | Address |
|:---------|:----------|:--------|
| Bloggs   | Joe       |         |
| Roe      | Jane      |         |

```sql
SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NOT NULL;
```

The result set will look like this:

| LastName | FirstName | Address            |
|:---------|:----------|:-------------------|
| Doe      | John      | 542 W. 27th Street |
| Smith    | John      | 110 Bishopsgate    |

### UPDATE

#### Syntax

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

```sql
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
```
| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfred Schmidt                     | Maria Anders       | Obere Str. 57                | Frankfurt   | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

### DELETE

#### Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

#### Example

Demo database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

```sql
DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste';
```

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

### ORDER BY

The ORDER BY keyword is used to sort the result-set in ascending or descending order.

#### Syntax

```
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```
#### Example

Demo database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

```sql
SELECT * FROM Customers
ORDER BY Country;
```

```sql
SELECT * FROM Customers
ORDER BY Country DESC;
```

### MIN, MAX

The MIN() function returns the smallest value of the selected column.

The MAX() function returns the largest value of the selected column.

#### Syntax

```sql
SELECT MIN(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT MAX(column_name)
FROM table_name
WHERE condition;
```

#### Example

Demo Database:

| ProductID | ProductName                  | SupplierID | CategoryID | Unit                       | Price |
|:----------|:-----------------------------|:-----------|:-----------|:---------------------------|:------|
| 1         | Chais                        | 1          | 1          | 10         boxes x 20 bags | 18    |
| 2         | Chang                        | 1          | 1          | 24 - 12 oz bottles         | 19    |
| 3         | Aniseed Syrup                | 1          | 2          | 12 - 550 ml bottles        | 10    |
| 4         | Chef Anton's Cajun Seasoning | 1          | 2          | 48 - 6 oz       jars       | 22    |
| 5         | Chef Anton's Gumbo Mix       | 1          | 2          | 36 boxes                   | 21.35 |

```sql
SELECT MIN(Price) AS SmallestPrice
FROM Products;
```

```sql
SELECT MAX(Price) AS LargestPrice
FROM Product
```

### COUNT, AVG, SUM

The COUNT() function returns the number of rows that matches a specified criteria.

The AVG() function returns the average value of a numeric column.

The SUM() function returns the total sum of a numeric column.

#### Syntax

```sql
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT AVG(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT SUM(column_name)
FROM table_name
WHERE condition;
```

#### Example

Demo Database:

| ProductID | ProductName                  | SupplierID | CategoryID | Unit                       | Price |
|:----------|:-----------------------------|:-----------|:-----------|:---------------------------|:------|
| 1         | Chais                        | 1          | 1          | 10         boxes x 20 bags | 18    |
| 2         | Chang                        | 1          | 1          | 24 - 12 oz bottles         | 19    |
| 3         | Aniseed Syrup                | 1          | 2          | 12 - 550 ml bottles        | 10    |
| 4         | Chef Anton's Cajun Seasoning | 1          | 2          | 48 - 6 oz       jars       | 22    |
| 5         | Chef Anton's Gumbo Mix       | 1          | 2          | 36 boxes                   | 21.35 |

```sql
SELECT COUNT(ProductID)
FROM Products;
```

```sql
SELECT AVG(Price)
FROM Products;
```

```sql
SELECT SUM(Price)
FROM Products;
```

### IN

#### Syntax
The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
```
#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

```sql
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
```

```sql
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');
```
### BETWEEN

The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

The BETWEEN operator is inclusive: begin and end values are included. 

#### Syntax

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

#### Example

Demo Database:

| ProductID | ProductName                  | SupplierID | CategoryID | Unit                       | Price |
|:----------|:-----------------------------|:-----------|:-----------|:---------------------------|:------|
| 1         | Chais                        | 1          | 1          | 10         boxes x 20 bags | 18    |
| 2         | Chang                        | 1          | 1          | 24 - 12 oz bottles         | 19    |
| 3         | Aniseed Syrup                | 1          | 2          | 12 - 550 ml bottles        | 10    |
| 4         | Chef Anton's Cajun Seasoning | 1          | 2          | 48 - 6 oz       jars       | 22    |
| 5         | Chef Anton's Gumbo Mix       | 1          | 2          | 36 boxes                   | 21.35 |

```sql
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
```

```sql
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;
```

```sql
SELECT * FROM Products
WHERE (Price BETWEEN 10 AND 20)
AND NOT CategoryID IN (1,2,3);
```

### GROUP BY

The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columns.

#### Syntax

```sql
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
```

#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

The following SQL statement lists the number of customers in each country:

```sql
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;
```

The following SQL statement lists the number of customers in each country, sorted high to low:

```sql
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
```

### HAVING

The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.

#### Syntax

```sql
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
```

#### Example

Demo Database: 

| CustomerID | CustomerName                       | ContactName        | Address                      | City        | PostalCode | Country |
|:-----------|:-----------------------------------|:-------------------|:-----------------------------|:------------|:-----------|:--------|
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitució 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312               | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.              | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8               | Luleå       | S-958 22   | Sweden  |

The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:

```sql
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
```

The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):

```sql
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
```