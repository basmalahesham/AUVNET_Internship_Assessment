import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String userEmail;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String userAddress;

  const UserModel({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userAddress,
  }) : super(
    id: userId,
    email: userEmail,
    name: userName,
    address: userAddress,
  );

  factory UserModel.fromFirebaseUser(User user,
      {required String name,
        required String address,
        }) {
    return UserModel(
      userId: user.uid,
      userEmail: user.email ?? '',
      userName: name,
      userAddress: address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'email': userEmail,
      'name': userName,
      'address': userAddress,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['id'] ?? '',
      userEmail: map['email'] ?? '',
      userName: map['name'] ?? '',
      userAddress: map['address'] ?? '',
    );
  }
}
