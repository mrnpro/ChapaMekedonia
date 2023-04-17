import 'package:equatable/equatable.dart';

class VerifyPaymentEntity extends Equatable {
  final String message;
  final String status;

  const VerifyPaymentEntity({required this.message, required this.status});

  @override
  List<Object?> get props => [message, status];
}
