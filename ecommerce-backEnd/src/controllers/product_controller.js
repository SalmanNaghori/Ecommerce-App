const ProductModel = require("../models/product_model");

const ProductCntroller = {
  createProduct: async function (req, res) {
    try {
      const productData = req.body;
      const newProduct = new ProductModel(productData);
      await newProduct.save();

      return res.json({
        success: true,
        data: newProduct,
        message: "Product crested!",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  //fetch all products
  fetchAllProducts: async function (req, res) {
    try {
      const products = await ProductModel.find();

      return res.json({
        success: true,
        data: products,
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  //fetch by id
  fetchProductByCategory: async function (req, res) {
    try {
      const categoryId = req.params.id;
      const products = await ProductModel.find({ category: categoryId });
      if (!products) {
        return res.json({ success: false, message: "Product Not found" });
      }

      return res.json({ success: true, products: products });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },
};

module.exports = ProductCntroller;
