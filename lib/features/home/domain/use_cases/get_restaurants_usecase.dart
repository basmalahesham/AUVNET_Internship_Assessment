import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantsUseCase{
  final HomeRepository homeRepository;

  GetRestaurantsUseCase(this.homeRepository);

  Stream<Either<Failure,List<RestaurantEntity>>> call() {
    return homeRepository.getRestaurants();
  }
}
