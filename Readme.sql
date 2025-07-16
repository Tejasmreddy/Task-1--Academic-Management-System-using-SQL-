-- Task1 Project Title: Academic Management System (using MySQL)
-- Project Description:Design and develop an Academic Management System using SQL. The projects should involve three tables 1.StudentInfo 2. CoursesInfo 3.EnrollmentInfo. The Aim is to create a system that allows for managing student information and course enrollment. The project will include thefollowing tasks:

--1.Database Creation:

CREATE SCHEMA Academic_Management_System;
use  Academic_Management_System;

CREATE TABLE StudentInfo (
STU_ID INT PRIMARY KEY, 
STU_NAME VARCHAR(50),
DOB DATE,
PHONE_NO VARCHAR (50),
EMAIL_ID VARCHAR (50),
ADDRESS VARCHAR (50) );

CREATE TABLE CoursesInfo (
COURSE_ID INT PRIMARY KEY,
COURSE_NAME  VARCHAR(50),
COURSE_INSTRUCTOR_NAME VARCHAR(50) );

CREATE TABLE EnrollmentInfo(
ENROLLMENT_ID INT PRIMARY KEY,
STU_ID INT, 
COURSE_ID INT,
ENROLL_STATUS VARCHAR(20) CHECK (ENROLL_STATUS IN ('ENROLLED' , 'NOTENROLLED')),
FOREIGN KEY (STU_ID) REFERENCES STUDENTINFO(STU_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSESINFO(COURSE_ID));

--2.Data Creation:


INSERT INTO StudentInfo ()VALUES 
(1, 'John', '2000-05-15', '9876543210', 'john@email.com', '123 Main St'),
(2, 'Jane ', '2001-08-20', '8765432109', 'jane@email.com', '456 Oak Ave'),
(3, 'Mike ', '1999-03-10', '7654321098', 'mike@email.com', '789 Pine Rd'),
(4, 'Sarah ', '2002-11-25', '6543210987', 'sarah@email.com', '321 Elm St');

INSERT INTO CoursesInfo () VALUES
(101, 'Database Management', 'Prof. Anderson'),
(102, 'Web Development', 'Prof. Brown'),
(103, 'Python Programming', 'Prof. Clark'),
(104, 'Data Structures', 'Prof. Davis');

INSERT INTO EnrollmentInfo VALUES
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),	
(3, 2, 101, 'Enrolled'),
(4, 2, 103, 'NotEnrolled'),
(5, 3, 102, 'Enrolled'),
(6, 4, 104, 'Enrolled');

-- 3) Retrieve the Student Information. 
-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

use  Academic_Management_System; 

SELECT S.STU_NAME, S.PHONE_NO, E.COURSE_ID, E.ENROLL_STATUS
FROM STUDENTINFO S 
JOIN enrollmentinfo E ON S.STU_ID=E.STU_ID



-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.

SELECT 
S.STU_ID,
S.STU_NAME,
C.COURSE_NAME,
E.ENROLLMENT_ID

FROM studentinfo S
JOIN enrollmentinfo E ON S.STU_ID=E.STU_ID
JOIN COURSESINFO C ON C.COURSE_ID=E.COURSE_ID

WHERE S.STU_ID = 1 -- Change ID as needed



-- c) Write a query to retrieve course information, including course name, instructor information.


SELECT *
FROM coursesinfo


-- d) Write a query to retrieve course information for a specific course.


SELECT * 
FROM coursesinfo
WHERE COURSE_ID = 101  -- Change ID as needed



-- e) Write a query to retrieve course information for multiple courses.


SELECT * 
FROM coursesinfo
WHERE COURSE_ID = 101  -- Change ID as needed




4. Reporting and Analytics (Using joining queries)
a) Write a query to retrieve the number of students enrolled in each course

SELECT c.course_name, c.course_id, COUNT(e.STU_ID) as enrolled_students
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_NAME,c.course_id



b) Write a query to retrieve the list of students enrolled in a specific course

Select s.stu_name, c.course_id, c.course_name, e.course_id
from studentinfo s
join enrollmentinfo e on s.stu_id=e.stu_id
join coursesinfo c on e.course_id=c.course_id
where c.course_id = 102 -- this ID can be changed as per requirement
and e.enroll_status = 'enrolled' 


c) Write a query to retrieve the count of enrolled students for each instructor.

SELECT c.COURSE_ID, 
       c.COURSE_INSTRUCTOR_NAME,
       c.course_name,
       COUNT(CASE WHEN e.ENROLL_STATUS = 'Enrolled' THEN 1 ELSE NULL END) as total_enrolled_students
FROM CoursesInfo c
LEFT JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_ID, c.COURSE_INSTRUCTOR_NAME;


d) Write a query to retrieve the list of students who are enrolled in multiple courses

SELECT s.STU_ID,
       s.STU_NAME,
       COUNT(e.COURSE_ID) as Enrollment_count
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
where enroll_status = 'enrolled'
GROUP BY s.STU_ID, s.STU_NAME
Having COUNT(e.COURSE_ID) > 1;


e) Write a query to retrieve the courses that have the highest number of enrolled
students(arranging from highest to lowest


SELECT 
    c.COURSE_ID,
    c.COURSE_NAME,
	sum(case 
          when e.enroll_status='enrolled' then 1
          else 0
          end) as total_enrollments
FROM CoursesInfo c
LEFT JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_ID, c.COURSE_NAME
ORDER BY total_enrollments DESC, c.COURSE_ID;

