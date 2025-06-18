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
  final HomeRemoteDataSource dataSource;
  final HomeLocalDataSource local;
  HomeRepositoryImpl(this.dataSource, this.local);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      return Right(await dataSource.fetchBanners());
    } catch (_) {
      return Left(ServerFailure('Error fetching banners'));
    }
  }

  @override
  Stream<Either<Failure, List<ServiceEntity>>> getServices() async* {
    try {
      final stream = dataSource.fetchServices();
      await for (final updated in stream) {
        await local.clearCachedServices();
        await local.cacheServices(updated);
        yield Right(updated);
      }
    } catch (_) {
      final cached = await local.getCachedServices();
      if (cached != null && cached.isNotEmpty) {
        yield Right(cached);
      } else {
        yield Left(ServerFailure('Failed to fetch services'));
      }
    }
  }


  @override
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants() async {
    try {
      final list = await dataSource.fetchRestaurants();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('Failed to load restaurants'));
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile(
      String userId,
      ) async {
    try {
      final model = await dataSource.fetchUserProfile(userId);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure('Failed to load user profile'));
    }
  }
}
