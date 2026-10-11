-- ============================================================================
-- UNIVERSITY HEALTHCARE AND RESEARCH MANAGEMENT SYSTEM (VIT)
-- SCHEMA CREATION SCRIPT (DDL)
-- Compatible with PostgreSQL 12+ and MySQL 8.0+
-- ============================================================================

CREATE DATABASE IF NOT EXISTS university_management;
USE university_management;
CREATE TABLE PERSON (
    Person_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE,
    Gender VARCHAR(20),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Door_No VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Postal_Code VARCHAR(10)
);
CREATE TABLE STUDENT (
    Person_ID INT PRIMARY KEY,
    Roll_No VARCHAR(20) UNIQUE NOT NULL,
    Program VARCHAR(100),
    Semester INT,
    CGPA DECIMAL(3,2),

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID)
);
CREATE TABLE FACULTY (
    Person_ID INT PRIMARY KEY,
    Employee_ID VARCHAR(20) UNIQUE NOT NULL,
    Designation VARCHAR(100),
    Salary DECIMAL(12,2),
    Joining_Date DATE,
    Dept_ID INT,

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID)
);
CREATE TABLE STAFF (
    Person_ID INT PRIMARY KEY,
    Shift VARCHAR(30),
    Dept_ID INT,

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID)
);
CREATE TABLE VISITING_SCHOLAR (
    Person_ID INT PRIMARY KEY,
    Home_University VARCHAR(150),
    Country VARCHAR(50),
    Visit_Duration VARCHAR(50),

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID)
);
CREATE TABLE DEPARTMENT (
    Dept_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Building VARCHAR(100),
    Budget DECIMAL(15,2),
    HOD_Faculty_ID INT UNIQUE
);
ALTER TABLE FACULTY
ADD CONSTRAINT fk_faculty_department
FOREIGN KEY (Dept_ID)
REFERENCES DEPARTMENT(Dept_ID);

ALTER TABLE STAFF
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (Dept_ID)
REFERENCES DEPARTMENT(Dept_ID);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_department_hod
FOREIGN KEY (HOD_Faculty_ID)
REFERENCES FACULTY(Person_ID);

CREATE TABLE COURSE (
    Course_ID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Credits INT
);
CREATE TABLE COURSE_SECTION (
    Course_ID INT,
    Semester VARCHAR(20),
    Academic_Year VARCHAR(20),
    Section_No VARCHAR(10),
    Faculty_ID INT,

    PRIMARY KEY (
        Course_ID,
        Semester,
        Academic_Year,
        Section_No
    ),

    FOREIGN KEY (Course_ID)
        REFERENCES COURSE(Course_ID),

    FOREIGN KEY (Faculty_ID)
        REFERENCES FACULTY(Person_ID)
);
CREATE TABLE ENROLLMENT (
    Student_ID INT,
    Course_ID INT,
    Semester VARCHAR(20),
    Academic_Year VARCHAR(20),
    Section_No VARCHAR(10),
    Enrollment_Date DATE,
    Grade VARCHAR(5),
    Attendance_Pct DECIMAL(5,2),

    PRIMARY KEY (
        Student_ID,
        Course_ID,
        Semester,
        Academic_Year,
        Section_No
    ),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID),

    FOREIGN KEY (
        Course_ID,
        Semester,
        Academic_Year,
        Section_No
    )
        REFERENCES COURSE_SECTION(
            Course_ID,
            Semester,
            Academic_Year,
            Section_No
        )
);
CREATE TABLE PROJECT (
    Project_ID INT PRIMARY KEY,
    Title VARCHAR(200),
    Budget DECIMAL(15,2),
    Start_Date DATE,
    End_Date DATE
);
CREATE TABLE PROJECT_PARTICIPATION (
    Person_ID INT,
    Project_ID INT,
    Role VARCHAR(100),
    Joining_Date DATE,
    Contribution_Pct DECIMAL(5,2),

    PRIMARY KEY (Person_ID, Project_ID),

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID),

    FOREIGN KEY (Project_ID)
        REFERENCES PROJECT(Project_ID)
);
CREATE TABLE PUBLICATION (
    DOI VARCHAR(100) PRIMARY KEY,
    Title VARCHAR(250),
    Publication_Date DATE,
    Venue_Details VARCHAR(250),
    Project_ID INT,

    FOREIGN KEY (Project_ID)
        REFERENCES PROJECT(Project_ID)
);
CREATE TABLE AUTHORSHIP (
    Person_ID INT,
    DOI VARCHAR(100),
    Author_Order INT,

    PRIMARY KEY (Person_ID, DOI),

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID),

    FOREIGN KEY (DOI)
        REFERENCES PUBLICATION(DOI)
);
CREATE TABLE BOOK (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(200),
    Edition VARCHAR(50),
    Publisher VARCHAR(150)
);
CREATE TABLE BOOK_COPY (
    ISBN VARCHAR(20),
    Copy_No INT,
    Rack_Location VARCHAR(50),
    Status VARCHAR(30),

    PRIMARY KEY (ISBN, Copy_No),

    FOREIGN KEY (ISBN)
        REFERENCES BOOK(ISBN)
);
CREATE TABLE BORROWING (
    Person_ID INT,
    ISBN VARCHAR(20),
    Copy_No INT,
    Issue_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    Fine_Amount DECIMAL(10,2),

    PRIMARY KEY (
        Person_ID,
        ISBN,
        Copy_No,
        Issue_Date
    ),

    FOREIGN KEY (Person_ID)
        REFERENCES PERSON(Person_ID),

    FOREIGN KEY (ISBN, Copy_No)
        REFERENCES BOOK_COPY(ISBN, Copy_No)
);
CREATE TABLE HOSTEL (
    Hostel_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Hostel_Type VARCHAR(50)
);
CREATE TABLE ROOM (
    Hostel_ID INT,
    Room_No VARCHAR(20),
    Capacity INT,

    PRIMARY KEY (Hostel_ID, Room_No),

    FOREIGN KEY (Hostel_ID)
        REFERENCES HOSTEL(Hostel_ID)
);
CREATE TABLE ROOM_ALLOCATION (
    Student_ID INT,
    Hostel_ID INT,
    Room_No VARCHAR(20),
    Check_In_Date DATE,
    Check_Out_Date DATE,

    PRIMARY KEY (
        Student_ID,
        Hostel_ID,
        Room_No,
        Check_In_Date
    ),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID),

    FOREIGN KEY (Hostel_ID, Room_No)
        REFERENCES ROOM(Hostel_ID, Room_No)
);
CREATE TABLE DOCTOR (
    Doctor_ID INT PRIMARY KEY
);
CREATE TABLE MEDICINE (
    Medicine_ID INT PRIMARY KEY
);
CREATE TABLE VISIT (
    Patient_ID INT,
    Doctor_ID INT,
    Visit_Date DATE,
    Diagnosis VARCHAR(250),
    Prescription VARCHAR(500),

    PRIMARY KEY (
        Patient_ID,
        Doctor_ID,
        Visit_Date
    ),

    FOREIGN KEY (Patient_ID)
        REFERENCES PERSON(Person_ID),

    FOREIGN KEY (Doctor_ID)
        REFERENCES DOCTOR(Doctor_ID)
);
CREATE TABLE PRESCRIPTION_ITEM (
    Patient_ID INT,
    Doctor_ID INT,
    Visit_Date DATE,
    Medicine_ID INT,
    Dosage VARCHAR(100),

    PRIMARY KEY (
        Patient_ID,
        Doctor_ID,
        Visit_Date,
        Medicine_ID
    ),

    FOREIGN KEY (
        Patient_ID,
        Doctor_ID,
        Visit_Date
    )
        REFERENCES VISIT(
            Patient_ID,
            Doctor_ID,
            Visit_Date
        ),

    FOREIGN KEY (Medicine_ID)
        REFERENCES MEDICINE(Medicine_ID)
);
CREATE TABLE DRIVER (
    Driver_ID INT PRIMARY KEY
);
CREATE TABLE BUS (
    Bus_ID INT PRIMARY KEY,
    Route_No VARCHAR(20),
    Seating_Capacity INT
);
CREATE TABLE BUS_ASSIGNMENT (
    Driver_ID INT,
    Bus_ID INT,
    Assignment_Date DATE,
    Shift VARCHAR(30),

    PRIMARY KEY (
        Driver_ID,
        Bus_ID,
        Assignment_Date,
        Shift
    ),

    FOREIGN KEY (Driver_ID)
        REFERENCES DRIVER(Driver_ID),

    FOREIGN KEY (Bus_ID)
        REFERENCES BUS(Bus_ID)
);
CREATE TABLE BUS_SUBSCRIPTION (
    Student_ID INT,
    Bus_ID INT,
    Subscription_Date DATE,
    Fee_Paid DECIMAL(10,2),

    PRIMARY KEY (Student_ID, Bus_ID),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID),

    FOREIGN KEY (Bus_ID)
        REFERENCES BUS(Bus_ID)
);
CREATE TABLE CLUB (
    Club_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Faculty_Advisor_ID INT,

    FOREIGN KEY (Faculty_Advisor_ID)
        REFERENCES FACULTY(Person_ID)
);

CREATE TABLE CLUB_MEMBERSHIP (
    Student_ID INT,
    Club_ID INT,
    Joining_Date DATE,
    Position VARCHAR(30),
    Duration VARCHAR(50),

    PRIMARY KEY (Student_ID, Club_ID),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID),

    FOREIGN KEY (Club_ID)
        REFERENCES CLUB(Club_ID)
);
CREATE TABLE MODULE (
    Module_ID INT PRIMARY KEY,
    Course_ID INT,

    FOREIGN KEY (Course_ID)
        REFERENCES COURSE(Course_ID)
);
CREATE TABLE VIDEO (
    Video_ID INT PRIMARY KEY,
    Module_ID INT,

    FOREIGN KEY (Module_ID)
        REFERENCES MODULE(Module_ID)
);
CREATE TABLE ASSIGNMENT (
    Assignment_ID INT PRIMARY KEY,
    Module_ID INT,

    FOREIGN KEY (Module_ID)
        REFERENCES MODULE(Module_ID)
);
CREATE TABLE QUIZ (
    Quiz_ID INT PRIMARY KEY,
    Module_ID INT,

    FOREIGN KEY (Module_ID)
        REFERENCES MODULE(Module_ID)
);
CREATE TABLE QUIZ_QUESTION (
    Quiz_ID INT,
    Question_No INT,

    PRIMARY KEY (Quiz_ID, Question_No),

    FOREIGN KEY (Quiz_ID)
        REFERENCES QUIZ(Quiz_ID)
);
CREATE TABLE ASSIGNMENT_SUBMISSION (
    Assignment_ID INT,
    Submission_No INT,
    Student_ID INT,
    Submission_Time DATETIME,
    Marks DECIMAL(5,2),
    Feedback VARCHAR(500),

    PRIMARY KEY (
        Assignment_ID,
        Submission_No
    ),

    FOREIGN KEY (Assignment_ID)
        REFERENCES ASSIGNMENT(Assignment_ID),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID)
);
CREATE TABLE MENTORING (
    Mentor_ID INT,
    Mentee_ID INT,
    Start_Date DATE,

    PRIMARY KEY (Mentor_ID, Mentee_ID),

    FOREIGN KEY (Mentor_ID)
        REFERENCES FACULTY(Person_ID),

    FOREIGN KEY (Mentee_ID)
        REFERENCES FACULTY(Person_ID)
);
CREATE TABLE SUPERVISION (
    Faculty_ID INT,
    Student_ID INT,
    Research_Area VARCHAR(200),

    PRIMARY KEY (Faculty_ID, Student_ID),

    FOREIGN KEY (Faculty_ID)
        REFERENCES FACULTY(Person_ID),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID)
);
CREATE TABLE FACULTY_PHONE (
    Faculty_ID INT,
    Phone_Number VARCHAR(15),

    PRIMARY KEY (Faculty_ID, Phone_Number),

    FOREIGN KEY (Faculty_ID)
        REFERENCES FACULTY(Person_ID)
);
CREATE TABLE FACULTY_RESEARCH_INTEREST (
    Faculty_ID INT,
    Research_Interest VARCHAR(150),

    PRIMARY KEY (Faculty_ID, Research_Interest),

    FOREIGN KEY (Faculty_ID)
        REFERENCES FACULTY(Person_ID)
);
CREATE TABLE STUDENT_SKILL (
    Student_ID INT,
    Skill VARCHAR(100),

    PRIMARY KEY (Student_ID, Skill),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID)
);
CREATE TABLE STUDENT_CERTIFICATION (
    Student_ID INT,
    Certification VARCHAR(150),

    PRIMARY KEY (Student_ID, Certification),

    FOREIGN KEY (Student_ID)
        REFERENCES STUDENT(Person_ID)
);