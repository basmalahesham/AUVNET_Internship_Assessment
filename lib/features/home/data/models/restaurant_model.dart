import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.image,
    required super.deliveryTime,
  });

  factory RestaurantModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return RestaurantModel(
      id: doc.id,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      deliveryTime: map['deliveryTime'] ?? '',
    );
  }
}
