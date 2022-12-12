SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;

-- This only includes items where cohort_id is not null
-- Only students that have a cohort_id and only cohorts that have students.