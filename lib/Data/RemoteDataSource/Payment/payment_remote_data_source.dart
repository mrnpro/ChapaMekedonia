import 'package:chapa_mekedonia/Data/Model/Request/payment_request_model.dart';
import 'package:dio/dio.dart';

abstract class PaymentRemoteDataSource {
  Future<Response> getPaymentUrl(PaymentRequestModel requestModel);
  Future<Response> verify(String tx_ref);
}
