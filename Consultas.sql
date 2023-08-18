-- Consulta #1
--. Seleccione todos los datos de la tabla Departament del schema HumanResources.

SELECT * FROM HumanResources.Department

-- Consulta #2--Seleccione un agrupamiento de los nombres de grupos que existen en la tabla Departament del schema HumanResources.
SELECT COUNT(DepartmentID), GroupName 
FROM HumanResources.Department 
GROUP BY GroupName

-- Consulta #3
--Seleccione todos los departamentos ordenándolos en orden descendente.

SELECT Name 
FROM HumanResources.Department 
ORDER BY Name DESC

-- Consulta #4
--Seleccione todos los departamentos ordenándolos en orden ascendente.

SELECT Name 
FROM HumanResources.Department 
ORDER BY Name ASC

-- Consulta #5
--Seleccione todos los empleados de la tabla Employee del schema Human Resources.
SELECT * FROM HumanResources.Employee 

-- Consulta #6
--Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el género sea masculino.

SELECT * FROM HumanResources.Employee 
WHERE Gender LIKE 'M'

-- Consulta #7
--. Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización sea mayor a 3
SELECT * FROM HumanResources.Employee 
WHERE OrganizationLevel > 3

-- Consulta #8
--Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización sea mayor e igual a 2 y que el género sea femenino
SELECT * FROM HumanResources.Employee 
WHERE OrganizationLevel >= 2 AND Gender Like 'F'

--Consulta #9
--Selección los campos BusinessEntityID,NationalIDNumber de la tabla Employee del schema Human Resources donde los jobtitle sean Marketing Assistant o Design Engineer

SELECT BusinessEntityID, NationalIDNumber 
FROM HumanResources.Employee 
WHERE JobTitle LIKE 'Marketing Assistant' OR JobTitle LIKE ' Design Engineer'

--Consulta #10
--Seleccionar todos los empleados de la tabla Employee del schema Human Resources que estén entre la fecha de nacimiento de 1 de enero de 1969 y 31 de diciembre de 1972.

SELECT * FROM HumanResources.Employee
WHERE BirthDate BETWEEN '1969-01-01' AND '1972-12-31'
ORDER BY BirthDate ASC

--Consulta #11
--. De la tabla Employee del schema Human Resources Calcule el total de ah pagar por horas de vacacion si se conece que cada hora cuesta $8.00.

SELECT NationalIDNumber, VacationHours, (VacationHours*8) AS VacationHoursTotal 
FROM HumanResources.Employee

--Consulta #12
--De la tabla Production.ProductSubcategory muestre cuantas subcategorías hay registradas por categoría.

SELECT ProductCategoryID, COUNT(ProductSubcategoryID) AS TOTAL 
FROM Production.ProductSubcategory
GROUP BY ProductCategoryID

--Consulta #13
--De la tabla Sales.Customer mostrar cuantos clientes existen registrados por territorios.

SELECT TerritoryID, COUNT(CustomerID) AS TOTAL 
FROM Sales.Customer
GROUP BY TerritoryID

--Consulta #14
--De la tabla sales.SalesOrderHeader mostrar la suma total del Sub Total de compra según el IdCustomer que se coloque.

SELECT SUM(SubTotal) AS TOTAL FROM Sales.SalesOrderHeader
WHERE CustomerID = 29824

--Consulta #15
--. De la tabla Sales. CreditCard mostrar cuantas tarjetas según su tipo están registradas en el sistema.

SELECT CardType, COUNT(CreditCardID) AS TOTAL FROM Sales.CreditCard
GROUP BY CardType

--Consulta #16
-- De la tabla Sales.SalesOrderDetail evaluar Linea total de compra que es el total de la
--compra , si la compra es mayor de $1000.00 realizar un descuento del 10% y mostrar el
--nuevo total a pagar si es mayor $1500.00 realizar un descuento del 14% y mostrar el
--nuevo total a pagar si es mayor de $2000.00 realizar un descuento del 18% y mostrar el
--nuevo total a pagar.

SELECT * FROM Sales.SalesOrderDetail 

SELECT SalesOrderID, SUM(LineTotal) as Total, (SUM(LineTotal) - (SUM(LineTotal) * 0.10)) as NewTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 1000

SELECT SalesOrderID, SUM(LineTotal) as Total, (SUM(LineTotal) - (SUM(LineTotal) * 0.14)) as NewTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 1500

SELECT SalesOrderID, SUM(LineTotal) as Total, (SUM(LineTotal) - (SUM(LineTotal) * 0.18)) as NewTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 2000
