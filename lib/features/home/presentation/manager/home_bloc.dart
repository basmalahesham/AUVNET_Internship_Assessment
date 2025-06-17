import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/banner_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_banners_use_case.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_restaurants_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_user_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBanners;
  final GetRestaurantsUseCase getRestaurants;
  final GetServicesUseCase getServices;
  final GetUserProfileUseCase getUserProfile;

  HomeBloc(
    this.getBanners,
    this.getServices,
    this.getRestaurants,
    this.getUserProfile,
  ) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoad);
  }

  Future<void> _onLoad(LoadHomeData e, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final results = await Future.wait([
        getBanners(),
        getRestaurants(),
        getServices(),
        getUserProfile(e.userId),
      ]);

      final bannersResult = results[0] as Either<Failure, List<BannerEntity>>;
      final restaurantsResult = results[1] as Either<Failure, List<RestaurantEntity>>;
      final servicesResult = results[2] as Either<Failure, List<ServiceEntity>>;
      final profileResult = results[3] as Either<Failure, UserProfileEntity>;

      bannersResult.fold((f) => emit(HomeFailure(f.message)), (banners) {
        restaurantsResult.fold((f) => emit(HomeFailure(f.message)), (restaurants) {
          servicesResult.fold((f) => emit(HomeFailure(f.message)), (services) {
            profileResult.fold((f) => emit(HomeFailure(f.message)), (profile) {
              emit(HomeSuccess(
                banners: banners,
                restaurants: restaurants,
                services: services,
                userProfile: profile,
              ));
            });
          });
        });
      });
    } catch (e) {
      emit(HomeFailure('Unexpected error occurred'));
    }
  }
}
