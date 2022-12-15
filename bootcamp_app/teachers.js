const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});


// SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests) as total_assistances
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON student_id = students.id
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${process.argv[2]}%'
// GROUP BY cohorts.name, teachers.name
// ORDER BY teacher;

// pool.query(`
// SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests) as total_assistances
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON student_id = students.id
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${process.argv[2]}%'
// GROUP BY cohorts.name, teachers.name
// ORDER BY teacher;
// `)
// .then(res => {
//   res.rows.forEach(console.log)
// }).catch(err => console.error('query error', err.stack));
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});