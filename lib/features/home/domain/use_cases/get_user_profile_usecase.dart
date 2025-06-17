import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileUseCase {
  final HomeRepository homeRepository;
  GetUserProfileUseCase(this.homeRepository);

  Future<Either<Failure, UserProfileEntity>> call(String userId) {
    return homeRepository.getUserProfile(userId);
  }
}