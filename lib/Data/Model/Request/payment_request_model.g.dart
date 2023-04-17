// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) =>
    PaymentRequestModel(
      amount: json['amount'] as String,
      currency: json['currency'] as String,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      phone_number: json['phone_number'] as String,
      tx_ref: json['tx_ref'] as String,
      callback_url: json['callback_url'] as String,
      return_url: json['return_url'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PaymentRequestModelToJson(
        PaymentRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'tx_ref': instance.tx_ref,
      'callback_url': instance.callback_url,
      'return_url': instance.return_url,
      'title': instance.title,
      'description': instance.description,
    };
