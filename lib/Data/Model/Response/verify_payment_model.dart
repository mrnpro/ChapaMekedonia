import 'package:chapa_mekedonia/Domain/Entities/Payment/verify_payment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_payment_model.g.dart';

@JsonSerializable()
class VerifyPaymentModel extends VerifyPaymentEntity {
  const VerifyPaymentModel({required super.message, required super.status});
  factory VerifyPaymentModel.fromJson(json) =>
      _$VerifyPaymentModelFromJson(json);
}
