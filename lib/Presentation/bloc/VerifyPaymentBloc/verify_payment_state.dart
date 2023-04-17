part of 'verify_payment_bloc.dart';

abstract class VerifyPaymentState extends Equatable {
  const VerifyPaymentState();

  @override
  List<Object> get props => [];
}

class VerifyPaymentInitial extends VerifyPaymentState {}

class Verifying extends VerifyPaymentState {}

class VerifyError extends VerifyPaymentState {
  final String error;

  const VerifyError(this.error);
  @override
  List<Object> get props => [error];
}

class PaymentSuccessful extends VerifyPaymentState {}

class PaymentUnsuccessful extends VerifyPaymentState {}
