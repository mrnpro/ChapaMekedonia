import 'package:bloc/bloc.dart';
import 'package:chapa_mekedonia/Domain/Entities/Payment/payment_request_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../Domain/Usecases/PaymentUsecases/get_payment_url_usecase.dart';

part 'payment_url_event.dart';
part 'payment_url_state.dart';

class PaymentUrlBloc extends Bloc<PaymentUrlEvent, PaymentUrlState> {
  final GetPaymentUrlUsecase _getPaymentUrlUsecase;
  PaymentUrlBloc(this._getPaymentUrlUsecase) : super(PaymentUrlInitial()) {
    on<PaymentUrlEvent>((event, emit) async {
      if (event is GetPaymentUrlEvent) {
        emit(PaymentUrlProccessing());
        final response = await _getPaymentUrlUsecase(PaymentRequestEntity(
            amount: event.amount,
            currency: "ETB",
            email: event.email,
            first_name: event.first_name,
            last_name: event.last_name,
            phone_number: event.phone_number,
            tx_ref: event.tx_ref,
            callback_url:
                'https://webhook.site/077164d6-29cb-40df-ba29-8a00e59a7e60',
            return_url: 'https://chapa.co/',
            title: "donation",
            description: "this is a payment donation for mekedonia"));
        emit(response.fold((error) => PaymentProcessingError(error.error),
            (data) => PaymentUrlFetched(data.checkout_url)));
      }
    });
  }
}
