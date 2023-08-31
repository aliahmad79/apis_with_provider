abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String url, {String? token});
  Future<dynamic> postApiResponse(
    String url,
    dynamic data,
  );
}
