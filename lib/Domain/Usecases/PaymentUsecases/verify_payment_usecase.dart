import 'package:chapa_mekedonia/Domain/Repositories/Payment/payment_repo.dart';
import 'package:dartz/dartz.dart';

import '../../Entities/Payment/app_error.dart';
import '../../Entities/Payment/verify_payment_entity.dart';

class VerifyPaymentUsecase {
  final PaymentRepo _paymentRepo;

  VerifyPaymentUsecase(this._paymentRepo);

  Future<Either<AppError, VerifyPaymentEntity>> call(String tx_ref) async {
    return await _paymentRepo.verify(tx_ref);
  }
}
