import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/src/auth/domain/use_cases/login_use_case.dart';
import 'package:grocery_app/src/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:grocery_app/src/core/error/failure.dart';

abstract class BaseAuthRepository
{

  Future<Either<Failure, UserCredential>> logIn(LoginParameters parameters);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserCredential>> signUp(SignUpParameters parameters);
}
