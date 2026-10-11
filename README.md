# University Healthcare and Research Management System (VIT)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%7C%20MySQL-336791.svg)](https://www.postgresql.org/)
[![Status](https://img.shields.io/badge/Status-Complete-success.svg)]()

> Comprehensive Relational Database Management System (RDBMS) architecture, Enhanced Entity-Relationship (EER) modeling, 3NF/BCNF relational schemas, and analytical SQL scripts for **VIT Case Study – 4 (50 Marks)**.

---

## 📌 Table of Contents
1. [Project Overview](#-project-overview)
2. [Subsystem Architecture](#-subsystem-architecture)
3. [Repository Structure](#-repository-structure)
4. [Solutions Overview](#-solutions-overview)
   - [Question 1: E-R & EER Modeling (10 Marks)](#question-1-e-r--eer-modeling-10-marks)
   - [Question 2: Relational Schema Conversion (10 Marks)](#question-2-relational-schema-conversion-10-marks)
   - [Question 3: SQL DDL & DML Implementation (10 Marks)](#question-3-sql-ddl--dml-implementation-10-marks)
   - [Question 4: APJ Abdul Kalam Award Recognition Query (10 Marks)](#question-4-apj-abdul-kalam-award-recognition-query-10-marks)
   - [Question 5: Academic & AI Reference Report (10 Marks)](#question-5-academic--ai-reference-report-10-marks)
5. [Quick Start / How to Run](#-quick-start--how-to-run)
6. [License](#-license)

---

## 🏛 Project Overview

The **University Healthcare and Research Management System** is a centralized relational database engineered for a modern university ecosystem (Vellore Institute of Technology - VIT). It integrates and manages 10 core institutional functions:

* **Identity Management**: Overlapping `Person` specialization (`Student`, `Faculty`, `Staff`, `Visiting Scholar`) supporting multi-role personas.
* **Academic Administration**: Departments, Courses, and Weak Entity `Course_Section` offerings.
* **Research & Publications**: Funded multi-investigator projects, participant contribution accounting, and DOI-indexed publication authorship.
* **Library Management**: Weak Entity `Book_Copy` circulation, loan tracking, and automatic fine calculation.
* **Hostel Accommodation**: Hostels, Weak Entity `Hostel_Room`, and historical student room allocations.
* **Healthcare Center**: Doctor consultations, clinical diagnoses, and multi-medicine dosage scheduling.
* **Fleet Transportation**: Buses, routes, driver shift rosters, and student subscriptions.
* **Student Extracurriculars**: Student clubs and tenure-based leadership positions.
* **Online LMS**: Courses, learning modules, Weak Entity `Quiz_Question`, assignments, and student submissions.
* **Faculty Mentorship & Supervision**: Recursive faculty-to-faculty mentoring and faculty-to-student research supervision.

---

## 📂 Repository Structure

```
├── README.md                      # Project documentation and summary
├── Case_Study_4_Solutions.md      # Comprehensive 50-mark full solution report
├── schema.sql                     # Production DDL schema with triggers & views
├── data.sql                       # Complete DML dataset for all tables
└── query_apj_award.sql            # Analytics SQL script for Question 4
```

---

## 🎯 Solutions Overview

### Question 1: E-R & EER Modeling (10 Marks)
- Fully detailed semantic model handling **composite attributes** (`Name`, `Address`), **multi-valued attributes** (`Faculty_Phones`, `Research_Interests`, `Student_Skills`, `Certifications`), and **derived attributes** (`Age`, `Experience`, `Fine_Amount`).
- Explicit identification of all **5 Weak Entities**: `Course_Section`, `Book_Copy`, `Hostel_Room`, `Quiz_Question`, `Assignment_Submission`.
- Complete interactive **Mermaid ER Diagram** and entity-relationship specifications.

### Question 2: Relational Schema Conversion (10 Marks)
- Formal transformation using **Elmasri-Navathe Step 8 (Option 8C)** for overlapping subclasses.
- 40 fully normalized relations (3NF / BCNF) with primary keys, foreign key constraints, and cascade actions.

### Question 3: SQL DDL & DML Implementation (10 Marks)
- Standalone [`schema.sql`](schema.sql) and [`data.sql`](data.sql) scripts tested for both PostgreSQL and MySQL 8.0+.
- Dynamic age/experience calculation views and automated library fine calculation triggers.

### Question 4: APJ Abdul Kalam Award Recognition Query (10 Marks)
- Complex multi-table join script [`query_apj_award.sql`](query_apj_award.sql) to identify students who conduct active funded research, publish scholarly work, and achieve an **'S' grade** in course examinations.

#### Sample Query Output
| Student Name | RegNo | Course Name | Course Code | Course Faculty ID | Course Faculty Name | HoD Name | Grade | Research Work | Publication |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Aarav Kumar Sharma** | **21BCE1001** | Database Management Systems | CSE3001 | FAC_CSE_01 | Dr. Ramesh Sundaram | Dr. Meenakshi R Iyer | **S** | AI-Driven Multimodal Healthcare Intelligence | Scalable Deep Graph Learning on Clinical Patient Databases (DOI: 10.1109/JBHI.2025.32109) |

### Question 5: Academic & AI Reference Report (10 Marks)
- 10 distinct, verified academic and technical sources including *Silberschatz*, *Elmasri-Navathe*, *Ramakrishnan*, official PostgreSQL/MySQL docs, ISO standards, and LLM sessions evaluated on a **1–5 scale**.

---

## 🚀 Quick Start / How to Run

### PostgreSQL
```bash
# 1. Create database
psql -U postgres -c "CREATE DATABASE vit_university_db;"

# 2. Execute schema & data
psql -U postgres -d vit_university_db -f schema.sql
psql -U postgres -d vit_university_db -f data.sql

# 3. Run Question 4 Analytics Query
psql -U postgres -d vit_university_db -f query_apj_award.sql
```

---

## 📄 License
This repository is released under the [MIT License](LICENSE).
