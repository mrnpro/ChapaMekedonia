import 'package:chapa_mekedonia/Domain/Entities/Payment/checkout_entity.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/verify_payment_entity.dart';
import 'package:chapa_mekedonia/Domain/Repositories/Payment/payment_repo.dart';
import 'package:dartz/dartz.dart';

import '../../Entities/Payment/app_error.dart';
import '../../Entities/Payment/payment_request_entity.dart';

class GetPaymentUrlUsecase {
  final PaymentRepo _paymentRepo;

  GetPaymentUrlUsecase(this._paymentRepo);
  Future<Either<AppError, CheckoutEntity>> call(
      PaymentRequestEntity requestEntity) async {
    return await _paymentRepo.getPaymentUrl(requestEntity);
  }
}
