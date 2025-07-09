-- e) Write a query to retrieve course information for multiple courses.

SELECT * 
FROM coursesinfo
WHERE COURSE_ID IN ( 101, 102)  -- Change ID as needed
