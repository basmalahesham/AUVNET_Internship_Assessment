import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantUseCase{
  final HomeRepository homeRepository;

  GetRestaurantUseCase(this.homeRepository);

  Future<Either<Failure,List<RestaurantEntity>>> call() {
    return homeRepository.getRestaurants();
  }
}