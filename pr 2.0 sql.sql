


--customers tables

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
    (CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '2023-06-15'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '2023-06-20'),
    (3, 'Robert', 'Brown', 'robert.brown@email.com', '2023-07-01'),
    (4, 'Emily', 'Davis', 'emily.davis@email.com', '2023-07-10');

+------------+-----------+----------+------------------------+------------------+
| CustomerID | FirstName | LastName | Email                  | RegistrationDate |
+------------+-----------+----------+------------------------+------------------+
|          1 | John      | Doe      | john.doe@email.com     | 2023-06-15       |
|          2 | Jane      | Smith    | jane.smith@email.com   | 2023-06-20       |
|          3 | Robert    | Brown    | robert.brown@email.com | 2023-07-01       |
|          4 | Emily     | Davis    | emily.davis@email.com  | 2023-07-10       |
+------------+-----------+----------+------------------------+------------------+
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-07-01', 150.50),
    (102, 2, '2023-07-03', 200.75),
    (103, 1, '2023-07-10', 750.00),
    (104, 3, '2023-08-05', 1200.00),
    (105, 2, '2023-08-15', 600.00);

+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |      150.50 |
|     102 |          2 | 2023-07-03 |      200.75 |
|     103 |          1 | 2023-07-10 |      750.00 |
|     104 |          3 | 2023-08-05 |     1200.00 |
|     105 |          2 | 2023-08-15 |      600.00 |
+---------+------------+------------+-------------+

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
    (EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
    (1, 'Mark', 'Johnson', 'Sales', '2020-05-15', 55000.00),
    (2, 'Susan', 'Lee', 'HR', '2021-03-20', 62000.00),
    (3, 'David', 'Wilson', 'IT', '2019-08-10', 85000.00),
    (4, 'Lisa', 'Taylor', 'Finance', '2022-01-12', 72000.00);

+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          1 | Mark      | Johnson  | Sales      | 2020-05-15 | 55000.00 |
|          2 | Susan     | Lee      | HR         | 2021-03-20 | 62000.00 |
|          3 | David     | Wilson   | IT         | 2019-08-10 | 85000.00 |
|          4 | Lisa      | Taylor   | Finance    | 2022-01-12 | 72000.00 |
+------------+-----------+----------+------------+------------+----------+




-- 1. INNER JOIN: Retrieve all orders and customer details where orders exist.
SELECT
    o.OrderID,
    o.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID;


+---------+------------+-----------+----------+------------------------+------------+-------------+
| OrderID | CustomerID | FirstName | LastName | Email                  | OrderDate  | TotalAmount |
+---------+------------+-----------+----------+------------------------+------------+-------------+
|     101 |          1 | John      | Doe      | john.doe@email.com     | 2023-07-01 |      150.50 |
|     102 |          2 | Jane      | Smith    | jane.smith@email.com   | 2023-07-03 |      200.75 |
|     103 |          1 | John      | Doe      | john.doe@email.com     | 2023-07-10 |      750.00 |
|     104 |          3 | Robert    | Brown    | robert.brown@email.com | 2023-08-05 |     1200.00 |
|     105 |          2 | Jane      | Smith    | jane.smith@email.com   | 2023-08-15 |      600.00 |
+---------+------------+-----------+----------+------------------------+------------+-------------+
-- 2. LEFT JOIN:Retrieve all customers and their corresponding orders, if any.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID;

    +------------+-----------+----------+------------------------+---------+------------+-------------+
| CustomerID | FirstName | LastName | Email                  | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+------------------------+---------+------------+-------------+
|          1 | John      | Doe      | john.doe@email.com     |     103 | 2023-07-10 |      750.00 |
|          1 | John      | Doe      | john.doe@email.com     |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    | jane.smith@email.com   |     105 | 2023-08-15 |      600.00 |
|          2 | Jane      | Smith    | jane.smith@email.com   |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Brown    | robert.brown@email.com |     104 | 2023-08-05 |     1200.00 |
|          4 | Emily     | Davis    | emily.davis@email.com  |    NULL | NULL       |        NULL |
+------------+-----------+----------+------------------------+---------+------------+-------------+

-- 3. RIGHT JOIN:Retrieve all orders and their corresponding customers, if any.
SELECT
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.TotalAmount,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customers AS c
RIGHT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID;

+---------+------------+------------+-------------+-----------+----------+------------------------+
| OrderID | CustomerID | OrderDate  | TotalAmount | FirstName | LastName | Email                  |
+---------+------------+------------+-------------+-----------+----------+------------------------+
|     101 |          1 | 2023-07-01 |      150.50 | John      | Doe      | john.doe@email.com     |
|     102 |          2 | 2023-07-03 |      200.75 | Jane      | Smith    | jane.smith@email.com   |
|     103 |          1 | 2023-07-10 |      750.00 | John      | Doe      | john.doe@email.com     |
|     104 |          3 | 2023-08-05 |     1200.00 | Robert    | Brown    | robert.brown@email.com |
|     105 |          2 | 2023-08-15 |      600.00 | Jane      | Smith    | jane.smith@email.com   |


-- 4. FULL OUTER JOIN:retrive all customers and orders, regardless of whether they have matching records in the other table.

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
RIGHT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL;

+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     103 | 2023-07-10 |      750.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     105 | 2023-08-15 |      600.00 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Brown    |     104 | 2023-08-05 |     1200.00 |
|          4 | Emily     | Davis    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+

-- 5. Subquery: subquery to find customers who have placed orders worth more than the average order amount.

SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);

+------------+-----------+----------+------------------------+
| CustomerID | FirstName | LastName | Email                  |
+------------+-----------+----------+------------------------+
|          1 | John      | Doe      | john.doe@email.com     |
|          3 | Robert    | Brown    | robert.brown@email.com |
|          2 | Jane      | Smith    | jane.smith@email.com   |
+------------+-----------+----------+------------------------+

-- 6. Subquery: Find employees with salaries above the average salary.
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);


+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          3 | David     | Wilson   | IT         | 85000.00 |
|          4 | Lisa      | Taylor   | Finance    | 72000.00 |
+------------+-----------+----------+------------+----------+
-- 7. Extract year and month from OrderDate.
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-07-10 |      2023 |          7 |
|     104 | 2023-08-05 |      2023 |          8 |
|     105 | 2023-08-15 |      2023 |          8 |
+---------+------------+-----------+------------+

-- 8. Calculate difference in days between OrderDate and current date.
SELECT
    OrderID,
    OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

+---------+------------+----------------+
| OrderID | OrderDate  | DaysDifference |
+---------+------------+----------------+
|     101 | 2023-07-01 |           1193 |
|     102 | 2023-07-03 |           1191 |
|     103 | 2023-07-10 |           1184 |
|     104 | 2023-08-05 |           1158 |
|     105 | 2023-08-15 |           1148 |
+---------+------------+----------------+

-- 9. Format OrderDate to a more readable format 
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;

+---------+------------+--------------------+
| OrderID | OrderDate  | FormattedOrderDate |
+---------+------------+--------------------+
|     101 | 2023-07-01 | 01-Jul-2023        |
|     102 | 2023-07-03 | 03-Jul-2023        |
|     103 | 2023-07-10 | 10-Jul-2023        |
|     104 | 2023-08-05 | 05-Aug-2023        |
|     105 | 2023-08-15 | 15-Aug-2023        |
+---------+------------+--------------------+

-- 10. Concatenate FirstName and LastName to form full name.
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

+------------+--------------+
| CustomerID | FullName     |
+------------+--------------+
|          1 | John Doe     |
|          2 | Jane Smith   |
|          3 | Robert Brown |
|          4 | Emily Davis  |
+------------+--------------+

-- 11. Replace part of a string.

SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS ModifiedFirstName
FROM Customers;

+------------+-----------+-------------------+
| CustomerID | FirstName | ModifiedFirstName |
+------------+-----------+-------------------+
|          1 | John      | Jonathan          |
|          2 | Jane      | Jane              |
|          3 | Robert    | Robert            |
|          4 | Emily     | Emily             |
+------------+-----------+-------------------+

-- 12. Convert FirstName to uppercase and LastName to lowercase.
SELECT
    EmployeeID,
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM Employees;

+------------+----------------+---------------+
| EmployeeID | FirstNameUpper | LastNameLower |
+------------+----------------+---------------+
|          1 | MARK           | johnson       |
|          2 | SUSAN          | lee           |
|          3 | DAVID          | wilson        |
|          4 | LISA           | taylor        |
+------------+----------------+---------------+

-- 13. Trim extra spaces from Email.
SELECT
    CustomerID,
    Email,
    TRIM(Email) AS TrimmedEmail
FROM Customers;
+------------+------------------------+------------------------+
| CustomerID | Email                  | TrimmedEmail           |
+------------+------------------------+------------------------+
|          1 | john.doe@email.com     | john.doe@email.com     |
|          2 | jane.smith@email.com   | jane.smith@email.com   |
|          3 | robert.brown@email.com | robert.brown@email.com |
|          4 | emily.davis@email.com  | emily.davis@email.com  |
+------------+------------------------+------------------------+

-- 14. Calculate running total of TotalAmount for each order.
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Orders;

+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
|     103 | 2023-07-10 |      750.00 |      1101.25 |
|     104 | 2023-08-05 |     1200.00 |      2301.25 |
|     105 | 2023-08-15 |      600.00 |      2901.25 |
+---------+------------+-------------+--------------+

-- 15. Rank orders based on TotalAmount using RANK().
SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS AmountRank
FROM Orders;
+---------+------------+-------------+------------+
| OrderID | CustomerID | TotalAmount | AmountRank |
+---------+------------+-------------+------------+
|     104 |          3 |     1200.00 |          1 |
|     103 |          1 |      750.00 |          2 |
|     105 |          2 |      600.00 |          3 |
|     102 |          2 |      200.75 |          4 |
|     101 |          1 |      150.50 |          5 |
+---------+------------+-------------+------------+

-- 16. Assign discount based on TotalAmount.

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% OFF'
        WHEN TotalAmount > 500 THEN '5% OFF'
        ELSE '0% OFF'
    END AS Discount
FROM Orders;

+---------+-------------+----------+
| OrderID | TotalAmount | Discount |
+---------+-------------+----------+
|     101 |      150.50 | 0% OFF   |
|     102 |      200.75 | 0% OFF   |
|     103 |      750.00 | 5% OFF   |
|     104 |     1200.00 | 10% OFF  |
|     105 |      600.00 | 5% OFF   |

-- 17. Categorize employee salaries.
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 75000 THEN 'High'
        WHEN Salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

+------------+-----------+----------+----------+----------------+
| EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
+------------+-----------+----------+----------+----------------+
|          1 | Mark      | Johnson  | 55000.00 | Low            |
|          2 | Susan     | Lee      | 62000.00 | Medium         |
|          3 | David     | Wilson   | 85000.00 | High           |
|          4 | Lisa      | Taylor   | 72000.00 | Medium         |
+------------+-----------+----------+----------+----------------+

