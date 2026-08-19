# SQL Database Project

## 📌 Project Overview

This project is a relational database system developed using **SQL**.

The main goal of the project is to design a structured database, store related information, and use SQL queries to retrieve, analyze, and manage the data efficiently.

The project demonstrates practical knowledge of:

* Database Design
* Relational Databases
* SQL
* DDL
* DML
* SELECT Queries
* Filtering and Sorting
* Aggregate Functions
* GROUP BY and HAVING
* JOINs
* Subqueries
* Data Manipulation

---

## 🗄️ Database Structure

The database consists of multiple related tables.

### Main Tables

* `Customers`
* `Products`
* `Orders`
* `OrderDetails`

> Replace the table names above with the actual tables in your project if they are different.

### Relationships

The tables are connected using **Primary Keys (PK)** and **Foreign Keys (FK)** to maintain data integrity and establish relationships between entities.

Example:

```text
Customers
    |
    | 1 : Many
    ↓
Orders
    |
    | 1 : Many
    ↓
OrderDetails
    |
    | Many : 1
    ↓
Products
```

---

## 🛠️ Technologies Used

* **SQL**
* **MySQL / SQL Server**
* **Git & GitHub**

---

## 📂 Project Files

```text
SQL-Project/
│
├── README.md
├── database.sql
└── queries.sql
```

### `database.sql`

Contains:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Constraints
* Sample data

### `queries.sql`

Contains SQL queries used for:

* Data retrieval
* Filtering
* Sorting
* Aggregation
* JOIN operations
* Business questions
* Data analysis

---

## 🚀 How to Run the Project

### Step 1 — Clone the Repository

```bash
git clone https://github.com/USERNAME/REPOSITORY-NAME.git
```

### Step 2 — Open the SQL File

Open:

```text
database.sql
```

using your SQL environment.

### Step 3 — Create the Database

Run the database creation script.

### Step 4 — Insert the Data

Execute the INSERT statements to populate the tables.

### Step 5 — Run the Queries

Open:

```text
queries.sql
```

and execute the queries to explore and analyze the database.

---

## 📊 SQL Concepts Demonstrated

### Basic Queries

```sql
SELECT *
FROM Customers;
```

### Filtering

```sql
SELECT *
FROM Customers
WHERE City = 'Cairo';
```

### Sorting

```sql
SELECT *
FROM Products
ORDER BY Price DESC;
```

### Aggregate Functions

```sql
SELECT 
    COUNT(*) AS Total_Records,
    AVG(Price) AS Average_Price,
    MAX(Price) AS Maximum_Price,
    MIN(Price) AS Minimum_Price
FROM Products;
```

### GROUP BY

```sql
SELECT Category, COUNT(*) AS NumberOfProducts
FROM Products
GROUP BY Category;
```

### JOIN

```sql
SELECT 
    Customers.CustomerName,
    Orders.OrderID,
    Orders.OrderDate
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID;
```

---

## 🎯 Project Objectives

The project aims to:

1. Design a relational database.
2. Create tables using appropriate data types.
3. Define Primary and Foreign Keys.
4. Insert and manage data.
5. Retrieve information using SQL queries.
6. Analyze data using aggregate functions.
7. Use JOINs to combine information from multiple tables.
8. Answer real-world business questions using SQL.
9. Practice database management and SQL problem solving.

---

## 💡 Business Questions

The database can be used to answer questions such as:

* How many customers are registered?
* What are the most popular products?
* What is the total number of orders?
* What is the average product price?
* Which customers have placed orders?
* What are the highest-value orders?
* How many orders were placed during a specific period?
* Which products generate the highest sales?

---

## 📈 Future Improvements

Possible future improvements include:

* Adding more realistic data.
* Creating database views.
* Adding stored procedures.
* Adding triggers.
* Improving database normalization.
* Creating dashboards using Power BI or Excel.
* Connecting the database to a web application.

---

## 👨‍💻 Author

**Ahmed Ramy**

Computer Science Student

GitHub: `https://github.com/USERNAME`

---

## 📄 License

This project was created for **educational and academic purposes**.

