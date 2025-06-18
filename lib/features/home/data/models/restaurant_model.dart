import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/restaurant_entity.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 2)
class RestaurantModel extends RestaurantEntity {
  @HiveField(0)
  final String restaurantId;

  @HiveField(1)
  final String restaurantName;

  @HiveField(2)
  final String restaurantImage;

  @HiveField(3)
  final String restaurantDeliveryTime;

  const RestaurantModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.restaurantDeliveryTime,
  }) : super(
    id: restaurantId,
    name: restaurantName,
    image: restaurantImage,
    deliveryTime: restaurantDeliveryTime,
  );

  factory RestaurantModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return RestaurantModel(
      restaurantId: doc.id,
      restaurantName: map['name'] ?? '',
      restaurantImage: map['image'] ?? '',
      restaurantDeliveryTime: map['deliveryTime'] ?? '',
    );
  }
}
