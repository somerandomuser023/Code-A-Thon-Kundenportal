const express = require("express");

const mysql = require("mysql");

const cors = require("cors");

const app = express(); // Create an instance of the express application

app.use(cors()); // Enable CORS policy for all routes

// Set up the connection to the MySQL database

const connection = mysql.createConnection({
  host: "localhost",

  user: "yourUsername", // Replace with your MySQL username

  password: "yourPassword", // Replace with your MySQL password

  database: "yourDatabase", // Replace with your database name
});

// Establish a connection to the database

connection.connect((err) => {
  if (err) throw err;

  console.log("Connected to the MySQL server."); // Confirmation message
});

// Define a route to retrieve data from the database

app.get("/assets", (req, res) => {
  connection.query("SELECT * FROM yourTable", (err, results) => {
    if (err) throw err;

    res.json(results); // Send query results back to the client
  });
});

// Start the server on port 3000

const port = 3000;

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
