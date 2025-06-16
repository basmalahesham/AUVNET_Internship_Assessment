import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUserUseCase {
  final AuthRepository _repository;

  RegisterUserUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.register(email: email, password: password);
  }
}
