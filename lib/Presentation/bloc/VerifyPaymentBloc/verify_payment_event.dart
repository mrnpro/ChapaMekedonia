part of 'verify_payment_bloc.dart';

abstract class VerifyPaymentEvent extends Equatable {
  const VerifyPaymentEvent();

  @override
  List<Object> get props => [];
}

class Verify extends VerifyPaymentEvent {
  final String tx_ref;

  const Verify(this.tx_ref);
  @override
  List<Object> get props => [tx_ref];
}
