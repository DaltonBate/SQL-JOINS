/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name AS ProductName, C.Name as CategoryName
 FROM products AS P
 INNER JOIN categories AS C 
 ON C.CategoryID = P.CategoryID
 WHERE C.Name = "Computers";
 
 Select products.Name, categories.Name
 From products
 Inner Join categories on categories.CategoryID = products.CategoryID
 WHERE Categories.Name = "Computers";
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.Price, r.Rating from products as p
inner join reviews as r on r.ProductID = p.ProductID
Where r.Rating = 5;
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by 
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total
From sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

select * from sales
where EmployeeID = 33809;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.NAME as 'Department Name', C.Name as 'Category Name' FROM departments as d
INNER join categories as c ON c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
From products as p
INNER JOIN sales as s on s.ProductID = p.ProductID
Where p.ProductID = 97;
-- To verify
select * from sales where productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select P.Name, r.Reviewer, r.Rating, r.Comment 
FROM products as p
INNER JOIN reviews as r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, E.FirstName, e.LastName, p.Name, SUM(S.Quantity) as TotalSold
From Sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
ORDER BY e.FirstName;






