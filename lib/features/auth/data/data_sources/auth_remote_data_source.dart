import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User> register(
      String email,
      String password,
      String name,
      String address,
      );
  Future<User> login(String email, String password);
}

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuthDataSource(this._firebaseAuth);

  @override
  Future<User> register(
      String email,
      String password,
      String name,
      String address,
      ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user!;
    await _firestore.collection('users').doc(user.uid).set({
      'email': email,
      'name': name,
      'address': address,
    });

    return user;
  }

  @override
  Future<User> login(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final snapshot = await _firestore.collection('users').doc(userId).get();
    return snapshot.data() ?? {};
  }
}
