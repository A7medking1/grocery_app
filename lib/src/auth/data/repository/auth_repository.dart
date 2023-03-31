import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/src/auth/data/datasource/exceptions.dart';
import 'package:grocery_app/src/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/src/auth/domain/repository/base_auth_repository.dart';
import 'package:grocery_app/src/auth/domain/use_cases/login_use_case.dart';
import 'package:grocery_app/src/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:grocery_app/src/core/error/failure.dart';

class AuthRepository extends BaseAuthRepository{

  final BaseRemoteAuthDataSource authDataSource;


  AuthRepository(this.authDataSource);

  @override
  Future<Either<Failure, UserCredential>> logIn(LoginParameters parameters) async{
    try{
      final result = await authDataSource.loginUser(parameters);
      return Right(result);
    }on AuthException catch(e){
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(SignUpParameters parameters) async{
    try{
      final result = await authDataSource.signUp(parameters);
      return Right(result);
    }on AuthException catch(e){
      return Left(ServerFailure(e.message!));
    }
  }

}