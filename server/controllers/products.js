const Product = require('../models/Product');

const getAllProducts = async (req, res, next) => {
  try {
    const products = await Product.find();
    return res.status(200).json(products);
  } catch (error) {
    return res.status(500).json({
      msg: 'Something went wrong. Sorry for the inconvenience.',
    });
  }
};

module.exports = { getAllProducts };
