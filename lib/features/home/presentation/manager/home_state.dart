part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ServiceEntity> services;
  final List<BannerEntity> banners;
  final List<RestaurantEntity> restaurants;
  final UserProfileEntity userProfile;

  const HomeSuccess({
    required this.services,
    required this.banners,
    required this.restaurants,
    required this.userProfile,
  });

  @override
  List<Object?> get props => [services, banners, restaurants, userProfile];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure(this.message);

  @override
  List<Object?> get props => [message];
}
