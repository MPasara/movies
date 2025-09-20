import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, this.error, this.stackTrace});

  final String message;

  final dynamic error;

  final StackTrace? stackTrace;

  factory Failure.generic([
    String? message,
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    return Failure(
      message: message ?? 'Something went wrong',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  List<Object?> get props => [message, error, stackTrace];

  @override
  bool? get stringify => true;
}
