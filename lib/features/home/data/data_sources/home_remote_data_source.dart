import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';
import '../models/restaurant_model.dart';
import '../models/service_model.dart';
import '../models/user_profile_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> fetchBanners();
  Stream<List<ServiceModel>> fetchServices();
  Future<List<RestaurantModel>> fetchRestaurants();
  Future<UserProfileModel> fetchUserProfile(String userId);
}

class FirebaseHomeDataSource implements HomeRemoteDataSource {
  final FirebaseFirestore _firestore;
  FirebaseHomeDataSource(this._firestore);

  @override
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _firestore.collection('banners').get();
      return snapshot.docs.map((d) => BannerModel.fromDoc(d)).toList();
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
  }

  @override
  Stream<List<ServiceModel>> fetchServices() {
    return _firestore.collection('services').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ServiceModel.fromDoc(doc)).toList();
    });
  }

  @override
  Future<List<RestaurantModel>> fetchRestaurants() async {
    try {
      final snapshot = await _firestore.collection('restaurants').get();
      return snapshot.docs.map((d) => RestaurantModel.fromDoc(d)).toList();
    } catch (e) {
      throw Exception('Failed to fetch restaurants: $e');
    }
  }

  @override
  Future<UserProfileModel> fetchUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      final data = doc.data();
      if (data == null) throw Exception('User not found');
      return UserProfileModel.fromDoc(doc);
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }
}