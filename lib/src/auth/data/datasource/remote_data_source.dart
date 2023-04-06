import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/src/auth/data/datasource/exceptions.dart';
import 'package:grocery_app/src/auth/domain/use_cases/login_use_case.dart';
import 'package:grocery_app/src/auth/domain/use_cases/save_user_to_fire_store.dart';
import 'package:grocery_app/src/auth/domain/use_cases/sign_up_use_case.dart';

abstract class BaseRemoteAuthDataSource {
  Future<UserCredential> loginUser(LoginParameters parameters);

  Future<UserCredential> signUp(SignUpParameters parameters);

  Future<void> saveUserToFireStore(UserParameters parameters);
}

class AuthRemoteDataSource extends BaseRemoteAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFireStore;

  AuthRemoteDataSource(this.firebaseAuth, this.firebaseFireStore);

  @override
  Future<UserCredential> loginUser(LoginParameters parameters) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  @override
  Future<UserCredential> signUp(SignUpParameters parameters) async {
    try {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  @override
  Future<void> saveUserToFireStore(UserParameters parameters) async {
    try {
      final result = await firebaseFireStore
          .collection('user')
          .doc(parameters.userModel.uid)
          .set(
            parameters.userModel.toJson(),
          );
      return result;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }
}
