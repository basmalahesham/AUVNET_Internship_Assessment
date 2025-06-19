import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';

part 'user_profile_model.g.dart';

@HiveType(typeId: 4)
class UserProfileModel extends UserProfileEntity {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String userAddress;

  const UserProfileModel({
    required this.userId,
    required this.userName,
    required this.userAddress,
  }) : super(
    id: userId,
    name: userName,
    address: userAddress,
  );

  factory UserProfileModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return UserProfileModel(
      userId: doc.id,
      userName: map['name'] ?? '',
      userAddress: map['address'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'name': userName,
      'address': userAddress,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      userId: map['id'] ?? '',
      userName: map['name'] ?? '',
      userAddress: map['address'] ?? '',
    );
  }
}
