const express = require('express');
const { Pool } = require('pg');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Database connection configuration
const pool = new Pool({
  user: 'admin',
  host: '127.0.0.1',
  database: 'grad_db',
  password: 'password123',
  port: 5432,
});

// 1. Database Initialization with Retry Logic
const initDb = async () => {
  let authenticated = false;
  console.log("Attempting to connect to the database and initialize tables...");

  while (!authenticated) {
    try {
      await pool.query(`
        CREATE TABLE IF NOT EXISTS users (
          id SERIAL PRIMARY KEY,
          first_name VARCHAR(50),
          last_name VARCHAR(50),
          gender VARCHAR(20),
          mobile_phone VARCHAR(20) UNIQUE,
          date_of_birth VARCHAR(20),
          email VARCHAR(100) UNIQUE,
          password TEXT,
          role VARCHAR(30)
        );
      `);
      console.log("Connection successful: 'users' table is ready!");
      authenticated = true;
    } catch (err) {
      console.log("Connection failed. Retrying in 5 seconds...");
      await new Promise(resolve => setTimeout(resolve, 5000));
    }
  }
};

initDb();

// 2. Signup Endpoint
app.post('/signup', async (req, res) => {
  const { firstName, lastName, gender, mobile, dob, email, password, role } = req.body;

  try {
    const newUser = await pool.query(
      `INSERT INTO users (first_name, last_name, gender, mobile_phone, date_of_birth, email, password, role)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`,
      [firstName, lastName, gender, mobile, dob, email, password, role]
    );

    res.status(201).json({
      message: "Registration successful!",
      user: newUser.rows[0]
    });
  } catch (err) {
    console.error("DEBUG ERROR:", err.message);

    // Check for unique constraint violation (Email or Phone already exists)
    if (err.code === '23505') {
      return res.status(400).json({ error: "Email or mobile phone already registered!" });
    }

    // Check if table does not exist
    if (err.code === '42P01') {
      return res.status(500).json({ error: "Database initialization incomplete. Please wait a moment." });
    }

    res.status(500).json({
      error: "Internal Server Error",
      details: err.message
    });
  }
});

// 3. Login Endpoint
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await pool.query(
      "SELECT * FROM users WHERE email = $1 AND password = $2",
      [email, password]
    );

    if (user.rows.length > 0) {
      res.status(200).json({
        message: "Login successful!",
        user: user.rows[0]
      });
    } else {
      res.status(401).json({ error: "Invalid email or password" });
    }
  } catch (err) {
    res.status(500).json({ error: "Server Error: " + err.message });
  }
});

// Server listener
const PORT = 5000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Server is running on port ${PORT}`);
});