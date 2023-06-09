const express = require("express");
const bodyParser = require("body-parser");
const helmet = require("helmet");
const morgan = require("morgan");
const cors = require("cors");
const mongoose = require("mongoose");

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extends: false }));
app.use(helmet());
app.use(morgan("dev"));
app.use(cors());

mongoose.connect(
  "mongodb+srv://mycluster:vX0s0XNtf35un9t4@cluster0.ja88qbq.mongodb.net/ecommerce?retryWrites=true&w=majority"
);

const UserRoutes = require("./routes/user_routes");
app.use("/api/user", UserRoutes);

const CategoryRoutes = require("./routes/category_routes");
app.use("/api/category", CategoryRoutes);

const ProductRoutes = require("./routes/product_routes");
app.use("/api/product", ProductRoutes);

const CartRoutes = require("./routes/cart_routes");
app.use("/api/cart", CartRoutes);

const OrderRoutes = require("./routes/order_route");
app.use("/api/order", OrderRoutes);

const PORT = 5000;
app.listen(PORT, () => console.log(`server started at PORT: ${PORT}`));

//users -> model, routes and controller
