import 'dart:developer';
import 'package:api_with_provider/models/user_model.dart';
import 'package:api_with_provider/repository/auth_repository.dart';
import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/utils/utils.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  setSignUpLoading(bool val) {
    _signUpLoading = val;
    notifyListeners();
  }

  Future<void> login(String email, password, BuildContext context) async {
    setLoading(true);

    _authRepo.loginApi(email, password).then((dynamic value) {
      setLoading(false);
      if (value != null) {
        final auth = Provider.of<UserViewModel>(context, listen: false);
        auth.saveUser(UserModel(token: value["token"].toString()));
        Utils.toastMessage("Login Successfully");
        Navigator.pushNamed(context, RouteName.homeScreen);
        log("Check $value");
        if (kDebugMode) {
          print(value.toString());
        }
      } else {
        return;
      }
    }).catchError((e) {
      setLoading(false);
      Utils.errorToastMessage(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    });
  }
}
