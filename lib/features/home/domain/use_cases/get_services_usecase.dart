import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';

class GetServicesUseCase {
  final HomeRepository homeRepository;

  GetServicesUseCase(this.homeRepository);

  Stream<List<ServiceEntity>> call() => homeRepository.getServices();
}