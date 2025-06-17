part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent extends Equatable{
  const RestaurantEvent();
  @override
  List<Object> get props => [];
}
class LoadRestaurants extends RestaurantEvent {}
