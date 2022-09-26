const express = require('express');
const connectToMongoDB = require('./config/db');

require('dotenv').config();

connectToMongoDB();

const app = express();

const PORT = process.env.PORT || 3000;

app.use('/posts', require('./routes/posts'));

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Listening on port ${PORT}...`);
});
