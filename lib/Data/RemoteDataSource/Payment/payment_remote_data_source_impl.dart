import 'package:chapa_mekedonia/Core/API/apis.dart';
import 'package:chapa_mekedonia/Data/Model/Request/payment_request_model.dart';
import 'package:chapa_mekedonia/Data/RemoteDataSource/Payment/payment_remote_data_source.dart';
import 'package:chapa_mekedonia/Service/HttpService/http_service.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/foundation.dart';

import '../../../Core/Configs/http_config.dart';

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final HttpService _httpService;

  PaymentRemoteDataSourceImpl(this._httpService);

  @override
  Future<Response> getPaymentUrl(PaymentRequestModel requestModel) async {
    try {
      Map<String, dynamic> header = {
        'Authorization': 'Bearer ${HttpConfig.chapaAPIKey}',
        'Content-Type': 'application/json'
      };
      if (kDebugMode) {
        print(requestModel.toJson());
      }
      Response response = await _httpService.postRequest(
          header: header,
          urlPath: APIs.initializeChapa,
          data: requestModel.toJson());

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> verify(String tx_ref) async {
    try {
      Map<String, dynamic> header = {
        'Authorization': 'Bearer ${HttpConfig.chapaAPIKey}',
        'Content-Type': 'application/json'
      };
      Response response = await _httpService.getRequest(
        urlPath: APIs.chapaVerirfication + tx_ref,
        header: header,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
