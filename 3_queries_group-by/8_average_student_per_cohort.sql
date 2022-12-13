-- Calculate the average number of students that attend a cohort

-- SELECT count(students)
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;


-- SELECT avg(total_students) as average_students
-- FROM (
--   SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts
-- ) as totals_table;


SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students, cohorts.name as cohort_name
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
) as totals_table;