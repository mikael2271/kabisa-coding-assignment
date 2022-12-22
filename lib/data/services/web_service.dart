import 'package:dio/dio.dart';

import '../../core/constants/config.dart';

class WebService {
  WebService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  /// Headers used on all requests

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  /// Generic Method to post - Return response from api
  /// obj - Content Json to send
  /// endpoint - path to request
  /// token - if needed(Optional)

  Future<Response> post(
      {required String obj, required String endpoint, String? token}) async {
    final request = Uri.http(baseUrl, endpoint);
    if (token != null) {
      requestHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    return await _dio.post(request.toString(),
        options: Options(headers: requestHeaders), data: obj);
  }

  /// Generic Method to get - Return response from api
  /// endpoint - path to request
  /// token - if needed(Optional)
  /// queryParameters - additional parameters(Optional)

  Future<Response> get(
      {required String endpoint,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    final request = Uri.http(baseUrl, endpoint, queryParameters);

    if (token != null) {
      requestHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    return await _dio.get(request.toString(),
        options: Options(headers: requestHeaders));
  }

  /// Generic Method to put - Return response from api
  /// obj - Content Json to send
  /// endpoint - path to request
  /// token - if needed(Optional)

  Future<Response> put(
      {required String obj, required String endpoint, String? token}) async {
    final request = Uri.http(baseUrl, endpoint);
    if (token != null) {
      requestHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    return await _dio.put(request.toString(),
        options: Options(headers: requestHeaders), data: obj);
  }
}
