const express = require('express');
const router = express.Router();
const {
  createUserWithEmailAndPassword,
  loginUser,
} = require('../controllers/auth');

router.route('/signup').post(createUserWithEmailAndPassword);
router.route('/login').post(loginUser);

module.exports = router;
