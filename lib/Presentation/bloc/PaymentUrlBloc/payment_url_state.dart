part of 'payment_url_bloc.dart';

abstract class PaymentUrlState extends Equatable {
  const PaymentUrlState();

  @override
  List<Object> get props => [];
}

class PaymentUrlInitial extends PaymentUrlState {}

class PaymentUrlProccessing extends PaymentUrlState {}

class PaymentUrlFetched extends PaymentUrlState {
  final String checkoutUrl;

  const PaymentUrlFetched(this.checkoutUrl);
  @override
  List<Object> get props => [checkoutUrl];
}

class PaymentProcessingError extends PaymentUrlState {
  final String error;

  const PaymentProcessingError(this.error);
  @override
  List<Object> get props => [error];
}
