import 'package:ecommerece_frontend/data/model/category/category.dart';

abstract class CategoryState {
  final List<CategoryModel> categories;

  CategoryState(this.categories);
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super([]);
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState(super.categories);
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(super.categories);
}

class CategoryErorrState extends CategoryState {
  final String message;

  CategoryErorrState(this.message, super.categories);
}
