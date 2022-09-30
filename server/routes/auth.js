const express = require('express');
const {
  createUserWithEmailAndPassword,
  loginUserWithEmailAndPassword,
} = require('../controllers/auth');
const { getLoggedInUser } = require('../controllers/auth');
const { protect } = require('../middleware/auth');

const router = express.Router();

router.route('/signup').post(createUserWithEmailAndPassword);
router.route('/login').post(loginUserWithEmailAndPassword);
router.route('/me').get(protect, getLoggedInUser);

module.exports = router;
