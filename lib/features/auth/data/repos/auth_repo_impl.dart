import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource,this._localDataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.register(email, password);
      final userModel = UserModel.fromFirebaseUser(user);
      await _localDataSource.cacheUser(userModel);
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error', code: e.code));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(email, password);
      final userModel = UserModel.fromFirebaseUser(user);
      await _localDataSource.cacheUser(userModel);
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error', code: e.code));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
