USE bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
/*
SELECT products.Name as Product, categories.Name as Category
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'Computers';
*/

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
/*
Select products.Name as Product, Price, Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID 
WHERE reviews.Rating = 5; 
*/

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
/*
Select CONCAT(LastName,", ", FirstName) as Name, SUM(Quantity) AS Total
FROM sales
INNER JOIN employees
ON employees.EmployeeID = sales.EmployeeID
GROUP BY sales.EmployeeID
HAVING Total = (SELECT SUM(Quantity) AS max FROM sales GROUP BY EmployeeID ORDER BY max DESC LIMIT 1)
ORDER BY Total DESC;
*/

/* joins: find the name of the department, and the name of the category for Appliances and Games */
/*
SELECT departments.Name as Dept, categories.Name as Category
FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = "Games";
*/
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 /*
 SELECT Name as Product, SUM(Quantity) as TotalNumber, SUM(Quantity * PricePerUnit) as TotalPrice
 FROM sales
 INNER JOIN products
 ON sales.ProductID = products.ProductID
 WHERE Name = "Eagles: Hotel California";
*/
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
/*
SELECT products.Name as Product, Reviewer, Rating, Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE productS.Name LIKE '%Visio%TV%' AND Rating = (SELECT MIN(Rating) FROM reviews WHERE ProductID = products.ProductID);
*/


-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT 
	employees.EmployeeID, 
    employees.FirstName AS FirstName, 
    employees.LastName AS LastName, 
    products.Name AS Product,
    SUM(sales.Quantity) AS Total_Units_Sold,
    SUM(sales.Quantity * sales.PricePerUnit) AS Gross_Revenue
FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, sales.ProductID
ORDER BY LastName;
