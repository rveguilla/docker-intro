const express = require('express');
const anyDB = require('any-db');

const server = express();

const dbDriver = process.env.DB_DRIVER || 'mysql';
const dbHost = process.env.DB_HOST || 'localhost';
const dbUser = process.env.DB_USER || 'app_user';
const dbPassword = process.env.DB_PASSWORD || 'app_password';
const dbName = process.env.DB_NAME || 'app_database';
const serverPort = process.env.PORT || 3000;

server.get("*", (req, res) => {
    try {
        anyDB.createConnection(`${dbDriver}://${dbUser}:${dbPassword}@${dbHost}/${dbName}`, (err, conn) => {
            if (err) {
                console.error(err);
                res.send(err.message)
            } else {
                conn.query('select app_column from app_table', (error, result) => {
                    if (error) {
                        console.error(error);
                        res.send(error.message)
                    } else {
                        const body = result.rows.map (row => row['app_column']).join("<br/>");
                        res.send(body).end();
                    }
                });
            }
        });

    } catch (err) {
        console.error(err);
        res.send(err.message)
    }
});


server.listen(serverPort, ()=> {
    console.log(`server listening at https://localhost:${serverPort}`);
});