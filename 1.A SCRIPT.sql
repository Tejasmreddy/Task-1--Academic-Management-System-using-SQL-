-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.
use  Academic_Management_System; 
SELECT S.STU_NAME, S.PHONE_NO, E.COURSE_ID, E.ENROLL_STATUS
FROM STUDENTINFO S 
JOIN enrollmentinfo E ON S.STU_ID=E.STU_ID
