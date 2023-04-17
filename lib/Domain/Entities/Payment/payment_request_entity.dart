import 'package:equatable/equatable.dart';

class PaymentRequestEntity extends Equatable {
  final String amount;
  final String currency;
  final String email;
  // ignore: non_constant_identifier_names
  final String first_name;
  // ignore: non_constant_identifier_names
  final String last_name;
  // ignore: non_constant_identifier_names
  final String phone_number;
  // ignore: non_constant_identifier_names
  final String tx_ref;
  // ignore: non_constant_identifier_names
  final String callback_url;
  // ignore: non_constant_identifier_names
  final String return_url;
  final String title;
  final String description;

  const PaymentRequestEntity(
      {required this.amount,
      required this.currency,
      required this.email,
      // ignore: non_constant_identifier_names
      required this.first_name,
      // ignore: non_constant_identifier_names
      required this.last_name,
      // ignore: non_constant_identifier_names
      required this.phone_number,
      // ignore: non_constant_identifier_names
      required this.tx_ref,
      // ignore: non_constant_identifier_names
      required this.callback_url,
      // ignore: non_constant_identifier_names
      required this.return_url,
      required this.title,
      required this.description});

  @override
  List<Object?> get props => [
        amount,
        currency,
        email,
        first_name,
        last_name,
        phone_number,
        tx_ref,
        callback_url,
        return_url,
        title,
        description
      ];
}
