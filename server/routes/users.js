const express = require('express');
const router = express.Router();
const { getUserById, updateUserProfile } = require('../controllers/users');

router.route('/:id').get(getUserById).put(updateUserProfile);

module.exports = router;
