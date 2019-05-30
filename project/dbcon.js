var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_patsonm',
  password        : '9171',
  database        : 'cs340_patsonm'
});

module.exports.pool = pool;
