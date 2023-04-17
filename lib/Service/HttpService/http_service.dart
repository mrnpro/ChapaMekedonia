import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> getRequest(
      {required String urlPath,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}});

  Future<Response> postRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}});
  Future<Response> putRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
  });
  Future<Response> deleteRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
  });
}
