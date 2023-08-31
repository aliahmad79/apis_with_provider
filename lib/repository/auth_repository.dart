import 'package:api_with_provider/data/exceptions/error_handler.dart';
import 'package:api_with_provider/data/network/base_api_services.dart';
import 'package:api_with_provider/data/network/network_api_services.dart';
import 'package:api_with_provider/res/app_url.dart';
import 'package:flutter/material.dart';

class AuthRepository extends BaseErrorHandler {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(String email, password) async {
    var postBody = {
      "email": email,
      "password": password,
    };
    try {
      dynamic response =
          await apiServices.postApiResponse(AppUrl.loginUrl, postBody);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
