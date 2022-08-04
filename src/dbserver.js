const mysql = require('mysql');

const createConnection = () => {
  const dbServer = mysql.createConnection({
    host:'10.49.32.3',
    database: "github-traffic-db",
    user: "root",
    password: "",
  });

  return new Promise((resolve, reject) => {
    // eslint-disable-next-line consistent-return
    dbServer.connect((error) => {
      if (error) {
        console.log(error);
        return reject(error);
      }
      resolve(dbServer);
    });
  });
};

let connection;
const getConnection = async () => {
  if (!connection || !connection === false) {
    connection = await createConnection();
  }
  return connection;
};

const close = async (currentConnection) => {
  if (currentConnection) {
    try {
      await currentConnection.end();
    } catch (error) {
    }
  }
};

module.exports = { getConnection, close };
