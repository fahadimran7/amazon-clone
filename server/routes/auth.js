const express = require('express');
const router = express.Router();
const { createUserWithEmailAndPassword } = require('../controllers/auth');

router.route('/signup').post(createUserWithEmailAndPassword);

module.exports = router;
