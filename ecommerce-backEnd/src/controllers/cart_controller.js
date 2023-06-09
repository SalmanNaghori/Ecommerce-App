const CartModel = require("./../models/cart_model");

const CartController = {
  //get cart for user

  getCartForUser: async function (req, res) {
    try {
      const user = req.params.user;
      const foundCart = await CartModel.findOne({ user: user }).populate(
        "items.product"
      );

      if (!foundCart) {
        return res.json({ success: true, data: [] });
      }
      return res.json({ success: true, data: foundCart.items });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  addToCart: async function (req, res) {
    try {
      const { product, user, quantity } = req.body;
      const foundCart = await CartModel.findOne({ user: user });

      if (!foundCart) {
        const newCart = new CartModel({ user: user });
        newCart.items.push({
          product: product,
          quantity: quantity,
        });
        await newCart.save();
        return res.json({
          success: true,
          data: newCart,
          message: "Product added ",
        });
      }

      // if cart is already exis
      const updatedCart = await CartModel.findOneAndUpdate(
        { user: user },
        { $push: { items: { prduct: product, quantity: quantity } } },
        { new: true }
      );
      return res.json({
        success: true,
        data: updatedCart,
        message: "Product added ",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  //remove from cart
  removeFromCart: async function (req, res) {
    try {
      const { user, product } = req.body;
      const updatedCart = await CartModel.findOneAndUpdate(
        { user: user },
        { $pull: { items: { product: product } } },
        { new: true }
      );
      return res.json({
        success: true,
        data: updatedCart,
        message: "product remove from cart ",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },
};

module.exports = CartController;
