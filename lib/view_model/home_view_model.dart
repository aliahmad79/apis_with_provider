import 'dart:developer';

import 'package:api_with_provider/data/response/api_response.dart';
import 'package:api_with_provider/models/user_model.dart';
import 'package:api_with_provider/models/vehicle_model.dart';
import 'package:api_with_provider/repository/home_repository.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();
  ApiResponse<VehicleModel> userCarList = ApiResponse.loading();

  setUserCarList(ApiResponse<VehicleModel> response) {
    userCarList = response;
    notifyListeners();
  }

  Future<UserModel> getUserFromSharedPreferences() async {
    final userPref = UserViewModel();
    return await userPref.getUser();
  }

  Future<void> getVehicleListApi() async {
    setUserCarList(ApiResponse.loading());
    _homeRepo.userCarListApi().then((value) {
      setUserCarList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserCarList(ApiResponse.error(error.toString()));
    });
  }
}
