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


