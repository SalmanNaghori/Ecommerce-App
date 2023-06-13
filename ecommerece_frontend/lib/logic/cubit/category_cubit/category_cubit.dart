import 'package:ecommerece_frontend/data/model/category/category.dart';

import 'package:ecommerece_frontend/data/repositories/category_repository.dart';
import 'package:ecommerece_frontend/logic/cubit/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState()) {
    _initial();
  }

  final _categoryRepository = CategoryRepository();
  void _initial() async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> categories =
          await _categoryRepository.fetchAllCategories();
      emit(CategoryLoadedState(categories));
    } catch (ex) {
      emit(CategoryErorrState(ex.toString(), state.categories));
    }
  }
}
