const CategoryModel = require("./../models/category_model");

const CategoryController = {
  //create a new category
  createCategory: async function (req, res) {
    try {
      const categoryData = req.body;
      const newcategory = new CategoryModel(categoryData);
      await newcategory.save();

      return res.json({
        success: true,
        data: newcategory,
        message: "Category created!",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  //fetch all category
  fetchAllCategories: async function (req, res) {
    try {
      const categories = await CategoryModel.find();
      return res.json({
        success: true,
        data: categories,
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  //fetch by id
  fetchCategoryById: async function (req, res) {
    try {
      const id = req.params.id;
      const foundcategory = await CategoryModel.findById(id);

      if (!foundcategory) {
        return res.json({ success: false, message: "Category Not found" });
      }

      return res.json({
        success: true,
        data: foundcategory,
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },
};

module.exports = CategoryController;
