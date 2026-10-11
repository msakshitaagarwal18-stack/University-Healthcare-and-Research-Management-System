-- ============================================================================
-- UNIVERSITY HEALTHCARE AND RESEARCH MANAGEMENT SYSTEM (VIT)
-- DATA INSERTION SCRIPT (DML)
-- ============================================================================

USE university_management;

INSERT INTO PERSON
(Person_ID, First_Name, Middle_Name, Last_Name, Date_of_Birth, Gender, Phone, Email,
 Door_No, Street, City, State, Country, Postal_Code)
VALUES(1001, 'Aarav', NULL, 'Sharma', '2004-05-12', 'Male', '9876543210', 'aarav.sharma@vitstudent.ac.in',
 '12', 'Green Park', 'New Delhi', 'Delhi', 'India', '110016'),
(1002, 'Ananya', 'R', 'Iyer', '2004-08-21', 'Female', '9876543211', 'ananya.iyer@vitstudent.ac.in',
 '24', 'Indiranagar', 'Bengaluru', 'Karnataka', 'India', '560038'),
(1003, 'Rohan', NULL, 'Mehta', '2003-11-03', 'Male', '9876543212', 'rohan.mehta@vitstudent.ac.in',
 '8', 'Andheri Road', 'Mumbai', 'Maharashtra', 'India', '400058'),
(1004, 'Diya', 'S', 'Nair', '2005-02-17', 'Female', '9876543213', 'diya.nair@vitstudent.ac.in',
 '31', 'MG Road', 'Kochi', 'Kerala', 'India', '682016'),
(1005, 'Karthik', NULL, 'Reddy', '2004-12-10', 'Male', '9876543214', 'karthik.reddy@vitstudent.ac.in',
 '16', 'Banjara Hills', 'Hyderabad', 'Telangana', 'India', '500034'),
(1006, 'Meera', 'P', 'Krishnan', '2005-06-25', 'Female', '9876543215', 'meera.krishnan@vitstudent.ac.in',
 '45', 'Salt Lake', 'Kolkata', 'West Bengal', 'India', '700091'),
(2001, 'Rajesh', 'Kumar', 'Verma', '1978-04-14', 'Male', '9000001001', 'rajesh.verma@vit.ac.in',
 '101', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', 'India', '226001'),
(2002, 'Priya', 'S', 'Menon', '1982-09-08', 'Female', '9000001002', 'priya.menon@vit.ac.in',
 '102', 'Vazhuthacaud', 'Thiruvananthapuram', 'Kerala', 'India', '695014'),
(2003, 'Arvind', NULL, 'Krishnan', '1975-12-19', 'Male', '9000001003', 'arvind.krishnan@vit.ac.in',
 '103', 'MVP Colony', 'Visakhapatnam', 'Andhra Pradesh', 'India', '530017'),
(3001, 'Suresh', NULL, 'Kumar', '1985-03-22', 'Male', '9000001004', 'suresh.kumar@vit.ac.in',
 '15', 'Malviya Nagar', 'Jaipur', 'Rajasthan', 'India', '302017');
 
INSERT INTO DEPARTMENT(Dept_ID, Name, Building, Budget, HOD_Faculty_ID)
VALUES(101, 'Computer Science and Engineering', 'PRP', 50000000.00, NULL),
(102, 'Information Technology', 'SJT', 35000000.00, NULL),
(103, 'Electronics and Communication Engineering', 'TT', 45000000.00, NULL);

INSERT INTO STUDENT(Person_ID, Roll_No, Program, Semester, CGPA)
VALUES(1001, '24BDS0125', 'B.Tech Computer Science and Engineering (Data Science)', 5, 8.75),
(1002, '24BDS0130', 'B.Tech Computer Science and Engineering (Data Science)', 5, 9.12),
(1003, '24BCE0187', 'B.Tech Computer Science and Engineering Core', 5, 8.60),
(1004, '24BCT0201', 'B.Tech Computer Science and Engineering (Internet of Things)', 5, 9.35),
(1005, '24BAI0215', 'B.Tech Computer Science and Engineering (AI & ML)', 5, 8.45),
(1006, '24BCI0098', 'B.Tech Computer Science and Engineering (Data Science)', 5, 9.05);

INSERT INTO FACULTY(Person_ID, Employee_ID, Designation, Salary, Joining_Date, Dept_ID)
VALUES(2001, 'EMP1001', 'Professor', 150000.00, '2022-06-15', 101),
(2002, 'EMP1002', 'Associate Professor', 125000.00, '2018-07-10', 102),
(2003, 'EMP1003', 'Professor', 145000.00, '2015-01-20', 103);

UPDATE DEPARTMENT
SET HOD_Faculty_ID = 2001
WHERE Dept_ID = 101;
UPDATE DEPARTMENT
SET HOD_Faculty_ID = 2002
WHERE Dept_ID = 102;
UPDATE DEPARTMENT
SET HOD_Faculty_ID = 2003
WHERE Dept_ID = 103;
 
INSERT INTO STAFF(Person_ID, Shift, Dept_ID)
VALUES(3001, 'Morning', 101);

INSERT INTO VISITING_SCHOLAR(Person_ID, Home_University, Country, Visit_Duration)
VALUES(1006, 'Indian Institute of Science', 'India', '6 Months');

INSERT INTO COURSE(Course_ID, Title, Credits)
VALUES(501, 'Database Systems', 4),
(502, 'Compiler Design', 4),
(503, 'Computer Networks', 3),
(504, 'Operating Systems', 4),
(505, 'Artificial Intelligence', 3);

INSERT INTO COURSE_SECTION(Course_ID, Semester, Academic_Year, Section_No, Faculty_ID)
VALUES(501, 'Fall', '2026-27', 'A', 2001),
(502, 'Fall', '2026-27', 'A', 2002),
(503, 'Fall', '2026-27', 'A', 2003),
(504, 'Fall', '2026-27', 'A', 2001),
(505, 'Fall', '2026-27', 'A', 2002);

INSERT INTO ENROLLMENT(Student_ID, Course_ID, Semester, Academic_Year, Section_No,
Enrollment_Date, Grade, Attendance_Pct)
VALUES(1001, 501, 'Fall', '2026-27', 'A', '2026-07-06', 'S', 96.00),
(1002, 501, 'Fall', '2026-27', 'A', '2026-07-06', 'A', 91.00),
(1003, 502, 'Fall', '2026-27', 'A', '2026-07-06', 'S', 94.00),
(1004, 502, 'Fall', '2026-27', 'A', '2026-07-06', 'A', 97.00),
(1005, 503, 'Fall', '2026-27', 'A', '2026-07-06', 'B', 88.00),
(1006, 504, 'Fall', '2026-27', 'A', '2026-07-06', 'S', 95.00),
(1001, 505, 'Fall', '2026-27', 'A', '2026-07-06', 'A', 93.00);

INSERT INTO PROJECT(Project_ID, Title, Budget, Start_Date, End_Date)
VALUES(701, 'AI Based Network Intrusion Detection', 800000.00, '2025-07-01', '2027-06-30'),
(702, 'Smart Healthcare Analytics', 650000.00, '2025-08-01', '2027-07-31'),
(703, 'Intelligent Transportation System', 500000.00, '2026-01-15', '2027-12-31');

INSERT INTO PROJECT_PARTICIPATION(Person_ID, Project_ID, Role, Joining_Date, Contribution_Pct)
VALUES(2001, 701, 'Principal Investigator', '2025-07-01', 40.00),
(1001, 701, 'Student Researcher', '2025-08-01', 20.00),
(1003, 701, 'Student Researcher', '2025-08-15', 20.00),
(1006, 701, 'Research Assistant', '2025-09-01', 20.00),
(2002, 702, 'Principal Investigator', '2025-08-01', 50.00),
(1004, 702, 'Student Researcher', '2025-09-01', 25.00),
(2003, 703, 'Principal Investigator', '2026-01-15', 50.00);

INSERT INTO PUBLICATION(DOI, Title, Publication_Date, Venue_Details, Project_ID)
VALUES('10.1000/ids001','Machine Learning Based Network Intrusion Detection',
'2026-02-15','International Conference on Cyber Security',701),
('10.1000/health002','Healthcare Analytics Using Machine Learning',
 '2026-04-20','International Journal of Healthcare Technology',702),
('10.1000/trans003','Intelligent Transportation Analytics',
 '2026-06-10','Smart Systems Research Conference',703);
 
INSERT INTO AUTHORSHIP(Person_ID, DOI, Author_Order)
VALUES(2001, '10.1000/ids001', 1),
(1001, '10.1000/ids001', 2),
(1003, '10.1000/ids001', 3),
(1006, '10.1000/ids001', 4),
(2002, '10.1000/health002', 1),
(1004, '10.1000/health002', 2),
(2003, '10.1000/trans003', 1);

INSERT INTO BOOK(ISBN, Title, Edition, Publisher)
VALUES('9780133970777', 'Database System Concepts', '7th', 'McGraw Hill'),
('9780133594140', 'Computer Networking', '6th', 'Pearson'),
('9780262046305', 'Artificial Intelligence', '4th', 'MIT Press'),
('9780262033848', 'Compiler Design', '4th', 'MIT Press');

INSERT INTO BOOK_COPY(ISBN, Copy_No, Rack_Location, Status)
VALUES('9780133970777', 1, 'R1-A01', 'Available'),
('9780133970777', 2, 'R1-A02', 'Issued'),
('9780133594140', 1, 'R2-B01', 'Available'),
('9780262046305', 1, 'R3-C01', 'Issued'),
('9780262033848', 1, 'R4-D01', 'Available');

INSERT INTO BORROWING(Person_ID, ISBN, Copy_No, Issue_Date, Due_Date, Return_Date, Fine_Amount)
VALUES(1001, '9780133970777', 2, '2026-08-01', '2026-08-15', NULL, 0.00),
(1002, '9780133594140', 1, '2026-08-05', '2026-08-19', '2026-08-18', 0.00),
(2001, '9780262046305', 1, '2026-08-10', '2026-08-24', NULL, 0.00),
(1003, '9780133970777', 1, '2026-07-01', '2026-07-15', '2026-07-18', 30.00);

INSERT INTO HOSTEL(Hostel_ID, Name, Hostel_Type)
VALUES(801, 'Swami Vivekanand Block', "Men's Hostel"),
(802, 'Marie Curie Block', "Ladies's Hostel"),
(803, 'Subhas Chandra Bose Block',"Men's Hostel");

INSERT INTO ROOM(Hostel_ID, Room_No, Capacity)
VALUES(801, '101', 6),
(801, '102', 2),
(802, '201', 4),
(802, '202', 2),
(803, '301', 3);

INSERT INTO ROOM_ALLOCATION(Student_ID, Hostel_ID, Room_No, Check_In_Date, Check_Out_Date)
VALUES(1001, 801, '101', '2026-07-05', NULL),
(1003, 801, '102', '2026-07-05', NULL),
(1005, 803, '301', '2026-07-05', NULL),
(1002, 802, '201', '2026-07-05', NULL),
(1004, 802, '202', '2026-07-05', NULL);

INSERT INTO DOCTOR(Doctor_ID)
VALUES(901),(902),(903);

INSERT INTO MEDICINE(Medicine_ID)
VALUES(10001),(10002),(10003),(10004);

INSERT INTO VISIT(Patient_ID, Doctor_ID, Visit_Date, Diagnosis, Prescription)
VALUES(1001, 901, '2026-08-05', 'Fever', 'Paracetamol'),
(1002, 902, '2026-08-07', 'Cold and Cough', 'Cough medication'),
(1003, 901, '2026-08-10', 'Headache', 'Pain relief medication'),
(2001, 903, '2026-08-12', 'Back Pain', 'Pain relief medication');

INSERT INTO PRESCRIPTION_ITEM(Patient_ID, Doctor_ID, Visit_Date, Medicine_ID, Dosage)
VALUES(1001, 901, '2026-08-05', 10001, '500 mg twice daily'),
(1002, 902, '2026-08-07', 10002, '10 ml twice daily'),
(1003, 901, '2026-08-10', 10003, '500 mg once daily'),
(2001, 903, '2026-08-12', 10004, '1 tablet after food');

INSERT INTO DRIVER(Driver_ID)
VALUES(1101),(1102),(1103);

INSERT INTO BUS(Bus_ID, Route_No, Seating_Capacity)
VALUES(1201, 'VLR-01', 50),(1202, 'VLR-02', 45),(1203, 'VLR-03', 50);

INSERT INTO BUS_ASSIGNMENT(Driver_ID, Bus_ID, Assignment_Date, Shift)
VALUES(1101, 1201, '2026-08-01', 'Morning'),(1102, 1202, '2026-08-01', 'Morning'),
(1103, 1203, '2026-08-01', 'Evening');

INSERT INTO BUS_SUBSCRIPTION(Student_ID, Bus_ID, Subscription_Date, Fee_Paid)
VALUES(1001, 1201, '2026-07-10', 5000.00),
(1002, 1202, '2026-07-10', 5000.00),
(1003, 1201, '2026-07-10', 5000.00),
(1004, 1203, '2026-07-10', 5000.00),
(1005, 1202, '2026-07-10', 5000.00);

INSERT INTO CLUB(Club_ID, Name, Faculty_Advisor_ID)
VALUES(1301, 'IEEE Student Branch & Societies', 2001),
(1302, 'Rotor FPV Club', 2003),
(1303, 'SAE VIT Club', 2001),
(1304, 'AI and Robotics Club', 2002);

INSERT INTO CLUB_MEMBERSHIP(Student_ID, Club_ID, Joining_Date, Position, Duration)
VALUES(1001, 1301, '2025-08-01', 'Member', '2 Years'),
(1001, 1304, '2025-08-05', 'Secretary', '2 Years'),
(1002, 1302, '2025-08-03', 'President', '2 Years'),
(1003, 1303, '2025-08-10', 'Member', '2 Years'),
(1004, 1302, '2025-08-04', 'Member', '2 Years'),
(1005, 1301, '2025-08-02', 'Member', '2 Years'),
(1006, 1304, '2025-08-06', 'Technical Lead', '2 Years');

INSERT INTO MODULE(Module_ID, Course_ID)
VALUES(1401, 501),(1402, 501),(1403, 502),
(1404, 503),(1405, 504);

INSERT INTO VIDEO(Video_ID, Module_ID)
VALUES(1501, 1401),(1502, 1401),(1503, 1402),
(1504, 1403),(1505, 1404);

INSERT INTO ASSIGNMENT(Assignment_ID, Module_ID)
VALUES(1601, 1401),(1602, 1402),(1603, 1403),
(1604, 1404),(1605, 1405);

INSERT INTO QUIZ(Quiz_ID, Module_ID)
VALUES(1701, 1401),(1702, 1402),(1703, 1403),(1704, 1404);

INSERT INTO QUIZ_QUESTION(Quiz_ID, Question_No)
VALUES(1701, 1),(1701, 2),(1701, 3),(1702, 1),
(1702, 2),(1703, 1),(1703, 2),(1704, 1);

INSERT INTO ASSIGNMENT_SUBMISSION
(Assignment_ID, Submission_No, Student_ID, Submission_Time, Marks, Feedback)
VALUES(1601, 1, 1001, '2026-08-10 10:30:00', 92.00, 'Excellent work'),
(1601, 2, 1002, '2026-08-10 11:00:00', 88.00, 'Good analysis'),
(1602, 1, 1003, '2026-08-12 14:00:00', 90.00, 'Well structured'),
(1603, 1, 1004, '2026-08-15 16:30:00', 95.00, 'Excellent implementation'),
(1604, 1, 1005, '2026-08-17 12:00:00', 84.00, 'Good attempt'),
(1605, 1, 1006, '2026-08-20 15:00:00', 91.00, 'Very good work');

INSERT INTO MENTORING(Mentor_ID, Mentee_ID, Start_Date)
VALUES(2001, 2002, '2024-07-08'),(2001, 2003, '2024-07-08'),
(2002, 2003, '2025-07-08');

INSERT INTO SUPERVISION(Faculty_ID, Student_ID, Research_Area)
VALUES(2001, 1001, 'Network Security and Intrusion Detection'),
(2001, 1003, 'Machine Learning for Cyber Security'),
(2002, 1004, 'Healthcare Data Analytics'),
(2003, 1006, 'Intelligent Transportation Systems');

INSERT INTO FACULTY_PHONE(Faculty_ID, Phone_Number)
VALUES(2001, '9000001001'),(2001, '9000001101'),
(2002, '9000001002'),(2002, '9000001102'),
(2003, '9000001003'),(2003, '9000001103');

INSERT INTO FACULTY_RESEARCH_INTEREST(Faculty_ID, Research_Interest)
VALUES(2001, 'Network Security'),(2001, 'Machine Learning'),
(2002, 'Artificial Intelligence'),(2002, 'Healthcare Analytics'),
(2003, 'Intelligent Transportation'),(2003, 'Computer Networks');

INSERT INTO STUDENT_SKILL(Student_ID, Skill)
VALUES(1001, 'Python'),(1001, 'SQL'),(1002, 'Machine Learning'),
(1002, 'Python'),(1003, 'Java'),(1003, 'Cyber Security'),
(1004, 'Data Analytics'),(1004, 'Python'),
(1005, 'C++'),(1006, 'Artificial Intelligence');

INSERT INTO STUDENT_CERTIFICATION(Student_ID, Certification)
VALUES(1001, 'Oracle Database SQL Certified'),
(1002, 'Microsoft Azure AI Fundamentals'),
(1003, 'Cisco Cybersecurity Essentials'),
(1004, 'IBM Data Science Certificate'),
(1005, 'AWS Cloud Practitioner'),
(1006, 'Google Data Analytics Certificate');