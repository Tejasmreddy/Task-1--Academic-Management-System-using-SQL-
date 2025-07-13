1.Database Creation:
a)Create the StudentInfo table with columns STU_ ID, STU_NAME, DOB, PHONE_NO,
EMAIL_ID,ADDRESS.
b)Create the CoursesInfo table with columns COURSE_ID,
COURSE_NAME,COURSE_INSTRUCTOR NAME.
c)Create the EnrollmentInfo with columns ENROLLMENT_ID, STU_ ID, COURSE_ID,
ENROLL_STATUS(Enrolled/Not Enrolled). The FOREIGN KEY constraint in the EnrollmentInfo
table references the STU_ID column in the StudentInfo table and the COURSE_ID column in the
CoursesInfo table.

2.Data Creation:
Insert some sample data for StudentInfo table , CoursesInfo table, EnrollmentInfo with
respective fields.

3) Retrieve the Student Information
a) Write a query to retrieve student details, such as student name, contact informations, and
Enrollment status.
b) Write a query to retrieve a list of courses in which a specific student is enrolled.
c) Write a query to retrieve course information, including course name, instructor information.
d) Write a query to retrieve course information for a specific course .
e) Write a query to retrieve course information for multiple courses.
f) Test the queries to ensure accurate retrieval of student information.( execute the queries and
verify the results against the expected output.)

4. Reporting and Analytics (Using joining queries)
a) Write a query to retrieve the number of students enrolled in each course
b) Write a query to retrieve the list of students enrolled in a specific course
c) Write a query to retrieve the count of enrolled students for each instructor.
d) Write a query to retrieve the list of students who are enrolled in multiple courses
e) Write a query to retrieve the courses that have the highest number of enrolled
students(arranging from highest to lowest)
