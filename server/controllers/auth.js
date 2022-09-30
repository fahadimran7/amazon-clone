const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const createUserWithEmailAndPassword = async (req, res, next) => {
  const { fullName, email, password } = req.body;

  // Check if user with same email already exists in the database
  try {
    const userExists = await User.findOne({ email });

    if (userExists) {
      return res.status(400).json({
        msg: 'A user with this email already exists.',
      });
    }

    if (password.length < 6) {
      return res.status(400).json({
        msg: 'The password entered is too weak. Passwords must be at least 6 characters long.',
      });
    }

    let user = new User({
      fullName,
      email,
      password: password,
    });

    user = await user.save();

    return res.status(200).json(user);
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      error: e.message,
    });
  }
};

const loginUserWithEmailAndPassword = async (req, res, next) => {
  const { email, password } = req.body;

  // Check if user with email exists in the database
  try {
    const userFromDb = await User.findOne({ email });

    if (!userFromDb) {
      return res.status(400).json({
        msg: 'No user record found with the email. The user may have been deleted.',
      });
    }

    const isMatchPassword = await bcrypt.compare(password, userFromDb.password);

    if (!isMatchPassword) {
      return res.status(400).json({
        msg: 'Incorrect email address or password.',
      });
    }

    // Create new JWT token and return
    const token = jwt.sign(
      {
        user: {
          id: userFromDb.id,
        },
      },
      process.env.JWT_SECRET
    );

    return res.status(200).json({ token: token });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      error: e.message,
    });
  }
};

const getLoggedInUser = async (req, res, next) => {
  const userId = req.user.id;

  try {
    let user = await User.findById(userId);
    return res.status(200).json(user);
  } catch (error) {
    return res.status(500).json({
      msg: 'Something went wrong. Sorry for the inconvenience.',
    });
  }
};

module.exports = {
  createUserWithEmailAndPassword,
  loginUserWithEmailAndPassword,
  getLoggedInUser,
};
