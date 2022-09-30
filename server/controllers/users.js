const User = require('../models/User');

const updateUserProfile = async (req, res, next) => {
  const { fullName, email, emailUpdated } = req.body;
  const userId = req.params.id;

  console.log('name:' + fullName);
  console.log('email:' + email);
  console.log('userId:' + userId);
  console.log('emailUpdated:' + emailUpdated);

  try {
    let user = await User.findById(userId);

    if (!user) {
      return res.status(400).json({
        msg: 'Unable to find a user profile with the given id.',
      });
    }

    // Check if the email is taken or not
    if (emailUpdated) {
      const emailTaken = await User.findOne({ email: email });

      if (emailTaken) {
        return res.status(400).json({
          msg: 'The email address is already in use. Please try a different one.',
        });
      }
    }

    user.fullName = fullName;
    user.email = email;

    await user.save();

    return res.status(200).json(user);
  } catch (error) {
    return res.status(500).json({
      msg: 'Something went wrong. Sorry for the inconvenience.',
    });
  }
};

const addProductToFavorites = async (req, res, next) => {
  const userId = req.params.id;
  const product = req.body;

  try {
    let user = await User.findById(userId);

    user.favorites.push(product);

    await user.save();

    return res.status(200).json({
      msg: 'Product added to favorites',
    });
  } catch (error) {}
};

module.exports = { updateUserProfile, addProductToFavorites };
