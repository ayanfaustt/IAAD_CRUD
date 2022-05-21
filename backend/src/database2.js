import mysql from 'mysql2';


const connection =  mysql.createConnection({
   host: 'localhost',
   user: 'root',
   database: 'startups',
   password: '84R06r20-'
});



export default connection;