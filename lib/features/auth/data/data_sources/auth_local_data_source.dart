import 'package:auvnet_flutter_internship_assessment/features/auth/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource{
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCachedUser();
}
class HiveAuthLocalDataSource implements AuthLocalDataSource {
  final Box<UserModel> userBox;

  HiveAuthLocalDataSource(this.userBox);

  @override
  Future<void> cacheUser(UserModel user) async {
    await userBox.put('user', user);
  }

  @override
  Future<UserModel?> getCachedUser() async {
    return userBox.get('user');
  }

  @override
  Future<void> clearCachedUser() async {
    await userBox.clear();
  }
}
