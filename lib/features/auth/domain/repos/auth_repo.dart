import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  });
}
