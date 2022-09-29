const mongoose = require('mongoose');

const ProductSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  brand: {
    type: String,
    required: true,
    trim: true,
  },
  imageUrl: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    default: '',
  },
  price: {
    type: Number,
    min: [0, 'Price can not be less than 0'],
  },
  rating: {
    type: Number,
    min: [1, 'Rating can not be less than 1'],
    max: [5, 'Rating can not be greater than 5'],
  },
  inStock: {
    type: Boolean,
    default: true,
  },
});

module.exports = mongoose.model('Product', ProductSchema);
