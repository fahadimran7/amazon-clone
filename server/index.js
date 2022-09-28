const express = require('express');
const connectToMongoDB = require('./config/db');

// Load env vars
require('dotenv').config();

// DB connection
connectToMongoDB();

const app = express();

const PORT = process.env.PORT || 3000;

// Body parser
app.use(express.json());

// Route middleware
app.use('/api/v1/auth', require('./routes/auth'));
app.use('/api/v1/users', require('./routes/users'));

// Setup server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Listening on port ${PORT}...`);
});
