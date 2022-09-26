exports.getAllPosts = (req, res, next) => {
  return res.status(200).json({
    success: true,
    msg: 'Get all posts',
  });
};
