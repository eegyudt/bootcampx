-- Get currently enrolled students' average assignment completion time.
-- Select the students name and average time from assignment submissions.
-- Order the results from greatest duration to least greatest duration.

SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration 
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;


-- COMPASS solution:

-- SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE end_date IS NULL
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;
