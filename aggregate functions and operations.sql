CREATE CATALOG IF NOT EXISTS brightlearn;
CREATE SCHEMA IF NOT EXISTS brightlearn.intelligence;

--Exercise 2 (Students Table)
CREATE TABLE IF NOT EXISTS brightlearn.intelligence.students
(student_id INT, student_name STRING, age INT, department STRING);

INSERT INTO brightlearn.intelligence.students VALUES
(1, 'Alice', 20, 'IT'),
(2, 'Bob', 22, 'HR'),
(3, 'Charlie', 21, 'IT'),
(4, 'Diana', 23, 'Finance'),
(5, 'Eve', 22, 'HR');

SELECT * FROM brightlearn.intelligence.students;

DROP TABLE IF EXISTS brightlearn.intelligence.students;
DROP SCHEMA IF EXISTS brightlearn.intelligence;


CREATE SCHEMA IF NOT EXISTS brightlearn.intelligence;
CREATE TABLE IF NOT EXISTS brightlearn.intelligence.students
(student_id INT, student_name STRING, age INT, department STRING);

INSERT INTO brightlearn.intelligence.students VALUES
(1, 'Alice', 20, 'IT'),
(2, 'Bob', 22, 'HR'),
(3, 'Charlie', 21, 'IT'),
(4, 'Diana', 23, 'Finance'),
(5, 'Eve', 22, 'HR');

SELECT * FROM brightlearn.intelligence.students;

--Question 1: List all distinct departments in the students table

SELECT DISTINCT department 
FROM brightlearn.intelligence.students;

--Question 2: Get the average age of students per department:

SELECT department, AVG (age) AS student_age
FROM brightlearn.intelligence.students
GROUP BY department;

--Question 3: Show departments with more than 1 student:

SELECT department, COUNT(*) AS num_students
FROM brightlearn.intelligence.students
GROUP BY department
HAVING num_students > 1;

--Question 4: Get all studens whose age is between 21 and 23:

SELECT student_id,
       student_name,
       age,
       department
FROM brightlearn.intelligence.students
WHERE age BETWEEN 21 AND 23; 

--Question 5: List all students in the IT or HR department who are older than 21:
SELECT student_id,
       student_name,
       age,
       department
FROM brightlearn.intelligence.students
WHERE (department = 'IT' OR department = 'HR') AND age > 21;


--Exercise 2 (Courses Table)

CREATE TABLE IF NOT EXISTS brightlearn.intelligence.courses
(course_id INT, course_name STRING, department STRING, credits INT);

INSERT INTO brightlearn.intelligence.courses VALUES
(101, 'SQL Basics', 'IT', 3),
(102, 'Python', 'IT', 4),
(103, 'Data Science', 'IT', 4),
(104, 'Excel', 'Finance', 2),
(105, 'Statistics', 'HR', 3);

SELECT * FROM brightlearn.intelligence.courses;

--Question 6: Show total credits per department, only for departments with more than 5 total credits
SELECT SUM(credits) AS total_credits
FROM brightlearn.intelligence.courses
GROUP BY department
HAVING total_credits > 5;

--Question 7: List all courses that do not have 4 credits
SELECT course_id,
       course_name,
       department,
       credits
FROM brightlearn.intelligence.courses
WHERE NOT credits = 4;

--Question 8: Show the top 3 courses by credits in descending order:
SELECT course_id,
       course_name,
       credits
FROM brightlearn.intelligence.courses
ORDER BY credits DESC
LIMIT 3;

--Exercise 2 (Enrollments table)

CREATE TABLE IF NOT EXISTS brightlearn.intelligence.enrollments
(enrollment_id INT, student_id INT, course_id INT, grade INT);

INSERT INTO brightlearn.intelligence.enrollments VALUES
(1, 1 , 101, 85),
(2, 2 , 102 , 78),
(3, 3 , 103 , 90),
(4, 4 , 104 , 88 ),
(5, 5 , 105, 82 );

SELECT * FROM brightlearn.intelligence.enrollments;


--Question 9: Get the maximum, minimum and average grade across all enrollments
SELECT MAX (grade) AS max_grade,
       MIN (grade) AS min_grade,
       AVG (grade) AS avg_grade
FROM brightlearn.intelligence.enrollments;


--Question 10: Count how many enrollments exist per course
SELECT course_id,
       COUNT (*) AS num_enrollments
FROM brightlearn.intelligence.enrollments
GROUP BY course_id;

--Exercise 2 (Salaries table)

CREATE TABLE IF NOT EXISTS brightlearn.intelligence.salaries
(employee_id INT, employee_name STRING, department STRING, salary INT, bonus INT);

INSERT INTO brightlearn.intelligence.salaries VALUES
(1, 'Tom', 'IT', 60000, 5000),
(2, 'Jerry' , 'HR', 55000, 4000),
(3, 'Spike', 'Finance' , 70000, 6000),
(4, 'Tyke', 'IT', 62000, 5500),
(5, 'Butch', 'HR', 54000, 3500);

SELECT * FROM brightlearn.intelligence.salaries;


--Question 11: Find total salary and total bonus per department
SELECT department,
SUM (salary) AS total_salary,
SUM (bonus) AS total_bonus
FROM brightlearn.intelligence.salaries
GROUP BY department;

--Question 12: Show departments where average salary is above 55000

SELECT department,
AVG (salary) AS avg_salary
FROM brightlearn.intelligence.salaries
GROUP BY department
HAVING avg_salary > 55000;


--Question 13: List employees whose salary plus bonus is greater than 60000
SELECT employee_id,
       employee_name, 
       salary,
       bonus,
       salary + bonus AS total_compensation
FROM brightlearn.intelligence.salaries
WHERE salary + bonus > 60000;

--Exercise 2 (Projects table)

CREATE TABLE IF NOT EXISTS brightlearn.intelligence.projects
(project_id INT, project_name STRING, department STRING, budget INT);

INSERT INTO brightlearn.intelligence.projects VALUES
(1, 'AI App', 'IT', 120000),
(2, 'Payroll System' , 'Finance', 80000),
(3, 'Dashboard', 'IT' , 150000),
(4, 'Website', 'Marketing', 60000),
(5, 'HR Portal', 'HR', 50000);

SELECT * FROM brightlearn.intelligence.projects;

--Question 14: Show total and average budget per department. Only include departments with avergae budget above 70000
SELECT department,
SUM (budget) AS total_budget,
AVG (budget) AS avg_budget
FROM brightlearn.intelligence.projects
GROUP BY department
HAVING avg_budget > 70000;


--Question 15: List all projects with budgets between 50000 and 120000 excluding the Marketing department

SELECT project_id,
       project_name,
       department,
       budget
FROM brightlearn.intelligence.projects
WHERE budget BETWEEN 50000 AND 120000 AND department != 'Marketing';
