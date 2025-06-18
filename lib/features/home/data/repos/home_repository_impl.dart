import 'package:auvnet_flutter_internship_assessment/features/home/data/data_sources/home_local_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/banner_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  HomeRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      return Right(await remoteDataSource.fetchBanners());
    } catch (_) {
      return Left(ServerFailure('Error fetching banners'));
    }
  }

  @override
  Stream<Either<Failure, List<ServiceEntity>>> getServices() async* {
    final cached = await localDataSource.getCachedServices();
    if (cached != null && cached.isNotEmpty) {
      yield Right(cached);
    }
    try {
      final stream = remoteDataSource.fetchServices();
      await for (final updated in stream) {
        await localDataSource.clearCachedServices();
        await localDataSource.cacheServices(updated);
        yield Right(updated);
      }
    } catch (_) {
      if (cached == null || cached.isEmpty) {
        yield Left(ServerFailure('Failed to fetch services'));
      }
    }
  }

  @override
  Stream<Either<Failure, List<RestaurantEntity>>> getRestaurants() async* {
    final cached = await localDataSource.getCachedRestaurants();
    if (cached != null && cached.isNotEmpty) {
      yield Right(cached);
    }

    try {
      final stream = remoteDataSource.fetchRestaurants();
      await for (final updated in stream) {
        await localDataSource.clearCachedRestaurants();
        await localDataSource.cacheRestaurants(updated);
        yield Right(updated);
      }
    } catch (_) {
      if (cached == null || cached.isEmpty) {
        yield Left(ServerFailure('Failed to fetch restaurants'));
      }
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile(
    String userId,
  ) async {
    try {
      final model = await remoteDataSource.fetchUserProfile(userId);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure('Failed to load user profile'));
    }
  }
}
