const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const UserSchema = mongoose.Schema({
  fullName: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: 'Enter a valid email address.',
    },
  },
  password: {
    type: String,
    required: true,
    min: [6, 'Password must be at least 6 characters long.'],
  },
  address: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    enum: ['user', 'admin'],
    default: 'user',
  },
});

// Encrypt password using bcrypt
UserSchema.pre('save', async function (next) {
  if (!this.isModified('password')) {
    next();
  }

  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
});

module.exports = mongoose.model('User', UserSchema);
