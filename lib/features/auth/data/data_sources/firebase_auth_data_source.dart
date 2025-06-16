import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  @override
  Future<User> register(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }
}
