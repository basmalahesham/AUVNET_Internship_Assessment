import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$runtimeType: $message';
}

class AuthFailure extends Failure {
  final String code;

  const AuthFailure(super.message, {this.code = ''});

  @override
  List<Object?> get props => [message, code];
}

class VerificationFailure extends Failure {
  const VerificationFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
