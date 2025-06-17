import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({required super.id, required super.imageUrl});

  factory BannerModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return BannerModel(id: doc.id, imageUrl: map['image'] ?? '');
  }
}
