part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent extends Equatable{
  const RestaurantEvent();
  @override
  List<Object> get props => [];
}
class LoadRestaurants extends RestaurantEvent {}
class _RestaurantsUpdated extends RestaurantEvent {
  final List<RestaurantEntity> restaurants;
  const _RestaurantsUpdated(this.restaurants);
  @override
  List<Object> get props => [restaurants];
}

class _RestaurantsFailed extends RestaurantEvent {
  final String message;
  const _RestaurantsFailed(this.message);
  @override
  List<Object> get props => [message];
}