## Hospital-Administration-System-MySQL-

Hospital Administration System is a MySQL-based database project that manages hospital operations including departments, doctors, patients, appointments, and billing. It supports real-time business queries, ensures data integrity through relationships, and provides insights into appointments, revenue, and payments.Hospital-Administration-System-MySQL-
Hospital Administration System (MySQL)

*Project Overview*

The *Hospital Administration* System is a relational database project developed using MySQL to simulate real‑world hospital operations. The system is designed to manage and organize hospital data related to departments, doctors, patients, appointments, and billing. The project focuses on efficient data storage, integrity through relationships, and meaningful business insights using SQL queries. This project reflects a practical use case where SQL is applied to solve real administrative and analytical requirements in a hospital environment.

*Tools & Technologies Used*

* *MySQL* – Database creation, table design, queries, and data manipulation
* *MySQL Workbench* – Database development and query execution
* *Microsoft Excel* – Source dataset for importing records
* *SQL* – Joins, subqueries, aggregations, updates, and deletions

*Project Structure*

The database consists of the following tables:

1. *Departments* – Stores hospital department details
2. *Doctors* – Maintains doctor information and specialization
3. *Patients* – Contains patient demographic details
4. *Appointments* – Tracks patient appointments with doctors
5. *Billing* – Manages billing and payment status
Each table is connected using *primary keys and foreign keys* to ensure data integrity and relational consistency.

*Features Implemented*

* Creation of a normalized hospital database
* Establishment of relationships between tables using foreign keys
* Importing structured data from Excel into MySQL tables
* Managing appointment statuses (Pending, Completed, Cancelled)
* Tracking billing details and payment status
* Performing real‑time business analysis using SQL queries

*Business Queries Covered*

The following real‑world business requirements were implemented using SQL:
* Display patients along with their assigned doctor and specialization
* Retrieve appointments scheduled for the current date
* List doctors working in a specific department
* Calculate total revenue collected from paid bills
* Identify patients with unpaid bills
* Count total appointments handled by each doctor
* Show department‑wise doctor distribution.

*Advanced SQL Concepts Used*

* Subqueries for comparative analysis (above‑average billing)
* GROUP BY and HAVING for performance‑based filtering
* Aggregate functions such as SUM, COUNT, and MAX
* Joins for joining tables and finding essential queries.
* Used Update and Delete functions.

*Key Findings & Insights*

* Department-Level Insights: GROUP BY queries reveal how doctors are distributed across departments.
* Revenue Insights: Billing records enable calculation of total revenue and help identify pending payments.
* Appointment Analysis: Tracking appointment counts per doctor provides insight into workload distribution.
* Doctor–Patient Association: JOIN operations are used to connect patients with their respective doctors and departments.
* Department Workload Balance: Comparing appointment counts across departments helps identify over- or under-utilized departments.
* Advanced SQL Application: Subqueries and HAVING clauses support deeper analysis, such as identifying high-value bills and doctors with multiple consultations.
* Data Consistency: Foreign key constraints maintain accuracy and integrity across all hospital-related data.

*Conclusion*

This project demonstrates the practical application of SQL in managing and analyzing hospital data. It showcases database design skills, data manipulation techniques, and the ability to derive meaningful business insights, making it suitable for academic projects, portfolios, and entry‑level data or SQL‑related roles.
