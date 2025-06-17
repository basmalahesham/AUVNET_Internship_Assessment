import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/banner_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_banners_use_case.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_restaurants_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_user_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBanners;
  final GetRestaurantUseCase getRestaurants;
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
    final bannersResult = await getBanners();
    final restaurantsResult = await getRestaurants();
    final servicesResult = await getServices();
    final profileResult = await getUserProfile(e.userId);

    bannersResult.fold((failure) => emit(HomeFailure(failure.message)), (
      banners,
    ) {
      restaurantsResult.fold((failure) => emit(HomeFailure(failure.message)), (
        restaurants,
      ) {
        servicesResult.fold((failure) => emit(HomeFailure(failure.message)), (
          services,
        ) {
          profileResult.fold(
            (failure) => emit(HomeFailure(failure.message)),
            (profile) => emit(
              HomeSuccess(
                banners: banners,
                restaurants: restaurants,
                services: services,
                userProfile: profile,
              ),
            ),
          );
        });
      });
    });
  }
}
