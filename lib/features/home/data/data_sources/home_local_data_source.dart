import 'package:auvnet_flutter_internship_assessment/features/home/data/models/service_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/restaurant_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/banner_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/user_profile_model.dart';
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

  // Banners
  Future<void> cacheBanners(List<BannerModel> banners);
  Future<List<BannerModel>?> getCachedBanners();
  Future<void> clearCachedBanners();

  // User Profile
  Future<void> cacheUserProfile(UserProfileModel user);
  Future<UserProfileModel?> getCachedUserProfile();
  Future<void> clearCachedUserProfile();
}

class HiveHomeLocalDataSource implements HomeLocalDataSource {
  final Box<ServiceModel> serviceBox;
  final Box<RestaurantModel> restaurantBox;
  final Box<BannerModel> bannerBox;
  final Box<UserProfileModel> userProfileBox;

  HiveHomeLocalDataSource(
    this.serviceBox,
    this.restaurantBox,
    this.bannerBox,
    this.userProfileBox,
  );

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

  // Banners
  @override
  Future<void> cacheBanners(List<BannerModel> banners) async {
    for (var banner in banners) {
      await bannerBox.put(banner.id, banner);
    }
  }

  @override
  Future<void> clearCachedBanners() async {
    await bannerBox.clear();
  }

  @override
  Future<List<BannerModel>?> getCachedBanners() async {
    return bannerBox.values.toList();
  }

  // User Profile
  @override
  Future<void> cacheUserProfile(UserProfileModel user) async {
    await userProfileBox.put('profile', user);
  }

  @override
  Future<UserProfileModel?> getCachedUserProfile() async {
    return userProfileBox.get('profile');
  }

  @override
  Future<void> clearCachedUserProfile() async {
    await userProfileBox.clear();
  }
}
