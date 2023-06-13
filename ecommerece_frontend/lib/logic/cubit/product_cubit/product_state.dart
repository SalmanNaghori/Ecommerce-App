// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerece_frontend/data/model/product_model/product_model.dart';

abstract class ProductState {
  final List<ProductModel> products;
  ProductState(this.products);
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super([]);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(super.products);
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(super.products);
}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message, super.products);
}
