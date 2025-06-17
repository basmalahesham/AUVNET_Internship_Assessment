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
  const UserModel({required this.userId, required this.userEmail})
    : super(id: userId, email: userEmail);

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(userId: user.uid, userEmail: user.email ?? '');
  }

  Map<String, dynamic> toMap() {
    return {'id': userId, 'email': userEmail};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(userId: map['id'] ?? '', userEmail: map['email'] ?? '');
  }
}
