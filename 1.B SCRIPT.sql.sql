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


