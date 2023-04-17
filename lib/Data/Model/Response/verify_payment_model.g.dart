// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPaymentModel _$VerifyPaymentModelFromJson(Map<String, dynamic> json) =>
    VerifyPaymentModel(
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$VerifyPaymentModelToJson(VerifyPaymentModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
