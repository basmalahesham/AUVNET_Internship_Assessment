part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  const RegisterRequested({
    required this.email,
    required this.password,
  });
}

