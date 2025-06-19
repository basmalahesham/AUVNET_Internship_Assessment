import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/banner_entity.dart';

part 'banner_model.g.dart';

@HiveType(typeId: 3)
class BannerModel extends BannerEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  const BannerModel({
    required this.id,
    required this.imageUrl,
  }) : super(id: id, imageUrl: imageUrl);

  factory BannerModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return BannerModel(
      id: doc.id,
      imageUrl: map['image'] ?? '',
    );
  }
}

