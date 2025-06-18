import 'package:auvnet_flutter_internship_assessment/features/home/data/models/service_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/restaurant_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  // Services
  Future<void> cacheServices(List<ServiceModel> services);
  Future<List<ServiceModel>?> getCachedServices();
  Future<void> clearCachedServices();

  // Restaurants
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants);
  Future<List<RestaurantModel>?> getCachedRestaurants();
  Future<void> clearCachedRestaurants();
}

class HiveHomeLocalDataSource implements HomeLocalDataSource {
  final Box<ServiceModel> serviceBox;
  final Box<RestaurantModel> restaurantBox;

  HiveHomeLocalDataSource(this.serviceBox, this.restaurantBox);

  // Services
  @override
  Future<void> cacheServices(List<ServiceModel> services) async {
    for (var service in services) {
      await serviceBox.put(service.hiveId, service);
    }
  }

  @override
  Future<void> clearCachedServices() async {
    await serviceBox.clear();
  }

  @override
  Future<List<ServiceModel>?> getCachedServices() async {
    return serviceBox.values.toList();
  }

  // Restaurants
  @override
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants) async {
    for (var restaurant in restaurants) {
      await restaurantBox.put(restaurant.restaurantId, restaurant);
    }
  }

  @override
  Future<void> clearCachedRestaurants() async {
    await restaurantBox.clear();
  }

  @override
  Future<List<RestaurantModel>?> getCachedRestaurants() async {
    return restaurantBox.values.toList();
  }
}
