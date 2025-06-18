import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/banner_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Stream<Either<Failure, List<ServiceEntity>>> getServices();
  Stream<Either<Failure, List<RestaurantEntity>>> getRestaurants();
  Future<Either<Failure, UserProfileEntity>> getUserProfile(String userId);
}