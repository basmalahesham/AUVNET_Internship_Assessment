part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  final List<RestaurantEntity> restaurants;
  const RestaurantSuccess(this.restaurants);
  @override
  List<Object?> get props => [restaurants];
}

class RestaurantFailure extends RestaurantState {
  final String message;
  const RestaurantFailure(this.message);
  @override
  List<Object?> get props => [message];
}