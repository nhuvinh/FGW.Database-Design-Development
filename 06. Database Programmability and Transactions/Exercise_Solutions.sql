CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE Salary > 35000

EXEC usp_GetEmployeesSalaryAbove35000

CREATE PROC usp_GetEmployeesSalaryAboveNumber (@number DECIMAL(18,4))
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE Salary > @number

EXEC usp_GetEmployeesSalaryAboveNumber 48100

CREATE PROC usp_GetTownsStartingWith (@search VARCHAR(50))
AS
	SELECT Name 
	FROM Towns
	WHERE Name LIKE @search + '%'

DROP PROC usp_GetTownsStartingWith

EXEC usp_GetTownsStartingWith 'b'

CREATE PROC usp_GetEmployeesFromTown (@town VARCHAR(50))
AS
	SELECT e.FirstName, e.LastName
	FROM Employees AS e, Addresses AS a, Towns AS t
	WHERE t.Name = @town
		AND t.TownID = a.TownID
		AND a.AddressID = e.AddressID

EXEC usp_GetEmployeesFromTown 'Sofia'

CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
RETURNS NVARCHAR(50)
AS 
BEGIN
	DECLARE @salaryLevel VARCHAR(50);
	IF (@salary < 30000)
	BEGIN
		SET @salaryLevel = 'Low'
	END
	IF (@salary < 50000)
	BEGIN
		SET @salaryLevel = 'Average'
	END
	IF (@salary > 50000)
	BEGIN
		SET @salaryLevel = 'High'
	END
	RETURN @salaryLevel;
END

SELECT FirstName, LastName, Salary, dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel
	FROM Employees
