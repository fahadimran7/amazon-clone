const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const getUserById = async (req, res, next) => {
  const userId = req.params.id;

  console.log(userId);

  try {
    const user = await User.findById(userId);
    return res.status(200).json(user);
  } catch (error) {
    return res.status(500).json({
      msg: 'Something went wrong. Sorry for the inconvenience.',
    });
  }
};

module.exports = { getUserById };
