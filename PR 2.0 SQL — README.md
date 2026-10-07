# 🚀 PR 2.0 — SQL DATABASE PROJECT

<p align="center">

# 🗄️ SQL Database Management & Advanced Query Project

### 💡 Customers • Orders • Employees • Joins • Subqueries • Functions • Window Functions

**A Practical SQL Learning & Database Analysis Project**

</p>

---

## 👨‍💻 Project Information

| 📌 Detail | 📝 Information |
|---|---|
| **Project Name** | PR 2.0 SQL Database Project |
| **SQL File** | `pr 2.0 sql.sql` |
| **Author** | **Krish** |
| **Guided By** | **Girish Sir** |
| **Technology** | SQL / MySQL |
| **Project Type** | Academic / Practical SQL Project |
| **Database Concept** | Relational Database |
| **Main Tables** | Customers, Orders, Employees |
| **Difficulty** | Intermediate → Advanced |
| **Primary Focus** | SQL Queries, Joins, Subqueries, Functions & Analysis |

---

# 🌟 About The Project

**PR 2.0 SQL** is a practical database project designed to demonstrate how SQL can be used to create, store, connect, analyze, and manipulate real-world data.

This project contains three important entities:

```text
👥 CUSTOMERS
      │
      │ CustomerID
      ▼
🛒 ORDERS

👨‍💼 EMPLOYEES
```

The project goes beyond basic `SELECT` queries.

It demonstrates several important SQL concepts including:

- 🏗️ Table Creation
- 🔑 Primary Keys
- 🔗 Foreign Keys
- ➕ Data Insertion
- 🔍 Data Retrieval
- 🤝 INNER JOIN
- ⬅️ LEFT JOIN
- ➡️ RIGHT JOIN
- 🔄 FULL OUTER JOIN concept
- 🧠 Subqueries
- 📅 Date Functions
- 🔤 String Functions
- 🧮 Aggregate Functions
- 📈 Window Functions
- 🏆 Ranking
- 💰 Running Totals
- 🏷️ CASE Expressions
- 🧹 TRIM
- 🔠 UPPER / LOWER
- ✨ CONCAT / REPLACE

This makes the project a useful demonstration of practical SQL skills.

---

# 🎯 Project Objective

The main objective of this project is to understand how SQL can be used to work with multiple related tables and perform meaningful analysis on stored data.

### The project focuses on:

1. Creating relational database tables.
2. Defining primary and foreign keys.
3. Inserting realistic sample data.
4. Connecting tables using joins.
5. Retrieving related customer and order information.
6. Using subqueries for analytical questions.
7. Working with dates.
8. Manipulating strings.
9. Calculating running totals.
10. Ranking records.
11. Categorizing data using `CASE`.
12. Understanding advanced SQL query techniques.

---

# 🏗️ Database Architecture

The project contains three main tables:

```text
                    ┌───────────────────┐
                    │     CUSTOMERS     │
                    ├───────────────────┤
                    │ CustomerID (PK)   │
                    │ FirstName         │
                    │ LastName          │
                    │ Email             │
                    │ RegistrationDate  │
                    └─────────┬─────────┘
                              │
                              │ CustomerID
                              │
                              ▼
                    ┌───────────────────┐
                    │      ORDERS       │
                    ├───────────────────┤
                    │ OrderID (PK)      │
                    │ CustomerID (FK)   │
                    │ OrderDate         │
                    │ TotalAmount       │
                    └───────────────────┘


                    ┌───────────────────┐
                    │     EMPLOYEES     │
                    ├───────────────────┤
                    │ EmployeeID (PK)   │
                    │ FirstName         │
                    │ LastName          │
                    │ Department        │
                    │ HireDate          │
                    │ Salary            │
                    └───────────────────┘
```

---

# 📊 1. CUSTOMERS TABLE

The `Customers` table stores information about customers.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `CustomerID` | INT | Unique customer ID |
| `FirstName` | VARCHAR(50) | Customer first name |
| `LastName` | VARCHAR(50) | Customer last name |
| `Email` | VARCHAR(100) | Customer email |
| `RegistrationDate` | DATE | Customer registration date |

### Primary Key

```sql
CustomerID INT PRIMARY KEY
```

The `CustomerID` uniquely identifies every customer.

### Sample Customers

| ID | Name | Email | Registration |
|---:|---|---|---|
| 1 | John Doe | john.doe@email.com | 2023-06-15 |
| 2 | Jane Smith | jane.smith@email.com | 2023-06-20 |
| 3 | Robert Brown | robert.brown@email.com | 2023-07-01 |
| 4 | Emily Davis | emily.davis@email.com | 2023-07-10 |

---

# 🛒 2. ORDERS TABLE

The `Orders` table stores customer order information.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `OrderID` | INT | Unique order ID |
| `CustomerID` | INT | Customer who placed the order |
| `OrderDate` | DATE | Date of order |
| `TotalAmount` | DECIMAL | Total order amount |

### Relationship

`CustomerID` connects the `Orders` table with the `Customers` table.

```text
Customers.CustomerID
          │
          │
          ▼
Orders.CustomerID
```

This is implemented using a **Foreign Key**.

```sql
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
```

---

# 👨‍💼 3. EMPLOYEES TABLE

The `Employees` table contains company employee information.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `EmployeeID` | INT | Unique employee ID |
| `FirstName` | VARCHAR(50) | Employee first name |
| `LastName` | VARCHAR(50) | Employee last name |
| `Department` | VARCHAR(50) | Employee department |
| `HireDate` | DATE | Employee joining date |
| `Salary` | DECIMAL | Employee salary |

### Sample Data

| ID | Employee | Department | Hire Date | Salary |
|---:|---|---|---|---:|
| 1 | Mark Johnson | Sales | 2020-05-15 | 55,000 |
| 2 | Susan Lee | HR | 2021-03-20 | 62,000 |
| 3 | David Wilson | IT | 2019-08-10 | 85,000 |
| 4 | Lisa Taylor | Finance | 2022-01-12 | 72,000 |

---

# 🔗 SQL JOINS

One of the major concepts demonstrated in this project is **SQL JOIN**.

Joins allow us to combine information from multiple tables.

---

## 1️⃣ INNER JOIN

The project uses an `INNER JOIN` to retrieve orders together with their customer information.

```sql
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
```

### 💡 What does it do?

It returns records where a matching customer and order exist.

```text
CUSTOMERS       ORDERS
    │              │
    └──── MATCH ───┘
           │
           ▼
      RESULT DATA
```

---

# 2️⃣ LEFT JOIN

The project also demonstrates `LEFT JOIN`.

```sql
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
```

### 💡 Why use LEFT JOIN?

It returns **all customers**, even if they do not have an order.

For example:

```text
Emily Davis
     │
     └── No Order
          ↓
        NULL
```

This is useful when we want to find customers who have or have not placed orders.

---

# 3️⃣ RIGHT JOIN

The project uses `RIGHT JOIN` to retrieve orders and their corresponding customer information.

```sql
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
```

A `RIGHT JOIN` ensures that all records from the right-side table are considered.

---

# 4️⃣ FULL OUTER JOIN CONCEPT

MySQL does not directly provide a native `FULL OUTER JOIN`.

Therefore, the project demonstrates the concept using:

```text
LEFT JOIN
   +
UNION
   +
RIGHT JOIN
```

Example:

```sql
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
```

### 🧠 Concept

```text
          FULL OUTER JOIN
                 │
       ┌─────────┴─────────┐
       ▼                   ▼
   LEFT JOIN           RIGHT JOIN
       │                   │
       └──────── UNION ────┘
                 │
                 ▼
            Final Result
```

---

# 🧠 SUBQUERIES

Subqueries are queries inside another query.

They are useful when the result of one query is needed by another query.

---

## 📌 1. Customers With Above-Average Orders

The project finds customers whose order amount is greater than the average order amount.

```sql
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
```

### 🧠 Logic

```text
          Orders
             │
             ▼
      Calculate AVG()
             │
             ▼
      Average Amount
             │
             ▼
 Compare each order
             │
             ▼
  Find matching customers
```

---

# 📈 2. Employees Above Average Salary

The project also identifies employees earning more than the average salary.

```sql
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
```

### Result

The employees above the average salary are:

- **David Wilson — IT — 85,000**
- **Lisa Taylor — Finance — 72,000**

---

# 📅 DATE FUNCTIONS

The project contains several useful date operations.

---

## 1️⃣ Extract Year and Month

```sql
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;
```

This extracts:

```text
OrderDate
   │
   ├── YEAR()
   │
   └── MONTH()
```

Example:

```text
2023-07-10
    │
    ├── Year  = 2023
    └── Month = 7
```

---

# ⏳ 2. DATEDIFF()

The project calculates the number of days between the order date and the current date.

```sql
SELECT
    OrderID,
    OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;
```

This is useful for:

- Order age
- Delivery analysis
- Time tracking
- Customer activity
- Business reporting

---

# 📆 3. DATE_FORMAT()

The project converts dates into a more readable format.

```sql
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;
```

Example:

```text
2023-07-01
     ↓
01-Jul-2023
```

---

# 🔤 STRING FUNCTIONS

String manipulation is another important part of the project.

---

## 1️⃣ CONCAT()

The project combines first name and last name.

```sql
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;
```

Example:

```text
John + Doe
    ↓
John Doe
```

---

# 🔄 2️⃣ REPLACE()

The project demonstrates replacing part of a string.

```sql
SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan')
        AS ModifiedFirstName
FROM Customers;
```

Example:

```text
John
 ↓
Jonathan
```

---

# 🔠 3️⃣ UPPER() AND LOWER()

The project converts text into different cases.

```sql
SELECT
    EmployeeID,
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM Employees;
```

Example:

```text
Mark Johnson
     ↓
MARK johnson
```

---

# 🧹 4️⃣ TRIM()

`TRIM()` removes unnecessary spaces from the beginning and end of text.

```sql
SELECT
    CustomerID,
    Email,
    TRIM(Email) AS TrimmedEmail
FROM Customers;
```

This is useful for cleaning data before analysis.

---

# 📊 WINDOW FUNCTIONS

The project goes beyond basic SQL and demonstrates **Window Functions**.

Window functions perform calculations across a group of rows while still keeping individual rows visible.

---

# 💰 1. RUNNING TOTAL

The project calculates a running total of order amounts.

```sql
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS RunningTotal
FROM Orders;
```

### Example

```text
Order 101 → 150.50
Order 102 → 351.25
Order 103 → 1101.25
Order 104 → 2301.25
Order 105 → 2901.25
```

The final running total is:

# 💰 2901.25

---

# 🏆 2. RANK()

The project ranks orders according to their total amount.

```sql
SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS AmountRank
FROM Orders;
```

### Ranking

| Rank | Order | Amount |
|---:|---:|---:|
| 🥇 1 | 104 | 1200.00 |
| 🥈 2 | 103 | 750.00 |
| 🥉 3 | 105 | 600.00 |
| 4 | 102 | 200.75 |
| 5 | 101 | 150.50 |

This is useful for:

- Top customers
- Highest orders
- Employee ranking
- Sales ranking
- Business reports

---

# 🏷️ CASE EXPRESSIONS

The project uses `CASE` to create categories based on conditions.

---

## 💸 Order Discount System

```sql
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% OFF'
        WHEN TotalAmount > 500 THEN '5% OFF'
        ELSE '0% OFF'
    END AS Discount
FROM Orders;
```

### Business Logic

```text
             Order Amount
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
    > 1000       > 500      Others
        │          │          │
        ▼          ▼          ▼
     10% OFF     5% OFF      0% OFF
```

---

# 👨‍💼 Employee Salary Categorization

The project also categorizes employee salaries.

```sql
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
```

### Categories

| Employee | Salary | Category |
|---|---:|---|
| Mark Johnson | 55,000 | Low |
| Susan Lee | 62,000 | Medium |
| David Wilson | 85,000 | High |
| Lisa Taylor | 72,000 | Medium |

---

# 📚 SQL CONCEPTS COVERED

This project covers a wide range of SQL concepts.

| # | Concept | Included |
|---:|---|:---:|
| 1 | CREATE TABLE | ✅ |
| 2 | INSERT | ✅ |
| 3 | PRIMARY KEY | ✅ |
| 4 | FOREIGN KEY | ✅ |
| 5 | INNER JOIN | ✅ |
| 6 | LEFT JOIN | ✅ |
| 7 | RIGHT JOIN | ✅ |
| 8 | FULL OUTER JOIN Concept | ✅ |
| 9 | UNION | ✅ |
| 10 | Subqueries | ✅ |
| 11 | AVG() | ✅ |
| 12 | YEAR() | ✅ |
| 13 | MONTH() | ✅ |
| 14 | DATEDIFF() | ✅ |
| 15 | CURDATE() | ✅ |
| 16 | DATE_FORMAT() | ✅ |
| 17 | CONCAT() | ✅ |
| 18 | REPLACE() | ✅ |
| 19 | UPPER() | ✅ |
| 20 | LOWER() | ✅ |
| 21 | TRIM() | ✅ |
| 22 | SUM() | ✅ |
| 23 | Window Functions | ✅ |
| 24 | RANK() | ✅ |
| 25 | CASE | ✅ |

---

# 🧮 PROJECT DATA SUMMARY

The project contains:

```text
👥 Customers
     └── 4 records

🛒 Orders
     └── 5 records

👨‍💼 Employees
     └── 4 records
```

### 💰 Order Analysis

The total of all orders is:

```text
150.50
+ 200.75
+ 750.00
+ 1200.00
+ 600.00
----------------
= 2901.25
```

### 🏆 Highest Order

```text
Order ID: 104
Amount:   1200.00
Customer: Robert Brown
```

### 💼 Highest Employee Salary

```text
Employee: David Wilson
Department: IT
Salary: 85,000
```

---

# 🚀 How To Run This Project

## Step 1 — Install MySQL

Install a MySQL-compatible environment such as MySQL Workbench.

---

## Step 2 — Open SQL File

Open:

```text
pr 2.0 sql.sql
```

---

## Step 3 — Create Tables

Execute the `CREATE TABLE` statements.

The project creates:

```text
Customers
Orders
Employees
```

---

## Step 4 — Insert Data

Execute the `INSERT INTO` statements to populate the tables.

---

## Step 5 — Execute Queries

Run the queries one by one to understand each SQL concept.

It is recommended to execute them in the same order as the project.

---

# 🧪 Suggested Learning Method

Instead of only copying the SQL queries, try to understand the logic behind every query.

For example:

```sql
SELECT *
FROM Orders;
```

Ask yourself:

> What table am I using?

Then:

```sql
WHERE TotalAmount > 500;
```

Ask:

> Which records do I want?

Then:

```sql
ORDER BY TotalAmount DESC;
```

Ask:

> How should the results be arranged?

This approach helps develop **SQL problem-solving skills**.

---

# 🎓 Learning Outcomes

After completing this project, a student should have a stronger understanding of:

### 🟢 Basic SQL

- Tables
- Columns
- Rows
- Primary Keys
- Foreign Keys
- INSERT
- SELECT

### 🟡 Intermediate SQL

- JOIN
- UNION
- Subqueries
- Aggregate Functions
- Date Functions
- String Functions

### 🔵 Advanced SQL

- Window Functions
- Running Totals
- Ranking
- CASE expressions
- Data categorization
- Analytical queries

---

# 💡 Real-World Applications

The concepts used in this project are useful in many real-world applications.

### 🛒 E-Commerce

```text
Customer
   ↓
Order
   ↓
Payment
   ↓
Delivery
```

### 🏢 Company Management

```text
Employee
   ↓
Department
   ↓
Salary
   ↓
Performance
```

### 📊 Business Analytics

```text
Raw Data
   ↓
SQL Query
   ↓
Analysis
   ↓
Report
   ↓
Business Decision
```

---

# 🔮 Future Improvements

This project can be expanded into a complete business database system.

Possible improvements include:

### 👥 Customer Module

- Customer login
- Customer profile
- Customer order history
- Customer spending analysis

### 🛒 Order Module

- Product table
- Order details
- Payment information
- Order status
- Delivery tracking

### 👨‍💼 Employee Module

- Department table
- Employee attendance
- Employee performance
- Salary history
- Employee promotion

### 📊 Analytics Module

- Monthly sales
- Top customers
- Top products
- Department salary analysis
- Sales dashboards
- Business reports

---

# 🧠 Project Learning Journey

```text
                 🌱 START
                    │
                    ▼
              Learn SQL Basics
                    │
                    ▼
             Create Tables
                    │
                    ▼
              Insert Data
                    │
                    ▼
             Query Data
                    │
                    ▼
                 JOIN
                    │
                    ▼
              Subqueries
                    │
                    ▼
            Date & String Functions
                    │
                    ▼
             Window Functions
                    │
                    ▼
              Data Analysis
                    │
                    ▼
                 🚀
          Advanced SQL Developer
```

---

# ❤️ Acknowledgement

I would like to sincerely thank **Girish Sir** for his valuable guidance, teaching, encouragement, and support throughout the development of this SQL project.

This project has helped me understand that SQL is not simply about writing commands.

SQL is about:

> **Understanding data → Asking the right questions → Writing logical queries → Finding useful answers.**

The guidance and practical learning provided during this project helped make complex SQL concepts easier to understand and apply.

---

# 👨‍💻 Author

## **Krish**

This project was created by **Krish** as a practical SQL learning project.

Through this project, I explored database creation, relationships between tables, SQL joins, subqueries, functions, window functions, ranking, and data categorization.

The goal is to continue improving SQL knowledge and eventually use these concepts in larger real-world projects.

---

# 👨‍🏫 Guided By

## **Girish Sir**

### 🙏 Special Thanks

A special thanks to **Girish Sir** for providing guidance and helping me understand SQL and database concepts.

---

# 🏆 Conclusion

**PR 2.0 SQL** is a practical demonstration of how SQL can transform raw data into meaningful information.

Starting from simple table creation, the project gradually moves toward more advanced concepts such as:

```text
CREATE TABLE
     ↓
INSERT DATA
     ↓
JOIN TABLES
     ↓
SUBQUERIES
     ↓
DATE FUNCTIONS
     ↓
STRING FUNCTIONS
     ↓
WINDOW FUNCTIONS
     ↓
RANKING
     ↓
CASE ANALYSIS
     ↓
📊 DATA INSIGHTS
```

The project demonstrates that a database is more than a place to store information.

It is a powerful tool for **organizing data, discovering patterns, answering questions, and supporting decisions**.

---

# 🌟 Final Message

<p align="center">

## 💻 KEEP LEARNING

## 🧠 KEEP QUERYING

## 🚀 KEEP BUILDING

### Every SQL query is a step toward becoming a better developer.

</p>

---

# 📁 Project Structure

```text
📦 PR 2.0 SQL PROJECT
│
├── 📄 pr 2.0 sql.sql
│
└── 📖 README.md
│
├── 👥 Customers
├── 🛒 Orders
└── 👨‍💼 Employees
```

---

<p align="center">

### ⭐ PR 2.0 SQL Database Project ⭐

**Created by Krish**

**Guided by Girish Sir**

### ❤️ Made with Learning, Practice & Dedication

</p>