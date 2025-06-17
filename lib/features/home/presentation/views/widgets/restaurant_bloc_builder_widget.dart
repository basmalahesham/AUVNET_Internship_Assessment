import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/restaurant_bloc/restaurant_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_popular_restaurants_nearby_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantBlocBuilderWidget extends StatelessWidget {
  const RestaurantBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoading) {
          return const CircularProgressIndicator();
        } else if (state is RestaurantFailure) {
          return Center(child: Text(state.message));
        } else if (state is RestaurantSuccess) {
          return CustomPopularRestaurantsNearbyWidgets(
            restaurants: state.restaurants,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
