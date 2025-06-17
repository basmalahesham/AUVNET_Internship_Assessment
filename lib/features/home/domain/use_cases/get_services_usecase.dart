import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetServicesUseCase {
  final HomeRepository homeRepository;

  GetServicesUseCase(this.homeRepository);

  Future<Either<Failure, List<ServiceEntity>>> call() =>
      homeRepository.getServices();
}
