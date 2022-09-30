const jwt = require('jsonwebtoken');
const User = require('../models/User');

exports.protect = async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  }

  if (!token) {
    return res.status(401).json({
      msg: 'You are unauthorized to access this resource.',
    });
  }

  console.log('token passed in is: ' + token);

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = await User.findById(decoded.user.id);
    console.log('decoded is: ' + decoded);

    console.log('user set is: ' + req.user);
    next();
  } catch (err) {
    return res.status(401).json({
      msg: 'You are unauthorized to access this resource.',
    });
  }
};
