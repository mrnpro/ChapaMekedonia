import 'package:equatable/equatable.dart';

class CheckoutEntity extends Equatable {
  // ignore: non_constant_identifier_names
  final String checkout_url;

  const CheckoutEntity(this.checkout_url);

  @override
  List<Object?> get props => [checkout_url];
}
