import 'package:auvnet_flutter_internship_assessment/features/home/data/models/banner_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/restaurant_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/srevice_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> fetchBanners();
  Future<List<ServiceModel>> fetchServices();
  Future<List<RestaurantModel>> fetchRestaurants();
  Future<UserProfileModel> fetchUserProfile(String userId);

}

class FirebaseHomeDataSource implements HomeRemoteDataSource {
  final FirebaseFirestore _firestore;
  FirebaseHomeDataSource(this._firestore);

  @override
  Future<List<BannerModel>> fetchBanners() async {
    final snapshot = await _firestore.collection('banners').get();
    return snapshot.docs.map((d) => BannerModel.fromMap(d.data())).toList();
  }

  @override
  Future<List<ServiceModel>> fetchServices() async {
    final snapshot = await _firestore.collection('services').get();
    return snapshot.docs
        .map((doc) => ServiceModel.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<List<RestaurantModel>> fetchRestaurants() async {
    final snapshot = await _firestore.collection('restaurants').get();
    return snapshot.docs
        .map((doc) => RestaurantModel.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<UserProfileModel> fetchUserProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return UserProfileModel.fromMap(doc.id, doc.data()!);
  }
}
