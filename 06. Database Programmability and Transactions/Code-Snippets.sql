USE SoftUni;
GO; 

/* FUNCTION */

CREATE FUNCTION ufn_GetSalaryLevel(@salary INT)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @salaryLevel VARCHAR(10)
	IF (@salary < 30000)
		SET @salaryLevel = 'Low'
	ELSE IF(@salary >= 30000 AND @salary <= 50000)
		SET @salaryLevel = 'Average'
	ELSE
		SET @salaryLevel = 'High'
	RETURN @salaryLevel
END;

SELECT FirstName, LastName, Salary, dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel 
FROM Employees

/* STORED PROCEDURE */

CREATE PROC dbo.usp_SelectEmployeesBySeniority 
AS
  SELECT * 
  FROM Employees
  WHERE DATEDIFF(Year, HireDate, GETDATE()) > 5
GO

EXEC dbo.usp_SelectEmployeesBySeniority

/* ALTER STORED PROCEDURE */

ALTER PROC usp_SelectEmployeesBySeniority
AS
  SELECT FirstName, LastName, HireDate, 
    DATEDIFF(Year, HireDate, GETDATE()) as Years
  FROM Employees
  WHERE DATEDIFF(Year, HireDate, GETDATE()) > 5
  ORDER BY HireDate
GO

/* DROP STORE PROCEDURE */

DROP PROC usp_SelectEmployeesBySeniority

/* STORED PROCEDURE WITH PARAMETERS */
CREATE PROC usp_SelectEmployeesBySeniority(@minYearsAtWork int = 5)
AS
  SELECT FirstName, LastName, HireDate,
         DATEDIFF(Year, HireDate, GETDATE()) as Years
    FROM Employees
   WHERE DATEDIFF(Year, HireDate, GETDATE()) > @minYearsAtWork
   ORDER BY HireDate
GO

EXEC usp_SelectEmployeesBySeniority 15

EXEC usp_SelectEmployeesBySeniority

/* TRIGEERS */

CREATE TRIGGER tr_TownsUpdate ON Towns FOR UPDATE
AS
  IF (EXISTS(
        SELECT * FROM inserted
        WHERE Name IS NULL OR LEN(Name) = 0))
  BEGIN
    RAISERROR('Town name cannot be empty.', 16, 1)
    ROLLBACK
    RETURN
  END

UPDATE Towns SET Name='' WHERE TownId=1



