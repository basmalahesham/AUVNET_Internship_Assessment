import 'package:auvnet_flutter_internship_assessment/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/use_cases/register_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUseCase registerUserUseCase;

  AuthBloc(this.registerUserUseCase) : super(AuthInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await registerUserUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
