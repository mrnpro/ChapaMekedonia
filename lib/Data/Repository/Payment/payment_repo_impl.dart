import 'package:chapa_mekedonia/Data/Model/Request/payment_request_model.dart';
import 'package:chapa_mekedonia/Data/Model/Response/checkout_payment_model.dart';
import 'package:chapa_mekedonia/Data/Model/Response/verify_payment_model.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/verify_payment_entity.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/payment_request_entity.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/checkout_entity.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/app_error.dart';
import 'package:chapa_mekedonia/Domain/Repositories/Payment/payment_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../RemoteDataSource/Payment/payment_remote_data_source.dart';

class PaymentRepoImpl implements PaymentRepo {
  final PaymentRemoteDataSource _paymentRemoteDataSource;

  PaymentRepoImpl(this._paymentRemoteDataSource);
  @override
  Future<Either<AppError, CheckoutEntity>> getPaymentUrl(
      PaymentRequestEntity requestEntity) async {
    try {
      Response response = await _paymentRemoteDataSource
          .getPaymentUrl(PaymentRequestModel.fromEntity(requestEntity));
      CheckoutEntity checkoutEntity =
          CheckoutPaymentModel.fromJson(response.data["data"]);
      return Right(checkoutEntity);
    } on DioError catch (e) {
      return Left(AppError(e.message.toString()));
    }
  }

  @override
  Future<Either<AppError, VerifyPaymentEntity>> verify(String tx_ref) async {
    try {
      Response response = await _paymentRemoteDataSource.verify(tx_ref);
      VerifyPaymentEntity verifyPaymentEntity =
          VerifyPaymentModel.fromJson(response.data);
      return Right(verifyPaymentEntity);
    } on DioError catch (e) {
      return Left(
          AppError(e.response?.data['message'] ?? "something went wrong "));
    }
  }
}
