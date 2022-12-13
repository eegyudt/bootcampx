-- Get the total number of assignment submissions for each cohort.
-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

SELECT cohorts.name AS cohort, count(assignment_submissions.*) AS total_submissions 
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;


-- Solution in compass:
-- SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;