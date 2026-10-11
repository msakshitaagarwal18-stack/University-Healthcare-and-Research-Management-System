-- ============================================================================
-- UNIVERSITY HEALTHCARE AND RESEARCH MANAGEMENT SYSTEM (VIT)
-- QUESTION 4: APJ ABDUL KALAM AWARD RECOGNITION QUERY
-- ============================================================================
-- Business Logic:
-- Retrieves students who:
-- 1. Are actively engaged in university research projects (Project_Participant)
-- 2. Have authored scholarly research publications (Publication_Author)
-- 3. Scored an outstanding 'S' grade in course evaluations (Enrollment)
-- ============================================================================

USE university_management;

SELECT
    'APJ Abdul Kalam Award - Eligible Students' AS `Award Title`,
    CONCAT_WS(' ', sp.First_Name, sp.Middle_Name, sp.Last_Name)
        AS `Student Name`,
    s.Roll_No AS `RegNo`,
    c.Title AS `Course Name`,
    c.Course_ID AS `Course Code`,
    cs.Faculty_ID AS `Course Faculty ID`,
    CONCAT_WS(' ', fp.First_Name, fp.Middle_Name, fp.Last_Name)
        AS `Course Faculty Name`,
    CONCAT_WS(' ', hp.First_Name, hp.Middle_Name, hp.Last_Name)
        AS `HoD Name`,
    e.Grade AS `Course Grade`,
    pr.Title AS `Research Work`,
    pub.Title AS `Research Work Publication`
FROM STUDENT s
JOIN PERSON sp
    ON sp.Person_ID = s.Person_ID
JOIN ENROLLMENT e
    ON e.Student_ID = s.Person_ID
JOIN COURSE_SECTION cs
    ON cs.Course_ID = e.Course_ID
   AND cs.Semester = e.Semester
   AND cs.Academic_Year = e.Academic_Year
   AND cs.Section_No = e.Section_No
JOIN COURSE c
    ON c.Course_ID = cs.Course_ID
JOIN FACULTY cf
    ON cf.Person_ID = cs.Faculty_ID
JOIN PERSON fp
    ON fp.Person_ID = cf.Person_ID
JOIN DEPARTMENT d
    ON d.Dept_ID = cf.Dept_ID
JOIN FACULTY hf
    ON hf.Person_ID = d.HOD_Faculty_ID
JOIN PERSON hp
    ON hp.Person_ID = hf.Person_ID
JOIN PROJECT_PARTICIPATION pp
    ON pp.Person_ID = s.Person_ID
JOIN PROJECT pr
    ON pr.Project_ID = pp.Project_ID
LEFT JOIN PUBLICATION pub
    ON pub.Project_ID = pr.Project_ID
WHERE e.Grade = 'S'
ORDER BY s.Roll_No, c.Course_ID, pr.Project_ID;