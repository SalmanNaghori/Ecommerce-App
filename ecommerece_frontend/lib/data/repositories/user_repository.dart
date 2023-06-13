import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerece_frontend/data/model/user/user_model.dart';

import '../../core/api.dart';

class UserRepository {
  final _api = Api();

  //create a new user
  Future<UserModel> createAccount(
      {required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest.post("/user/createAccount",
          data: jsonEncode({
            "email": email,
            "password": password,
          }));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw (apiResponse.message.toString());
      }

      //conver row data to model
      return UserModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  //signIn user
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest.post("/user/signIn",
          data: jsonEncode({
            "email": email,
            "password": password,
          }));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw (apiResponse.message.toString());
      }

      //conver row data to model
      return UserModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
