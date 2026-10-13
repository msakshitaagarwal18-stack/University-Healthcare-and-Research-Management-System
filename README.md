# University Healthcare and Research Management System (VIT)

**Database Management Systems (DBMS) Case Study – 4**

**Database:** MySQL
**Institution:** Vellore Institute of Technology (VIT)
**Project Type:** Relational Database Design and SQL Implementation

---

## 📌 Project Overview

The **University Healthcare and Research Management System** is a relational database project designed to integrate and manage multiple university operations within a centralized database.

The system supports academic administration, research activities, healthcare services, library management, hostel accommodation, transportation, student clubs, and online learning.

The project demonstrates the practical application of database concepts such as Entity-Relationship (ER) modeling, relational schema design, normalization, primary and foreign keys, integrity constraints, and SQL queries.

---

## 🎯 Project Objectives

The main objectives of this project are:

1. Design a comprehensive database for university management.
2. Develop an ER diagram representing entities and their relationships.
3. Convert the ER model into a relational schema.
4. Implement the relational schema using MySQL.
5. Insert sample records into the database tables.
6. Establish relationships using primary and foreign keys.
7. Retrieve information using SQL queries and joins.
8. Identify students eligible for the APJ Abdul Kalam Award based on academic performance and research participation.

---

## 🏛️ Major Subsystems

### 1. Student and Faculty Management

Maintains information about students, faculty members, staff, and visiting scholars.

**Tables:** `PERSON`, `STUDENT`, `FACULTY`, `STAFF`, `VISITING_SCHOLAR`, `DEPARTMENT`

### 2. Academic Management

Manages university courses, course sections, faculty assignments, and student enrollments.

**Tables:** `COURSE`, `COURSE_SECTION`, `ENROLLMENT`

### 3. Research and Publication Management

Maintains research projects, project participants, publications, and authorship details.

**Tables:** `PROJECT`, `PROJECT_PARTICIPATION`, `PUBLICATION`, `AUTHORSHIP`

### 4. Library Management

Handles books, individual book copies, borrowing records, and fines.

**Tables:** `BOOK`, `BOOK_COPY`, `BORROWING`

### 5. Hostel Management

Stores hostel information, room details, and student room allocations.

**Tables:** `HOSTEL`, `ROOM`, `ROOM_ALLOCATION`

### 6. Healthcare Management

Manages doctors, medicines, patient visits, and prescription details.

**Tables:** `DOCTOR`, `MEDICINE`, `VISIT`, `PRESCRIPTION_ITEM`

### 7. Transportation Management

Maintains university buses, drivers, bus assignments, and student bus subscriptions.

**Tables:** `BUS`, `DRIVER`, `BUS_ASSIGNMENT`, `BUS_SUBSCRIPTION`

### 8. Student Club Management

Manages university clubs, faculty advisors, and student memberships.

**Tables:** `CLUB`, `CLUB_MEMBERSHIP`

### 9. Learning Management System

Maintains course modules, educational videos, assignments, quizzes, and student submissions.

**Tables:** `MODULE`, `VIDEO`, `ASSIGNMENT`, `ASSIGNMENT_SUBMISSION`, `QUIZ`, `QUIZ_QUESTION`

### 10. Faculty Mentoring and Research Supervision

Maintains faculty mentoring relationships and student research supervision.

**Tables:** `MENTORING`, `SUPERVISION`

Additional tables maintain faculty phone numbers, faculty research interests, student skills, and student certifications.

---

## 📂 Repository Structure

```text
University-Healthcare-Research-Management-System/
│
├── README.md
├── schema.sql
├── data.sql
└── query_apj_award.sql
```

**File descriptions:**

* `README.md` — Project overview and execution instructions.
* `schema.sql` — SQL statements for creating database tables and defining relationships.
* `data.sql` — SQL statements for inserting sample records.
* `query_apj_award.sql` — SQL query for identifying students eligible for the APJ Abdul Kalam Award.

---

## 📚 DBMS Concepts Implemented

The project demonstrates:

* Entity-Relationship (ER) modeling
* Enhanced Entity-Relationship (EER) concepts
* Relational schema design
* Database normalization
* Primary keys and foreign keys
* Composite keys
* Referential integrity
* SQL Data Definition Language (DDL)
* SQL Data Manipulation Language (DML)
* SQL joins
* Data retrieval and filtering
* Multi-table analytical queries

---

## 🏆 APJ Abdul Kalam Award Recognition Query

One of the major SQL queries developed in this project identifies students eligible for recognition based on their academic performance and research participation.

### Eligibility Conditions

Students are selected based on the following conditions:

1. The student has obtained an **S grade** in at least one enrolled course.
2. The student is participating in a university research project.
3. The research project is associated with publication information, where available.

### Query Output

The SQL query retrieves:

1. Award Title
2. Student Name
3. Registration Number
4. Course Name
5. Course Code
6. Course Faculty ID
7. Course Faculty Name
8. Head of Department Name
9. Course Grade
10. Research Work
11. Research Work Publication

### Example Student Record

| Attribute           | Value                                              |
| ------------------- | -------------------------------------------------- |
| Student Name        | Aarav Sharma                                       |
| Registration Number | 24BDS0125                                          |
| Course Name         | Database Systems                                   |
| Course Code         | 501                                                |
| Course Grade        | S                                                  |
| Research Project    | AI Based Network Intrusion Detection               |
| Publication         | Machine Learning Based Network Intrusion Detection |

The query uses multiple SQL joins to combine student, faculty, department, enrollment, course, research project, and publication information.

---

## 🚀 How to Run the Project

### Requirements

* MySQL 8.0 or later
* MySQL Workbench or MySQL Command Line Client

### Step 1: Create the Database

```sql
CREATE DATABASE IF NOT EXISTS university_management;
USE university_management;
```

### Step 2: Execute the Relational Schema

Run:

```sql
SOURCE schema.sql;
```

This creates the database tables and their relationships.

### Step 3: Insert Sample Records

Run:

```sql
SOURCE data.sql;
```

This inserts the sample records into the database.

### Step 4: Execute the Award Query

Run:

```sql
SOURCE query_apj_award.sql;
```

This displays the students satisfying the conditions defined in the award eligibility query.

**Note:** The `SOURCE` commands are intended for the MySQL command-line client. In MySQL Workbench, open each SQL file and execute its statements.

---

## 🧪 Database Verification

After inserting the records, verify the database using SQL queries.

### Display Students

```sql
SELECT * FROM STUDENT;
```

### Display Faculty Members

```sql
SELECT * FROM FACULTY;
```

### Display Courses

```sql
SELECT * FROM COURSE;
```

### Display Research Projects

```sql
SELECT * FROM PROJECT;
```

### Display Student Enrollments

```sql
SELECT * FROM ENROLLMENT;
```

These queries help verify that the records have been inserted successfully.

---

## 🔮 Future Enhancements

Possible improvements include:

* Developing a web-based user interface.
* Implementing role-based access control.
* Adding automated report generation.
* Integrating appointment scheduling for university healthcare.
* Developing student performance dashboards.
* Implementing automated library fine calculations.
* Adding advanced research analytics.

---

## 📖 Conclusion

The University Healthcare and Research Management System demonstrates the practical implementation of relational database concepts in a university environment.

The project integrates multiple institutional operations through a structured database and establishes relationships between students, faculty members, courses, research projects, healthcare records, and other university resources.

The APJ Abdul Kalam Award recognition query demonstrates how SQL joins and filtering conditions can retrieve meaningful information from interconnected database tables.

Overall, the project highlights the importance of relational database design, data integrity, and SQL-based information retrieval in university management systems.
