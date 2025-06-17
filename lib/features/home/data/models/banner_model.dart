import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({required super.id, required super.imageUrl});

  factory BannerModel.fromMap(Map<String, dynamic> map) => BannerModel(
    id: map['id'] ?? '',
    imageUrl: map['image'],
  );
}
