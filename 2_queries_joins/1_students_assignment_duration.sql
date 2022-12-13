-- Get the total amount of time that a student has spent on all assignments.
SELECT SUM(duration) as total_duration 
FROM assignment_submissions 
JOIN students on student_id = students.id
WHERE students.id = 186;