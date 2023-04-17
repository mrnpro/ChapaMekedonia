import 'package:chapa_mekedonia/Domain/Entities/Payment/checkout_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_payment_model.g.dart';

@JsonSerializable()
class CheckoutPaymentModel extends CheckoutEntity {
  const CheckoutPaymentModel(super.checkout_url);
  factory CheckoutPaymentModel.fromJson(json) =>
      _$CheckoutPaymentModelFromJson(json);
}
