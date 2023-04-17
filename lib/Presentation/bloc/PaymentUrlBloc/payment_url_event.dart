part of 'payment_url_bloc.dart';

abstract class PaymentUrlEvent extends Equatable {
  const PaymentUrlEvent();

  @override
  List<Object> get props => [];
}

class GetPaymentUrlEvent extends PaymentUrlEvent {
  final String amount;

  final String email;
  // ignore: non_constant_identifier_names
  final String first_name;
  // ignore: non_constant_identifier_names
  final String last_name;
  // ignore: non_constant_identifier_names
  final String phone_number;
  // ignore: non_constant_identifier_names
  final String tx_ref;

  const GetPaymentUrlEvent(this.amount, this.email, this.first_name,
      this.last_name, this.phone_number, this.tx_ref);
  @override
  List<Object> get props =>
      [amount, email, first_name, last_name, phone_number, tx_ref];
}
