import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerece_frontend/core/api.dart';
import 'package:ecommerece_frontend/data/model/category/category.dart';
import 'package:ecommerece_frontend/data/model/product_model/product_model.dart';

class ProductRepository {
  final _api = Api();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      Response response = await _api.sendRequest.get("/product");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  // fatch category by category
  Future<List<ProductModel>> fatchProductsbyCategory() async {
    try {
      Response response = await _api.sendRequest.get("/product");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
