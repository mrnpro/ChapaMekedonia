import '../../../Domain/Entities/Payment/payment_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request_model.g.dart';

@JsonSerializable()
class PaymentRequestModel extends PaymentRequestEntity {
  const PaymentRequestModel(
      {required super.amount,
      required super.currency,
      required super.email,
      // ignore: non_constant_identifier_names
      required super.first_name,
      // ignore: non_constant_identifier_names
      required super.last_name,
      // ignore: non_constant_identifier_names
      required super.phone_number,
      // ignore: non_constant_identifier_names
      required super.tx_ref,
      // ignore: non_constant_identifier_names
      required super.callback_url,
      // ignore: non_constant_identifier_names
      required super.return_url,
      required super.title,
      required super.description});
  Map<String, dynamic> toJson() => _$PaymentRequestModelToJson(this);
  factory PaymentRequestModel.fromEntity(PaymentRequestEntity entity) =>
      PaymentRequestModel(
          amount: entity.amount,
          currency: entity.currency,
          email: entity.email,
          first_name: entity.first_name,
          last_name: entity.last_name,
          phone_number: entity.phone_number,
          tx_ref: entity.tx_ref,
          callback_url: entity.callback_url,
          return_url: entity.return_url,
          title: entity.title,
          description: entity.description);
}
