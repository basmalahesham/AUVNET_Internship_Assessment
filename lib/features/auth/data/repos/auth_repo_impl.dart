import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_sources/auth_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _dataSource.register(email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error', code: e.code));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
