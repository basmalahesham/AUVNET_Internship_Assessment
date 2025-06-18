import 'dart:async';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_restaurants_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantsUseCase getRestaurants;
  StreamSubscription<Either<Failure, List<RestaurantEntity>>>? _subscription;

  RestaurantBloc(this.getRestaurants) : super(RestaurantInitial()) {
    on<LoadRestaurants>(_onLoadRestaurants);
    on<_RestaurantsUpdated>(_onRestaurantsUpdated);
    on<_RestaurantsFailed>(_onRestaurantsFailed);
  }

  Future<void> _onLoadRestaurants(
      LoadRestaurants event,
      Emitter<RestaurantState> emit,
      ) async {
    emit(RestaurantLoading());

    await _subscription?.cancel();
    _subscription = getRestaurants().listen((result) {
      result.fold(
            (failure) => add(_RestaurantsFailed(failure.message)),
            (restaurants) => add(_RestaurantsUpdated(restaurants)),
      );
    });
  }

  void _onRestaurantsUpdated(
      _RestaurantsUpdated event, Emitter<RestaurantState> emit) {
    emit(RestaurantSuccess(event.restaurants));
  }

  void _onRestaurantsFailed(
      _RestaurantsFailed event, Emitter<RestaurantState> emit) {
    emit(RestaurantFailure(event.message));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
