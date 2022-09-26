const User = require('../models/User');
const bcrypt = require('bcryptjs');

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

    // Hash user password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    let user = new User({
      fullName,
      email,
      password: hashedPassword,
    });

    user = await user.save();

    return res.status(201).json(user);
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      error: e._message,
    });
  }
};

module.exports = { createUserWithEmailAndPassword };
