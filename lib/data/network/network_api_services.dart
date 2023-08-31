import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_with_provider/data/exceptions/app_exceptions.dart';
import 'package:api_with_provider/data/network/base_api_services.dart';
import 'package:api_with_provider/utils/utils.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  UserViewModel userPrf = UserViewModel();
  @override
  Future<dynamic> getApiResponse(String url, {String? token}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          "Token": "Bearer $token", // if needed
          'api-key': "your api key", // if needed
        },
      ).timeout(const Duration(seconds: 20));
      log(response.body);
      log(response.body.runtimeType.toString());
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      Utils.errorToastMessage(e.toString());
    }
  }

  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': '*/*',
              'api-key': "your api key", // if needed
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      log(response.body);
      log(response.body.runtimeType.toString());
      return returnResponse(response);
    } on SocketException {
      Utils.errorToastMessage("No Internet Connection");
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      Utils.errorToastMessage(e.toString());
    }
  }

  dynamic returnResponse(response) {
    log(response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.body;

        return responseJson;

      case 400:
        throw BadRequestException("Bad request");
      case 401:
        throw UnauthorizedException("Unauthorized");
      case 403:
        throw ForbiddenException("Credentials do not match");
      case 404:
        throw NotFoundException("Not found");
      default:
        throw FetchDataException(
            "Error occurred while communicating with the server with status code ${response.statusCode.toString()}");
    }
  }
}
