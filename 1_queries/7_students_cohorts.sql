SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id;

-- Same as:
-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM cohorts JOIN students ON cohort_id = cohorts.id;

-- Same as: 
-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students JOIN cohorts ON cohorts.id = cohort_id;