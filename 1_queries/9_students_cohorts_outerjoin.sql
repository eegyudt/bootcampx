-- An OUTER JOIN will join the tables similarly to an INNER JOIN but will return all results for one of the tables, even when the join condition is not met. For any row where the condition was not met, a row is added with NULL data.

-- When we write a LEFT OUTER JOIN or a RIGHT OUTER JOIN, we can omit the word OUTER. In the rest of our examples, we will omit the OUTER keyword.
-- 1. FROM students LEFT JOIN cohorts ON cohorts.id = cohort_id;
-- We could also rewrite any RIGHT JOIN as a LEFT JOIN, just by changing the order of the tables. So the following two queries would produce identical results:
-- 2. FROM cohorts RIGHT JOIN students ON cohorts.id = cohort_id;

-- The first query will return all students because students is to the LEFT of the word JOIN.
-- The second query will return all of the cohorts because cohorts is to the RIGHT of the word JOIN.
-- The third query will return all rows from both tables, even when there is no match.

-- The LEFT OUTER JOIN will return all of the students, even ones without a cohort_id.
-- All students and only cohorts that have students. students in the table to the left of the word LEFT.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- The RIGHT OUTER JOIN will return all cohorts, even ones without any students enrolled.
-- Only students that have a cohort_id and all cohorts. cohorts is the table to the right of the word RIGHT.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- The FULL OUTER JOIN will return all cohorts and all students, even when there is no match.
-- All students and all cohorts.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;