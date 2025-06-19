part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String address;

  const RegisterRequested({
    required this.email,
    required this.password,
    required this.name,
    required this.address,
  });
}


class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}
