const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});




const cohortsName = process.argv[2];

const val = [`%${cohortsName}%`];

const queryCommand = `
SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
FROM teachers
JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
JOIN students
ON students.id = assistance_requests.student_id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;

`;

pool.query(queryCommand, val)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  }).catch(err => console.error('query error', err.stack));






// const cohortName = process.argv[2];
// // Store all potentially malicious values in an array.
// const value = [`%${cohortName}%`];

// const queryString = `
// SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON student_id = students.id
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name = $1
// ORDER BY teacher;
// `;


// pool.query(queryString, value)
//   .then(res => {
//     res.rows.forEach(row => {
//       console.log(`${row.cohort}: ${row.teacher}`);
//     });
//   })
//   .catch(err => console.error('query error', err.stack));