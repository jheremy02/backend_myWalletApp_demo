const { createPool } = require('mysql2/promise')
const { DB_DATABASE, DB_HOST, DB_PASSWORD, DB_PORT, DB_USER } = require('./config')
const pool = createPool({
    host: DB_HOST,
    port: DB_PORT,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE,
    waitForConnections: true,
    connectionLimit: 10,
    maxIdle: 10, // max idle connections, the default value is the same as `connectionLimit`
    idleTimeout: 60000, // idle connections timeout, in milliseconds, the default value 60000
    queueLimit: 0,
    enableKeepAlive: true,
    keepAliveInitialDelay: 0,
})
console.log(DB_DATABASE, DB_HOST, DB_PASSWORD, DB_PORT, DB_USER)
module.exports = pool