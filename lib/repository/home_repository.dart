import 'package:api_with_provider/data/network/base_api_services.dart';
import 'package:api_with_provider/data/network/network_api_services.dart';
import 'package:api_with_provider/models/user_vehicle_list.dart';
import 'package:api_with_provider/models/vehicle_model.dart';
import 'package:api_with_provider/res/app_url.dart';
import 'package:api_with_provider/utils/utils.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<VehicleModel> userCarListApi() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.vehicleModelUrl);
      return response = vehicleModelFromJson(response);
    } catch (e) {
      Utils.errorToastMessage(e.toString());
      throw e.toString();
    }
  }
}
