const express = require('express');
const router = express.Router();
const { getUserById, updateUserProfile } = require('../controllers/users');
const { protect } = require('../middleware/auth');

router.route('/:id').get(getUserById).put(protect, updateUserProfile);

module.exports = router;
