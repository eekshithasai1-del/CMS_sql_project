# Complaint Management System using MySQL

## 📌 Project Overview

The **Complaint Management System** is a database management project developed using MySQL to efficiently manage user complaints, employees, departments, and complaint categories. It provides a structured way to register complaints, assign them to employees, track their status and priority, and generate useful reports using SQL queries.

This project demonstrates practical SQL concepts, relational database design, data retrieval, and automation using database objects.

## 🎯 Objectives

- Store and manage user, employee, and department information.
- Register and categorize complaints.
- Assign complaints to employees for resolution.
- Track complaint status, priority, and submission dates.
- Generate reports to analyze complaint distribution and employee workload.
- Maintain data consistency using primary keys and foreign keys.
- Automate database operations using views, stored procedures, and triggers.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Workbench / MySQL Command Line Client
- **Database Concepts:** Relational Database Design, Joins, Subqueries, Views, Stored Procedures, Triggers, and Transactions

## 🗂️ Database Schema

The project consists of five main tables:

| Table Name | Description |
|---|---|
| `Users` | Stores user details such as name, phone, email, and address. |
| `Departments` | Stores department information. |
| `Employees` | Stores employee details and their department assignments. |
| `Complaint_Categories` | Stores complaint categories such as Software, Hardware, Network, Login, Security, and Other. |
| `Complaints` | Stores complaint details, including user, assigned employee, category, date, priority, status, and description. |

### ER Diagram

The database uses primary keys and foreign keys to establish relationships between tables.

- One department can have multiple employees.
- One user can register multiple complaints.
- One employee can handle multiple complaints.
- One complaint category can contain multiple complaints.

![Complaint Management System ER Diagram](ER_Diagram.png)

> Add your ER diagram image to the repository and name it `ER_Diagram.png`, or change the filename in the Markdown above to match your actual image filename.

## ✨ Key Features

### 1. Complaint Management
- Retrieve all complaints.
- Display open, resolved, and high-priority complaints.
- Track complaint dates, priorities, and statuses.
- Generate complaint reference IDs using category names and complaint IDs.

### 2. SQL Queries and Analysis
- Retrieve complaints with user, employee, and department details.
- Count complaints by status, priority, department, and employee.
- Identify departments receiving the most complaints.
- Find employees handling the highest number of complaints.
- Identify users and employees without associated complaints.
- Calculate average complaints per employee.

### 3. SQL Functions
The project demonstrates several built-in SQL functions:

- **String functions:** `UPPER()`, `LOWER()`, `CONCAT()`, `LEFT()`, `RIGHT()`, `REPLACE()`
- **Date functions:** `CURDATE()`, `DATE_FORMAT()`, date interval operations
- **Aggregate functions:** `COUNT()`, `AVG()`, `MIN()`, `MAX()`

### 4. Advanced SQL Concepts
- **Joins:** Combine related data from multiple tables.
- **Subqueries:** Analyze employee workloads and complaint counts.
- **Views:** Create reusable queries, including an `Open_Complaints` view.
- **Stored Procedures:** Retrieve complaints by employee, filter complaints by priority, and count complaints by category.
- **Transactions:** Group updates using `START TRANSACTION`, `UPDATE`, and `COMMIT`.
- **Triggers:** Automatically log newly created complaints and record complaint status changes.

## 📊 Sample Analysis

The project includes sample data for users, employees, departments, complaint categories, and complaints.

Example analytical questions answered by the SQL queries:

- Which department handles the most complaints?
- Which employee handles the highest number of complaints?
- How many complaints are open, resolved, or in progress?
- Which complaints have high priority?
- What is the total complaint count for each category?
- Which employees have no assigned complaints?

## 🚀 How to Run the Project

### Prerequisites

Install MySQL Server and optionally MySQL Workbench.

### Step 1: Clone the Repository

```bash
git clone <your-github-repository-url>
```

### Step 2: Open the SQL File

Open `project.sql` in MySQL Workbench or another MySQL client.

### Step 3: Execute the SQL Script

Run the script to create the database tables, insert sample records, and execute the included SQL queries.

If your SQL script does not create the database automatically, create and select it first:

```sql
CREATE DATABASE pfs39;
USE pfs39;
```

### Step 4: Explore the Results

Execute the queries to explore complaint records, department-wise reports, employee workloads, stored procedures, views, and triggers.

> **Note:** Run stored procedure and trigger definitions before calling or testing them. Some statements in the script may need to be executed separately depending on your MySQL client.

## 📁 Project Structure

```text
Complaint-Management-System/
│
├── project.sql
├── ER_Diagram.png
├── Complaint_Management_System.ppt
└── README.md
```

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases.
- Creating tables with primary and foreign key constraints.
- Writing SQL queries for data retrieval and analysis.
- Applying joins, aggregate functions, and subqueries.
- Creating and using views and stored procedures.
- Implementing triggers for automatic logging.
- Managing transactions and maintaining data integrity.

## 🔮 Future Enhancements

- Develop a web interface for complaint registration and tracking.
- Add user authentication and role-based access.
- Send email notifications when complaint statuses change.
- Build interactive dashboards for complaint analytics.
- Add automatic employee assignment based on department and workload.


## 📄 Conclusion

The Complaint Management System demonstrates how MySQL and SQL can be used to build a structured, relational database solution for complaint tracking and analysis. It combines database design, querying, reporting, and automation to support efficient complaint management and improve data organization.

---

**If you find this project useful, consider giving the repository a ⭐ on GitHub!**
