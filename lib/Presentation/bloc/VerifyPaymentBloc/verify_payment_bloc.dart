import 'package:bloc/bloc.dart';
import 'package:chapa_mekedonia/Domain/Usecases/PaymentUsecases/verify_payment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'verify_payment_event.dart';
part 'verify_payment_state.dart';

class VerifyPaymentBloc extends Bloc<VerifyPaymentEvent, VerifyPaymentState> {
  final VerifyPaymentUsecase _verifyPaymentUsecase;

  VerifyPaymentBloc(this._verifyPaymentUsecase)
      : super(VerifyPaymentInitial()) {
    on<VerifyPaymentEvent>((event, emit) async {
      if (event is Verify) {
        emit(Verifying());
        final response = await _verifyPaymentUsecase(event.tx_ref);
        emit(response.fold((error) => VerifyError(error.error), (data) {
          if (data.status != "success") {
            return PaymentUnsuccessful();
          }
          return PaymentSuccessful();
        }));
      }
    });
  }
}
