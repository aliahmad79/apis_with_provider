import 'package:api_with_provider/models/user_model.dart';
import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<UserModel> getUser() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUser().then((value) async {
      print(value.token.toString());
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.loginScreen);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.homeScreen);
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
