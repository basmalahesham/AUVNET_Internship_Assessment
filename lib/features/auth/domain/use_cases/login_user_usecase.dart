import 'package:dartz/dartz.dart';
import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/repos/auth_repo.dart';

class LoginUserUseCase {
  final AuthRepository _repository;

  LoginUserUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
