import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String error;

  const AppError(this.error);

  @override
  List<Object?> get props => [error];
}
