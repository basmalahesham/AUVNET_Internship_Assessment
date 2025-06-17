import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.address,
    required super.imageUrl,
  });

  factory UserProfileModel.fromMap(String docId, Map<String, dynamic> map) {
    return UserProfileModel(
      id: docId,
      name: map['name'] as String? ?? '',
      address: map['address'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }
}