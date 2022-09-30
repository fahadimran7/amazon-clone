const express = require('express');
const {
  updateUserProfile,
  addProductToFavorites,
} = require('../controllers/users');
const { protect } = require('../middleware/auth');

const router = express.Router();

router.route('/:id').put(protect, updateUserProfile);
router.route('/:id/favorites/new').put(protect, addProductToFavorites);

module.exports = router;
