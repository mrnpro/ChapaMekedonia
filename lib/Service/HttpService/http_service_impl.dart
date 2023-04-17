import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../Core/Configs/http_config.dart';
import 'http_service.dart';

class HttpServiceImpl extends HttpService {
  late Dio _dio;
  @override
  Future<Response> deleteRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {}}) async {
    try {
      return await _dio.delete(urlPath);
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getRequest(
      {required String urlPath,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}}) async {
    try {
      return await _dio.get(urlPath,
          queryParameters: queryParam, options: Options(headers: header));
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> postRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}}) async {
    try {
      if (kDebugMode) {
        print(data);
      }
      Response response = await _dio.post(urlPath,
          queryParameters: queryParam,
          data: data,
          options: Options(headers: header));
      return response;
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> putRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {}}) async {
    throw UnimplementedError();
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: HttpConfig.chapaBaseUrl,
      ),
    );
  }
}
