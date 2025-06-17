import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/banner_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBannersUseCase {
  final HomeRepository homeRepository;
  GetBannersUseCase(this.homeRepository);
  Future<Either<Failure,List<BannerEntity>>> call() => homeRepository.getBanners();
}