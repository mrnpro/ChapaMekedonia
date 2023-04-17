import 'package:chapa_mekedonia/Domain/Entities/Payment/app_error.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/checkout_entity.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/payment_request_entity.dart';
import 'package:dartz/dartz.dart';

import '../../Entities/Payment/verify_payment_entity.dart';

abstract class PaymentRepo {
  Future<Either<AppError, CheckoutEntity>> getPaymentUrl(
      PaymentRequestEntity requestEntity);
  Future<Either<AppError, VerifyPaymentEntity>> verify(String tx_ref);
}
